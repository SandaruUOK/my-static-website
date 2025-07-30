#!/bin/bash

# Google Cloud Storage Static Website Setup Script
# Make sure you've run 'gcloud init' first

# Variables - Update these with your values
PROJECT_ID="my-static-website-467508"  
BUCKET_NAME="my-static-website-bucket"  
REGION="us-central1"  
SERVICE_ACCOUNT_NAME="github-actions-sa"

echo "🚀 Setting up Google Cloud Storage static website hosting..."
echo "Project ID: $PROJECT_ID"
echo "Bucket name: $BUCKET_NAME"
echo "Region: $REGION"

# Set the project
gcloud config set project $PROJECT_ID

# Create storage bucket
echo "📦 Creating Cloud Storage bucket..."
gsutil mb -p $PROJECT_ID -c STANDARD -l $REGION gs://$BUCKET_NAME

# Make bucket publicly readable
echo "🔓 Setting up public access..."
gsutil iam ch allUsers:objectViewer gs://$BUCKET_NAME

# Configure bucket for static website hosting
echo "🌐 Configuring static website hosting..."
gsutil web set -m index.html -e error.html gs://$BUCKET_NAME

# Set up CORS for web access (optional but recommended)
cat > cors.json << EOF
[
  {
    "origin": ["*"],
    "method": ["GET", "HEAD"],
    "maxAgeSeconds": 3600
  }
]
EOF

gsutil cors set cors.json gs://$BUCKET_NAME

# Create service account for GitHub Actions
echo "🔑 Creating service account for GitHub Actions..."
gcloud iam service-accounts create $SERVICE_ACCOUNT_NAME \
    --description="Service account for GitHub Actions deployment" \
    --display-name="GitHub Actions Service Account"

# Grant necessary permissions to service account
echo "🛡️ Granting permissions..."
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SERVICE_ACCOUNT_NAME@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/storage.objectAdmin"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SERVICE_ACCOUNT_NAME@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/storage.bucketReader"

# Create and download service account key
echo "🗝️ Creating service account key..."
gcloud iam service-accounts keys create gcp-key.json \
    --iam-account=$SERVICE_ACCOUNT_NAME@$PROJECT_ID.iam.gserviceaccount.com

echo "✅ Google Cloud setup complete!"
echo ""
echo "📋 Important Information:"
echo "Project ID: $PROJECT_ID"
echo "Bucket Name: $BUCKET_NAME"
echo "Region: $REGION"
echo "Service Account: $SERVICE_ACCOUNT_NAME@$PROJECT_ID.iam.gserviceaccount.com"
echo "Website URL: https://storage.googleapis.com/$BUCKET_NAME/index.html"
echo ""
echo "🔑 GitHub Secrets to Add:"
echo "1. GCP_PROJECT_ID: $PROJECT_ID"
echo "2. GCP_BUCKET_NAME: $BUCKET_NAME"
echo "3. GCP_SA_KEY: (contents of gcp-key.json file)"
echo ""
echo "⚠️  IMPORTANT: The gcp-key.json file contains sensitive credentials!"
echo "   - Copy its contents to GitHub secrets"
echo "   - Delete the file afterwards for security"
echo ""
echo "🚀 Next steps:"
echo "1. Add the secrets to your GitHub repository"
echo "2. Update your GitHub Actions workflow"
echo "3. Push your code to trigger deployment"

# Clean up temporary files
rm cors.json

echo ""
echo "🎉 Ready to deploy your static website to Google Cloud!"