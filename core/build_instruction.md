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

### Step 3 - Initial start
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

### Step 4 - Compile & Installing BlueZ
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






