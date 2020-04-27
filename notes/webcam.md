# How to setup webcam for Duet3 + RPi

## Install FS WebCam


```bash
sudo apt install fswebcam
```

## Create 5 second timer in systemd

### Create service

[webcam.service](/etc/systemd/system/webcam.service)
```
[Unit]
Description=Take Webcam Image
[Service]
ExecStart=/bin/fswebcam -d /dev/video0 -r 800x600 -S 20 /opt/dsf/dwc2/image.jpg
```

[webcam.timer](/etc/systemd/system/webcam.timer)
```
[Unit]
Description=Run Webcam Every 5 Seconds

[Timer]
OnBootSec=5
OnUnitActiveSec=5
AccuracySec=1ms

[Install]
WantedBy=timers.target
```

Enable timer

```bash
sudo systemctl enable webcam.service
```

