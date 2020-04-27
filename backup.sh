#!/bin/bash

cd /home/pi/MyMashedDuet
git pull
rsync /home/pi/MyMashedDuet/duet3/dsf /opt/dsf/sd -rv
rsync /opt/dsf/sd /home/pi/MyMashedDuet/duet3/dsf -rv
sudo chown pi:pi . -R
git add -A duet3
# git reset duet3/dsf_sd/www
git commit -m "Changes from DSF Detected"
git push
