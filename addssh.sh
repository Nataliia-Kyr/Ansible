#!/bin/bash

cd /var/www/$1/
ssh-keygen -t rsa -b 4096 -C "floresnatalie.work@gmail.com"
ssh-add ~/.ssh/id_rsa
