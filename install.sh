#########################################################################
#LAMP for Raspberry Pi                                                  #
#This script will install Apache, PHP, FTP, and MySQL.                  #
#This script was written by Harbour, Justin                             #
#[C] 2013 Justin Harbour: See LICENSE.md for details                    #
#########################################################################

#!/bin/bash

#Prerequisites
sudo apt-get update

#Zeroconf/Bonjour
sudo apt-get install -y avahi-daemon

#FTP
sudo apt-get install -y proftpd

#Apache
sudo apt-get install -y apache2
sudo echo "ServerName localhost" >> /etc/apache2/apache2.conf

#PHP
sudo apt-get install -y php5 libapache2-mod-php5 php5-intl php5-mcrypt php5-curl php5-gd php5-sqlite php-pear php-apc

#MySQL
sudo apt-get install -y mysql-server mysql-client php5-mysql

#phpMyAdmin
sudo apt-get install -y phpmyadmin

#Additional Dependencies
#sudo apt-get install -y nmap zenmap

#With apache2 and php5 installed you need to make three changes in the file
#sudo gedit /etc/php5/apache2/php.ini
#Search for entry post_max_size = 2M where you need to enter a larger number than the size of your database (15M in this case) i.e. 25M, next edit memory_limit and give a larger number than the one given to post_max_size. At last, edit the entry upload_max_filesize with a value smaller than post_max_size.
#Starting from bigger values the order should go like this

#    memory_limit
#    post_max_size
#    upload_max_filesize

#Restart apache (for ex: sudo /etc/init.d/apache2 restart) and you are set.
#Don't forget to Restart Apache Services for changes to get applied


