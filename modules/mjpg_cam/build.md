### This is an instruction how to download, build & install MJPG_CAM module.

Install SVN to get access in the separate folders of the github</br>
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

Building</br>
`make USE_LIBV4L2=true clean all`</br>
`sudo make DESTDIR=/usr/local install`</br>

Copying libraries to the system folder</br>
`sudo cp mjpg_cam /usr/local/bin`</br>
`sudo cp output_http.so input_uvc.so /usr/local/lib/`</br>
`sudo cp -R www /usr/local/www`</br>

