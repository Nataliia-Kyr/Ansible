#!/bin/bash

if [ ! -f "/var/www/$HOSTNAME/.lock" ]; then

  date=$(date)

  cd /var/www/$HOSTNAME/

  sudo git add .
  sudo git diff-index --quiet HEAD || sudo git commit -m "$date"

  touch "/var/www/$HOSTNAME/.lock"
  echo -e $(date) > "/var/www/$HOSTNAME/.lock"

  git push --set-upstream origin master

  if [ -f "/var/www/$HOSTNAME/update.sql" ]; then

    rm -r "/var/www/$HOSTNAME/update.sql"

  fi

fi
