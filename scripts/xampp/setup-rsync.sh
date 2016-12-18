#!/usr/bin/env bash
set -e
set +x
apt update && apt install rsync -y && apt clean
