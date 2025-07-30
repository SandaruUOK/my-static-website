# My Static Website

A simple static website with automated deployment using GitHub Actions and Netlify.

## Features

- 📱 Responsive design
- 🚀 Automated deployment with GitHub Actions
- 🌐 Hosted on Netlify
- ✨ Smooth scrolling navigation
- 🎨 Modern CSS styling

## Project Structure

```
├── index.html          # Main HTML file
├── styles.css          # CSS styling
├── script.js           # JavaScript functionality
├── package.json        # Project configuration
├── README.md           # This file
└── .github/
    └── workflows/
        └── deploy.yml  # GitHub Actions workflow
```

## Getting Started

### Prerequisites

- GitHub account
- Netlify account
- Git installed on your computer

### Local Development

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name
   ```

2. Open `index.html` in your browser, or serve it locally:
   ```bash
   # Using Python 3
   python -m http.server 8000
   
   # Using Python 2
   python -m SimpleHTTPServer 8000
   
   # Using Node.js (if you have http-server installed)
   npx http-server
   ```

3. Open `http://localhost:8000` in your browser

### Deployment Setup

1. **Create a Netlify Site:**
   - Go to [Netlify](https://netlify.com)
   - Sign up/Sign in
   - Click "New site from Git"
   - Connect your GitHub repository
   - Note your Site ID from Site Settings

2. **Get Netlify Auth Token:**
   - Go to Netlify User Settings > Applications
   - Create a new Personal Access Token
   - Copy the token

3. **Add GitHub Secrets:**
   - Go to your GitHub repository
   - Navigate to Settings > Secrets and variables > Actions
   - Add these secrets:
     - `NETLIFY_AUTH_TOKEN`: Your Netlify auth token
     - `NETLIFY_SITE_ID`: Your Netlify site ID

4. **Push to GitHub:**
   ```bash
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```

### Automatic Deployment

Once set up, every push to the `main` branch will automatically:
1. Trigger the GitHub Actions workflow
2. Deploy your site to Netlify
3. Update your live website

## Customization

### Modifying Content
- Edit `index.html` to change the website content
- Update `styles.css` to modify the appearance
- Modify `script.js` to add new functionality

### Adding Pages
1. Create new HTML files (e.g., `about.html`, `contact.html`)
2. Update navigation links in `index.html`
3. Add corresponding JavaScript for navigation

### Build Process
If you want to add a build process (e.g., Sass, TypeScript, bundling):
1. Add dependencies to `package.json`
2. Add build scripts to `package.json`
3. Uncomment the build steps in `.github/workflows/deploy.yml`
4. Update the `publish-dir` in the workflow if needed

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test locally
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

If you have any questions or need help with setup, please open an issue in this repository.