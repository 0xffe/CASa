# <b>C</b>ontrol <b>A</b>quarium <b>S</b>ystem alternative - CASa

This is about aquarium automation system including different sensors monitoring, sub-system devices controlling, cloud gatherning statistics & remote video monitoring. 

The system is based on Raspberry PI 3/Raspberry PI Zero W (RPI3/RPIW). 
The software core is based on open source <b>QT framework</b> & open source <b>wiringPi</b> framework.

MicroComputer RPI3/RPIW can stream video, can control external devices via GPIO, can communicate with Bluetooth network & can communicate with cloud service.

Project phases:
 - STAGE #1 - preparing software core
 - STAGE #2 - developing remote video monitoring web-service
 - STAGE #3 - preparing GPIO controlling software
 - STAGE #4 - configuring system (WebServer\MySQL\PHP\scripting)
 - STAGE #5 - developing remote video monitoring web-service
 - STAGE #6 - developing application core
 - STAGE #7 - developing application modules
 - STAGE #8 - developing Bluetooth based sensors
 - TBD ... 

# Current project state

**STAGE 2 - DONE!**
 - creatine video monitoring & web cam controlling service
 - launching web server/database/php
 - develope initial version of the CASa Web Interface
   
   
**STAGE 1 - DONE!**
 - qtbase crosscompile instruction (main core application)
 - qtconnectivity crosscompile instruction (needed for communication with Bluetooth sensors network) 
 
