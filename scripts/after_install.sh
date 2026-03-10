#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Navigate to app folder
cd /app

# 1. Update npm to the latest version to avoid compatibility warnings
npm install -g npm@latest

# 2. Use 'npm ci' if you have a package-lock.json (it's faster and cleaner for CI/CD)
# Or stick to 'npm install' but add --no-audit if you want to skip the security check logs
npm install

# 3. Try to fix what can be fixed automatically
npm audit fix

# 4. Build the project
# Note: If this fails, the 'set -e' above will stop the script here
npm run build

# 5. Deploy files
# Ensure the destination exists
mkdir -p /var/www/html
cp -r build/* /var/www/html

# 6. Install PM2
npm install pm2 -g
