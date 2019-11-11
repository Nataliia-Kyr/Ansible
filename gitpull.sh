#!/bin/bash

cd /var/www/$HOSTNAME/ && sudo git pull

if  [ -f "/var/www/$HOSTNAME/update.sql" ]; then

  rm -r "/var/www/$HOSTNAME/update.sql"

fi
