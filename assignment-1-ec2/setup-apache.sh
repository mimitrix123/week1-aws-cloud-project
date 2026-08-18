#!/bin/bash
set -e

sudo apt update
sudo apt install -y apache2
sudo systemctl enable --now apache2

echo "Apache installation complete."
echo "Open http://YOUR_EC2_PUBLIC_IP in your browser."
