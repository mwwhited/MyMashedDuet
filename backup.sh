#!/bin/bash

cd /home/pi/MyMashedDuet
git pull
rsync /home/pi/MyMashedDuet/duet3/dsf/sd /opt/dsf -rv --exclude *.bin
rsync /opt/dsf/sd /home/pi/MyMashedDuet/duet3/dsf -rv --exclude *.bin
sudo chown pi:pi . -R
git add -A duet3
# git reset duet3/dsf_sd/www
git commit -m "Changes from DSF Detected"
git push
