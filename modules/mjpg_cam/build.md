### This is an instruction how to download, build & install MJPG_CAM module.

Install SVN to get access in the separate folders of the github

sudo apt-get install subversion

Install additional libraries
sudo apt-get install libjpeg8-dev imagemagick libv4l-dev
sudo ln -s /usr/include/linux/videodev2.h /usr/include/linux/videodev.h

Create building folder & clone sources
cd ~
mkdir mjpg_cam
cd mjpg_cam 
svn checkout https://github.com/0xffe/CASa/trunk/modules/mjpg_cam
cd mjpg_cam

Building
make USE_LIBV4L2=true clean all
sudo make DESTDIR=/usr/local install

Copying libraries to the system folder
sudo cp mjpg_cam /usr/local/bin
sudo cp output_http.so input_uvc.so /usr/local/lib/
sudo cp -R www /usr/local/www

