-- Ejecutado en servidor-privado (10.0.128.5) como root:  mysql -u root -p
-- Usuario y base de datos de prueba para comprobar la conexión desde el servidor público

CREATE USER 'publico'@'%' IDENTIFIED BY '********';
CREATE DATABASE `test`;
GRANT ALL PRIVILEGES ON `test`.* TO 'publico'@'%';
FLUSH PRIVILEGES;
