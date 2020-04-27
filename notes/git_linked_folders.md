# Linked folders in GIT

Git does not follow symbolic links for directories.  Use mount binding to fix.

```bash
mkdir /home/pi/MyMashedDuet/duet3/dsf_sd
sudo mount --bind /opt/dsf/sd /home/pi/MyMashedDuet/duet3/dsf_sd
```  