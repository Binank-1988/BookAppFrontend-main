#!/bin/bash
set -e

cd /app

# REMOVED: npm install -g npm@latest (This was causing the crash)

# Install dependencies using your existing npm/node versions
npm install

# Run the build (Added the legacy provider flag for Node 18 compatibility)
NODE_OPTIONS=--openssl-legacy-provider npm run build

# Deploy
mkdir -p /var/www/html
cp -r build/* /var/www/html/

# Install PM2
npm install pm2 -g
