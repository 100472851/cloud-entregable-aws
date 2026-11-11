# Práctica entregable Cloud (AWS) – Computación Distribuida

Jacobo Gutiérrez (100472851) · Munir Akri (100522755) · Curso 2026/2027

Ficheros de configuración de la práctica: WordPress con base de datos remota en una VPC propia
y, en el nivel avanzado, con la base de datos en Amazon RDS. Las contraseñas y las claves
de WordPress están sustituidas por `********`.

La memoria completa, con todas las capturas y la explicación paso a paso, está en [`docs/memoria.pdf`](docs/memoria.pdf).

## Estructura

```
docs/
  memoria.pdf                   memoria entregada (43 páginas)
nivel-basico/
  infraestructura.md            VPC, subredes, Security Groups, instancias y Elastic IP
  mariadb-servidor-privado.sql  usuario publico y base de datos test
  comandos.sh                   comandos ejecutados
nivel-medio/
  wp-config.php                 WordPress apuntando a MariaDB en 10.0.128.5
  httpd.conf.fragmento          AllowOverride All en /var/www/html
  mariadb-wordpress.sql         usuario publico@10.0.128.4 sobre wordpress-db
  comandos.sh
nivel-avanzado/
  wp-config.php                 WordPress apuntando a RDS, con TLS (MYSQL_CLIENT_FLAGS)
  rds-configuracion.md          grupo-rds, grupo de subredes y parámetros de la instancia RDS
  rds-wordpress.sql             usuario wordpress-user@10.0.% sobre wordpressdb
  comandos.sh
```

Los `comandos.sh` recogen los comandos en el orden en que se ejecutaron; no están pensados para lanzarse de una vez.
