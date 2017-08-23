#!/usr/bin/env bash
set -e
set +x
apt update && apt install libgtk2.0-0 libgconf-2-4 libasound2 libxtst6 libxss1 libnss3 xvfb -y && apt clean
