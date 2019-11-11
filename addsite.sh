#!/bin/bash

path="/var/www/$1/"
lock="/var/www/$1/.lock"

mkdir $path 
chmod 0777 $path

touch $lock
chmod 0777 $lock

echo -e $(date) > $lock #

site="/etc/apache2/sites-available/$1.conf"

touch $site
chmod 0777 $site

echo -e '<VirtualHost *:80>\n ServerAdmin webmaster@'$1'\n ServerName '$1'\n ServerAlias www.'$1'\n DocumentRoot '$path'\n ErrorLog /var/log/apache2/error.log\n CustomLog /var/log/apache2/access.log combined\n <Directory "'$path'">\n AllowOverride All\n </Directory>\n </VirtualHost>' > $site

a2ensite $1

/etc/init.d/apache2 reload
