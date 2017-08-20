#!/usr/bin/env bash
set -e
set +x
# wget is only used to download the installer.
# xz-utils is used by tar to extract Nodejs
apt update && apt install wget xz-utils -y && apt clean
# Install Nodejs
cd /opt
wget https://nodejs.org/dist/v8.4.0/node-v8.4.0-linux-x64.tar.xz
tar xf node-*.tar.xz
rm node-*.tar.xz
mv node-* node
# - Modify PATH
source /etc/environment
echo "PATH=\"/opt/node/bin:$PATH\"" >> /etc/environment
source /etc/environment
# Update npm
npm install --global npm@latest
npm list -g
