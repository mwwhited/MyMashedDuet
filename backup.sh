#!/bin/bash

cd /home/pi/MyMashedDuet
git pull
sudo chown pi /opt/dsf/sd -R
#sync back was causing issues and not really needed
rsync /opt/dsf/sd /home/pi/MyMashedDuet/duet3/dsf -rv --exclude *.bin --exclude sd/gcodes/* --exclude sd/sys/lasttool.g --exclude sd/sys/config.g.bak --delete 
sudo chown pi:pi . -R
./prettyjson.sh
git add -A duet3
# git reset duet3/dsf_sd/www
git commit -m "Changes from DSF Detected: $(date)"
git push
