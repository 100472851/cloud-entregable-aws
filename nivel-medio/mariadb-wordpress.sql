-- Ejecutado en servidor-privado (10.0.128.5) como root:  mysql -u root -p
-- Usuario de WordPress limitado a la interfaz privada del servidor web (10.0.128.4)

CREATE USER 'publico'@'10.0.128.4' IDENTIFIED BY '********';
GRANT ALL PRIVILEGES ON `wordpress-db`.* TO 'publico'@'10.0.128.4';
FLUSH PRIVILEGES;
SHOW DATABASES;
SHOW GRANTS FOR 'publico'@'10.0.128.4';
