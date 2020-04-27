#!/bin/bash

cd /home/pi/MyMashedDuet
git pull
git add -A duet3
# git reset duet3/dsf_sd/www
git commit -m "Changes from DSF Detected"
git push
