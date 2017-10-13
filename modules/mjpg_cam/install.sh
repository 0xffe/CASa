#!/bin/sh

echo "Installing MJPG_CAM"
sudo cp mjpg_cam /usr/local/bin 
sudo cp output_http.so input_uvc.so /usr/local/lib/ 
#mjpg_cam -i "input_uvc.so -d /dev/video0 -r 1280x720 -f 10" -o "output_http.so -p 8080 -w /usr/local/www"
echo "Start MJPG_CAM"
mjpg_cam -b
