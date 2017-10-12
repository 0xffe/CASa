# <b>C</b>ontrol <b>A</b>quarium <b>S</b>ystem alternative - CASa

This is about aquarium automation system including different sensors monitoring, sub-system devices controlling, cloud gatherning statistics & remote video monitoring. 

The system is based on Raspberry PI 3/Raspberry PI Zero W (RPI3/RPIW). 
The software core is based on open source <b>QT framework</b> & open source <b>wiringPi</b> framework.

MicroComputer RPI3/RPIW can stream video, can control external devices via GPIO, can communicate with Bluetooth network & can communicate with cloud service.

Project phases:
STAGE #1 - preparing software core
STAGE #2 - preparing GPIO controlling software
STAGE #3 - configuring system (WebServer\MySQL\PHP\scripting)
STAGE #4 - developing remote video monitoring web-service
STAGE #5 - developing application core
STAGE #6 - developing application modules
STAGE #7 - developing Bluetooth based sensors
TBD ... 

#Current project state
STAGE 1
 - qtbase crosscompile instruction (main core application)
 - qtconnectivity crosscompile instruction (needed for communication with Bluetooth sensors network) 
 
