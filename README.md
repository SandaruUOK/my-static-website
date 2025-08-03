# My Static Website

A simple static website with automated deployment using GitHub Actions and Google Cloud Storage.

## Features

* 📱 Responsive design
* 🚀 Automated deployment with GitHub Actions
* ☁️ Hosted on Google Cloud Storage
* 🔐 Secure CI/CD pipeline

## Quick Setup

### Prerequisites
* GitHub account
* Google Cloud Platform account

### Deployment Setup

1. **Create Google Cloud Project & Service Account**
   * Go to [Google Cloud Console](https://console.cloud.google.com)
   * Create service account with **Storage Admin** role
   * Download JSON key file

2. **Add GitHub Secret**
   * Repository Settings > Secrets > Actions
   * Add `GCP_SA_KEY`: Paste JSON key content

3. **Push to GitHub**
   ```bash
   git add .
   git commit -m "Setup deployment"
   git push origin main
   ```

## How It Works

Every push to `main` branch automatically:
1. Authenticates with Google Cloud
2. Creates/updates storage bucket
3. Uploads website files
4. Makes site publicly accessible

**Website URL**: `https://storage.googleapis.com/your-bucket-name/index.html`

## Local Development

```bash
git clone https://github.com/yourusername/repo-name.git
cd repo-name
python -m http.server 8000
```

Open `http://localhost:8000`

## Project Structure

```
├── index.html
├── styles.css
├── script.js
└── .github/workflows/deploy.yml
```

## Troubleshooting

* **Auth errors**: Check `GCP_SA_KEY` secret is complete JSON
* **Bucket exists**: Use unique bucket name in workflow
* **Upload fails**: Verify file paths and service account permissions

## License

MIT License
