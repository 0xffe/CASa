The core is based on Qt.<br/>
So first of all you need to build Qt libraries.<br/>
Follow to instructions below.<br/>

**Important:** this instruction was verified only with Raspberri PI3 & Raspberry PI Zero W (RPI3 & RPIW)

### Step 1 - Image preparing
Download the latest version of Raspbian images [here](https://www.raspberrypi.org/downloads/raspbian/) and install it on SD-card.
Oldiest [images](https://downloads.raspberrypi.org/raspbian/images/) of Raspbian can be used too. But supported Raspbian versions are Jessie & Stretch.

### Step 2 - Network configuration 
Using file manager copies **ssh** file into the root of SD-card (this allows ssh-connection to RPI3/RPIW).<br/>
Copies **wpa_supplicant.conf** file into the root of SD-card (this automatically configured Wi-Fi connection on RPI3/RPIW).<br/>
Modify **wpa_supplicant.conf** file - write a real SSID & password of your Wi-Fi networks. <br/>
Several Wi-Fi networks can be configured in this file (as it is on original file). It is usefull if your device moving from one location to another. If you are using only one Wi-fi network just keep only one configuration in the **wpa_supplicant.conf** file. <br/>

### Step 3 [on RPI] - Initial start
Insert SD-card into your RPI3/RPIW and power on.<br/> 
Connect to device using [Putty](www.putty.org) (or another terminal).<br/>
Default user/password for Raspbian - pi/raspberry.<br/>

Run following command & change user password on the menu.<br/>
`sudo raspi-config`<br/>
Then reboot.<br/>
`sudo reboot`<br/>

Update packages sources list (uncomment deb-src line)<br/>
`sudo nano /etc/apt/sources.list`<br/>

Update system & install necessary libraries<br/>
`sudo apt-get update`<br/>
`sudo apt-get build-dep qt4-x11 -y`<br/>
`sudo apt-get build-dep libqt5gui5 -y`<br/>
`sudo apt-get install libudev-dev libinput-dev libts-dev libxcb-xinerama0-dev libxcb-xinerama0 -y`<br/>
`sudo apt-get install libical-dev -y`<br/>
`sudo apt-get install bluetooth bluez libusb-dev libdbus-1-dev bluez-hcidump -y`<br/>

### Step 4 [on RPI] - Compile & Installing BlueZ
Originally Raspbian has BlueZ 5.23 installed it works fine with bluetooth devices. But unfortunately this version of BlueZ is incompatible with Qt qtconnectivity libraries.<br/> 
So you need to install newer (than BlueZ 5.37) version of BlueZ.<br/>
`mkdir bluez`<br/>
`cd bluez`<br/>
`wget http://www.kernel.org/pub/linux/bluetooth/bluez-5.44.tar.xz`<br/>
`tar xf bluez-5.44.tar.xz`<br/>
`cd bluez-5.44`<br/>
`./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-library`<br/>
`make`<br/>
`sudo make install`<br/>
`sudo ln -svf /usr/libexec/bluetooth/bluetoothd /usr/sbin/`<br/>
`sudo install -v -dm755 /etc/bluetooth`<br/>
`sudo install -v -m644 src/main.conf /etc/bluetooth/main.conf`<br/>
`sudo systemctl daemon-reload`<br/>
`sudo systemctl start bluetooth`<br/>

Verify you have installed right version of BlueZ by following command:<br/>
`bluetoothd --version`<br/>

Set pi user access to org.bluez by adding following lines into **bluetooth.conf**:<br/>
``
 <policy user="pi">
    <allow send_destination="org.bluez"/>
  </policy>
``

`sudo nano /etc/dbus-1/system.d/bluetooth.conf`<br/>
`sudo systemctl enable /lib/systemd/system/bluetooth.service`<br/>
`sudo reboot`<br/>


### Step 5 [on RPI] - Preparing QT folders
`sudo mkdir /usr/local/qt5pi`<br/>
`sudo chown pi:pi /usr/local/qt5pi`<br/>


### Step 6 [on Host] - Crosscompiling Qt
**It's is recommended to use Ubuntu 16.04 64-bit version as host for compiling Qt reasons.**<br/>
Creating necessaries folders & clone tools<br/>
`mkdir ~/opt`<br/>
`cd ~/opt`<br/>
`git clone https://github.com/raspberrypi/tools`<br/>

Create a sysroot. Using rsync we can properly keep things synchronized in the future as well. Replace raspberrypi.local with the IP address of the RPI3/RPIW:<br/>
`mkdir sysroot sysroot/usr sysroot/opt`<br/>
`rsync -avz pi@raspberrypi.local:/lib sysroot`<br/>
`rsync -avz pi@raspberrypi.local:/usr/include sysroot/usr`<br/>
`rsync -avz pi@raspberrypi.local:/usr/lib sysroot/usr`<br/>
`rsync -avz pi@raspberrypi.local:/opt/vc sysroot/opt`<br/>

Adjust symlinks to be relative. Use provided script, because the old fixQualifiedLibraryPaths is not working properly:<br/>
`wget https://raw.githubusercontent.com/riscv/riscv-poky/master/scripts/sysroot-relativelinks.py`<br/>
`chmod +x sysroot-relativelinks.py`<br/>
`./sysroot-relativelinks.py sysroot`<br/>

Get qtbase, configure Qt & build. The target directory is /usr/local/qt5pi on the RPI3/RPIW, the host tools like qmake will go to ~/opt/qt5, while make install will target ~/opt/qt5pi (this is what we will sync to the device). Don't forget to adjust paths if you changed that. For some reason the ~/ in the paths may not work, if this the case just use full paths. You need to change <qt-version> with a proper Qt version (for example 5.6, or 5.9.1; note that version 5.9.1 is a tag not a branch, so you may want to create a local branch with it). <br/>
`git clone git://code.qt.io/qt/qtbase.git -b 5.6.4`<br/>
`cd qtbase`<br/>
 - use -device linux-rasp-pi-g++ for Raspberry PI 1 & Zero W
 - use -device linux-rasp-pi2-g++ for Raspberry PI 2
 - use -device linux-rasp-pi3-g++ for Raspberry PI 3<br/>
 
`./configure -release -opengl es2 -device linux-rasp-pi-g++ -device-option CROSS_COMPILE=~/opt/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf- -sysroot ~/opt/sysroot -opensource -confirm-license -make libs -prefix /usr/local/qt5pi -extprefix ~/opt/qt5pi -hostprefix ~/opt/qt5 -v -no-use-gold-linker` <br/>

`make`<br/>
`make install`<br/>

Get qtconnectivity, configure & build. <br/>
`git clone git://code.qt.io/qt/qtconnectivity.git -b 5.6.4`<br/>
`cd qtconnectivity`<br/>
 
 Update **bluetooth.pro** file. <br/>
 `sudo nano ~/opt/qtconnectivity/src/bluetooth/bluetooth.pro`<br/>
 Find "#config_bluez:qtHaveModule(dbus) {" line<br/>
 and replace it with "!win32 {" line.<br/>
 Comment: here is a little bit of evil. Do not care about win32. Seriously it just quickest way to enable of building qtconnectivity libraries not stubbed as originally in Qt but libraries that really uses BlueZ!
 
`~/opt/qt5/bin/qmake qtconnectivity.pro -r`<br/>
`make`<br/>
`make install`<br/>

Copying Qt libraries to the RPI3/RPIW
`cd ~/opt`<br/>
`rsync -avz qt5pi pi@raspberrypi.local:/usr/local`<br/>

### Step 7 [on RPI] - Initializing the Qt libraries on the device
Update the device to let the linker find the Qt libs<br/>
`echo /usr/local/qt5pi/lib | sudo tee /etc/ld.so.conf.d/qt5pi.conf`<br/>
`sudo ldconfig`<br/>

That's it. Now you are able to develope Qt application and run it on RPI3/RPIW. 

