### This is an instruction how to download, build & install MJPG_CAM module.

Install SVN to download separate folders from CASa project git</br>
`sudo apt-get install subversion`</br>

Install additional libraries</br>
`sudo apt-get install libjpeg8-dev imagemagick libv4l-dev`</br>
`sudo ln -s /usr/include/linux/videodev2.h /usr/include/linux/videodev.h`</br>

Create building folder & clone sources</br>
`cd ~`</br>
`mkdir mjpg_cam`</br>
`cd mjpg_cam `</br>
`svn checkout https://github.com/0xffe/CASa/trunk/modules/mjpg_cam`</br>
`cd mjpg_cam`</br>

Building MJPG_CAM</br>
`make USE_LIBV4L2=true clean all`</br>
`sudo make DESTDIR=/usr/local install`</br>

Copying libraries to the system folders</br>
`sudo cp mjpg_cam /usr/local/bin`</br>
`sudo cp output_http.so input_uvc.so /usr/local/lib/`</br>
`sudo cp -R www /usr/local/www`</br>

Adding MJPG_CAM launch script into the CASa system</br>
**Warning:** this script is necessary because it is used by webserver (for web camera remote switch On\Off). </br>
`sudo cp ~/mjpg_cam/mjpg_cam/mjpg_cam.sh /usr/sbin`</br>
`sudo chmod 755 /usr/sbin/mjpg_cam.sh`</br>

Now you can start\stop MJPG_CAM service using commands below:</br>
`mjpg_cam.sh start`</br>
`mjpg_cam.sh stop`</br>
`mjpg_cam.sh restart`</br>
There is no reason to use this script manually. CASa system web server automatically utilizes this script functionality when user requested video stream from CASa web server pages.

After service successfully started you can find a video stream using link http://raspberryIp:8080

