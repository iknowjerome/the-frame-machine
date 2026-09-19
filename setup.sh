#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")"

echo "Installing system packages..."
sudo apt update
sudo xargs -a system-packages.txt apt install -y

echo "Creating Python environment if needed..."
if [ ! -d "/home/jerome/frame-tv-env" ]; then
    python3 -m venv /home/jerome/frame-tv-env
fi

echo "Installing Python dependencies..."
/home/jerome/frame-tv-env/bin/pip install --upgrade pip
/home/jerome/frame-tv-env/bin/pip install -r requirements.txt

echo "Setup complete."
