#!/bin/bash
# Nivel medio: comandos ejecutados

# --- Desde el equipo local (WSL2) ---
ssh -i ~/.ssh/keypair-cdist.pem ec2-user@54.209.9.51

# --- En servidor-web-publico ---
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl status httpd
sudo usermod -a -G apache ec2-user
exit                      # volver a entrar para que se aplique el grupo
groups
sudo nano /etc/httpd/conf/httpd.conf      # ver httpd.conf.fragmento

sudo chown -R ec2-user:apache /var/www/html/
sudo chmod 2775 /var/www/html && find /var/www/html -type d -exec sudo chmod 2775 {} \;
find /var/www/html -type f -exec sudo chmod 0664 {} \;

echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
rm /var/www/html/phpinfo.php

cd ~
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp wordpress/wp-config-sample.php wordpress/wp-config.php
nano wordpress/wp-config.php              # ver wp-config.php
cp -r wordpress/* /var/www/html/
echo "define('FS_METHOD', 'direct');" >> /var/www/html/wp-config.php

# --- En servidor-privado ---
sudo systemctl start mariadb
sudo systemctl enable mariadb
mysql -u root -p          # ver mariadb-wordpress.sql
sudo systemctl status mariadb
