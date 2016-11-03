#!/usr/bin/env bash
set -e
set +x
# net-tools is needed by the XAMPP start service script.
# wget is only used to download the installer.
# xz-utils is used by tar to extract Nodejs
apt update && apt install wget xz-utils -y && apt clean
# Install Nodejs
cd /opt
wget https://nodejs.org/dist/v4.5.0/node-v4.5.0-linux-x64.tar.xz
tar xf node-*.tar.xz
rm node-*.tar.xz
mv node-* node
# - Modify PATH
source /etc/environment
echo "PATH=\"/opt/node/bin:$PATH\"" >> /etc/environment
# Update npm2 to npm3
npm install --global npm@3
