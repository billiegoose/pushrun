#!/usr/bin/env bash
set -e
set +x
apt update && apt install xvfb -y && apt clean
