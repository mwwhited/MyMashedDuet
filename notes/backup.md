# How to setup autoback up to github for Duet3

## Create crontab entry

[crontab]*/etc/crontab*
```crontab
*/5 * * * * /home/pi/MyMashedDuet/backup.sh
```
