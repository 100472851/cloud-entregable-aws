#!/bin/bash
# Nivel avanzado (opción A, Amazon RDS): comandos ejecutados en servidor-web-publico

echo 'export RDS=wordpress-rds.cak9hpz1sdyu.us-east-1.rds.amazonaws.com' >> ~/.bashrc
source ~/.bashrc
echo $RDS
getent hosts $RDS                          # 10.0.148.38 (subred privada us-east-1b)

mysql -h $RDS -u admin -p --ssl            # ver rds-wordpress.sql
mysql -h $RDS -u wordpress-user -p --ssl -e "SHOW DATABASES"

cp /var/www/html/wp-config.php /var/www/html/wp-config.php.bak
nano /var/www/html/wp-config.php           # ver wp-config.php
grep "DB_" /var/www/html/wp-config.php
sudo systemctl restart httpd

# Comprobación de que WordPress guarda los datos en RDS
mysql -h $RDS -u wordpress-user -p --ssl wordpressdb
#   SHOW DATABASES; SHOW TABLES; SELECT * FROM wp_users;

# servidor-privado apagado: ya no hace falta
ssh -i keypair-cdist.pem ec2-user@10.0.128.5   # No route to host
