### This is a folder where stored source code for different modules used in the CASa

Currently added modules

## MGPG_CAM module
This module is used to control and provide video stream from the USB Web Camera connected to RPI3/RPIW. Camera switch On\Off functionality added to minimize power consumption of the CASa when video stream is unwanted.

Local CASa web server fully utilized functionality of this module and allows to user to switch On\Off the camera (hardware & service) and view video stream via web interface.

To get this module worked please follow the instruction in the [build.md](https://github.com/0xffe/CASa/tree/master/modules/mjpg_cam) file

**Recommendation:** the most suitable Web cams for MJPG_CAM are cameras which support jpeg streaming (for example Logitech C310). They generate video stream itself and do not use the RPI3/RPIW CPU resources. The average CPU load with such web camera service started is less than 1% (under 1280*720@10fps).







 
