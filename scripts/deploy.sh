#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
DEPLOY_DIR="$HOME/Library/Application Support/activitywatch/aw-server/custom-webui"

echo "Building aw-webui-custom..."
cd "$PROJECT_DIR"
npm run build

echo "Deploying to $DEPLOY_DIR..."
rm -rf "$DEPLOY_DIR"
mkdir -p "$DEPLOY_DIR"
cp -r dist/* "$DEPLOY_DIR/"

echo "Deploy complete."
echo ""
echo "Note: The stock aw-server serves its bundled UI. To use this custom build,"
echo "run the dev server (npm run serve) and access http://localhost:27180"
echo "or replace the bundled static files if you build aw-server from source."
