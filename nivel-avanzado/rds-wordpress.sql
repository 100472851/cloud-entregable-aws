-- Ejecutado desde servidor-web-publico contra RDS como usuario maestro:
--   mysql -h $RDS -u admin -p --ssl
-- La base de datos wordpressdb la crea RDS al arrancar (nombre de base de datos inicial)

SELECT VERSION();
SHOW DATABASES;

CREATE USER 'wordpress-user'@'10.0.%' IDENTIFIED BY '********';
GRANT ALL PRIVILEGES ON `wordpressdb`.* TO 'wordpress-user'@'10.0.%';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'wordpress-user'@'10.0.%';
