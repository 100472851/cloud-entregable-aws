# Configuración de Amazon RDS (nivel avanzado, opción A)

## Security Group grupo-rds (VPC proyecto-vpc)

| Tipo | Puerto | Origen | Descripción |
| --- | --- | --- | --- |
| MySQL/Aurora | 3306 | grupo-publico | BD desde la interfaz publica |
| MySQL/Aurora | 3306 | grupo-privado | BD desde la interfaz privada |

## Grupo de subredes grupo-subredes-rds

| Subred | CIDR | AZ |
| --- | --- | --- |
| proyecto-subnet-private1-us-east-1a | 10.0.128.0/20 | us-east-1a |
| proyecto-subnet-private2-us-east-1b | 10.0.144.0/20 | us-east-1b |

## Instancia wordpress-rds

| Parámetro | Valor |
| --- | --- |
| Motor | MariaDB 11.8.8 |
| Plantilla | Capa gratuita (una sola AZ) |
| Clase | db.t4g.micro |
| Almacenamiento | 20 GiB gp2 |
| Usuario maestro | admin (contraseña autoadministrada, no incluida) |
| VPC | proyecto-vpc |
| Grupo de subredes | grupo-subredes-rds |
| Acceso público | No |
| Security Group | grupo-rds |
| Base de datos inicial | wordpressdb |
| Zona asignada | us-east-1b (IP privada 10.0.148.38) |
| Endpoint | wordpress-rds.cak9hpz1sdyu.us-east-1.rds.amazonaws.com:3306 |
| require_secure_transport | ON (valor por defecto en MariaDB 11.8) |
