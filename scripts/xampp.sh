#!/usr/bin/env bash
set -e
echo Create SSH key
ssh-keygen -q -N '' -f 'pushrun'
echo Add SSH key to Digital Ocean
FINGERPRINT=$(doctl compute ssh-key import 'pushrun' --public-key-file='pushrun.pub' --format=FingerPrint --no-header)
echo Create droplet
ID=$(doctl compute droplet create xampp --image='ubuntu-16-04-x64' --region='nyc3' --size='512mb' --ssh-keys="$FINGERPRINT" --wait --format=ID --no-header)
echo Shut droplet off
doctl compute droplet-action power-off $ID --wait --format=Status --no-header
echo Resize droplet to 2G memory
doctl compute droplet-action resize $ID --size='2gb' --wait --format=Status --no-header
echo Power droplet on
doctl compute droplet-action power-on $ID --wait --format=Status --no-header
echo SSH into droplet and install XAMPP
IP=$(doctl compute droplet get $ID --format=PublicIPv4 --no-header)
ssh $IP -i 'pushrun' <<EOF
wget https://www.apachefriends.org/xampp-files/7.0.9/xampp-linux-x64-7.0.9-1-installer.run
chmod 755 xampp-linux-*-installer.run
./xampp-linux-*-installer.run --mode unattended
ln -s /opt/lampp/lampp /etc/init.d/lampp
update-rc.d lampp start 80 2 3 4 5 . stop 30 0 1 6 .
EOF
echo Shutdown droplet
doctl compute droplet-action power-off $ID --wait
echo Resize droplet to 512mb memory
doctl compute droplet-action resize $ID --size='512mb' --wait
echo Take snapshot
doctl compute droplet-action snapshot $ID --snapshot-name=xampp --wait
echo Delete droplet
doctl compute droplet delete $ID
echo Mission accomplished. You are awesome. Treat yourself to a cake.
