#!/usr/bin/env bash
set -e
set +x
# ruby, ruby-dev, build-essential is needed to install mailcatcher
apt update && apt install ruby2.3-dev libsqlite3-dev build-essential -y
# Testing email server
gem install mailcatcher
