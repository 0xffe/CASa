## This file describes necessary initial procedures to start develope CASa

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
