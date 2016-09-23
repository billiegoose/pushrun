#!/usr/bin/env bash
set -e
# net-tools is needed by the XAMPP start service script.
# wget is only used to download the installer.
apt update && apt install net-tools wget -y
# Install script based on the XAMPP Linux FAQ
# https://www.apachefriends.org/faq_linux.html
# - How do I install XAMPP?
wget https://www.apachefriends.org/xampp-files/7.0.9/xampp-linux-x64-7.0.9-1-installer.run
chmod 755 xampp-linux-*-installer.run
./xampp-linux-*-installer.run --mode unattended
# - After I rebooted my Linux box XAMPP stopped running! How can I fix this?
ln -s /opt/lampp/lampp /etc/init.d/lampp
update-rc.d lampp start 80 2 3 4 5 . stop 30 0 1 6 .
