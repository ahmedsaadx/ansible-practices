#!/bin/bash
a2ensite django.conf
a2dissite 000-default
systemctl restart apache2

cd /var/www/html/
rm index.html 
pip3 install -r requirements.txt


chown www-data:www-data -R  *

