#!/bin/bash
# Nivel básico: comandos ejecutados (no es un script para lanzar de una vez)

# --- Desde el equipo local ---
ssh -i ~/keypair-cdist.pem ec2-user@54.209.9.51
scp -i ~/keypair-cdist.pem ~/keypair-cdist.pem ec2-user@54.209.9.51:/home/ec2-user/keypair-cdist.pem

# --- En servidor-web-publico (10.0.0.4 / 10.0.128.4) ---
hostname -I
ip addr
ip route
ping 10.0.128.5
chmod 400 keypair-cdist.pem
ssh -i keypair-cdist.pem ec2-user@10.0.128.5

# --- En servidor-privado (10.0.128.5), con salida temporal a internet ---
hostname -I
ping www.google.com
sudo dnf update -y
sudo dnf install -y mariadb105-server
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql_secure_installation
mysql -u root -p          # ver mariadb-servidor-privado.sql

# --- De vuelta en servidor-web-publico ---
sudo dnf install -y mariadb105
mysql -h 10.0.128.5 -u publico -p
#   SHOW DATABASES; USE test; SHOW TABLES;
