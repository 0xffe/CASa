This folder containes the Web interface part of  CASa


### Installing Web Server

Install Lighttpd web server</br>
`sudo apt-get install lighttpd`</br>

Install php</br>
`sudo apt-get -y install php5-common php5-cgi php5`</br>
`sudo lighty-enable-mod fastcgi-php`</br>

Restart Lighttpd to apply new settings</br>
`sudo service lighttpd force-reload`</br>

Adjust permissions</br>
`sudo chown www-data:www-data /var/www`</br>
`sudo chmod 775 /var/www`</br>
`sudo usermod -a -G www-data pi`</br>

Install MySQL (remember password to accessing DB)</br>
`sudo apt-get install mysql-server`</br>
`sudo apt-get install mysql-client php5-mysql`</br>

Install phpMyAdmin utility (select configuring phpMyAdmin option and configure it)</br>
`sudo apt-get install phpmyadmin`</br>
`sudo cp -r /usr/share/phpmyadmin /var/www/html`</br>

Check phpMyAdmin functionality accessing http://raspberryIP/phpmyadmin
