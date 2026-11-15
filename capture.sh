#!/bin/bash
# capture.sh - take one 720p picture from a  camera on the Ventuno Q
# Usage: capture.sh [camera] [name]

CAM=${1:-0}
NAME=${2:-cam$CAM-$(DATE +%Y%m%d-%H%M%S)}
mkdir -p "$HOME/Pictures"

timeout -s INT 3 gst-launch-1.0 -e qtiqmmfsrc camera=$CAM ! video/x-raw,format=NV12,width=1280,height=720,framerate=30/1 ! videoconvert ! jpegenc ! multifilesink location="$HOME/Pictures/$NAME-%04d.jpg" max-files=1 > /tmp/capture.log 2>&1

ls -t "$HOME/Pictures/$NAME"-*.jpg | head -n 1

