# Infraestructura del nivel básico (consola de AWS, us-east-1)

## VPC (asistente "VPC y más")

| Parámetro | Valor |
| --- | --- |
| Nombre | proyecto-vpc |
| CIDR IPv4 | 10.0.0.0/16 |
| Zonas de disponibilidad | 2 (us-east-1a, us-east-1b) |
| Subredes públicas / privadas | 2 / 2 |
| NAT Gateway | Ninguno |
| VPC endpoints | Ninguno |
| Internet Gateway | proyecto-igw |

| Subred | Tipo | CIDR | AZ |
| --- | --- | --- | --- |
| proyecto-subnet-public1-us-east-1a | Pública | 10.0.0.0/20 | us-east-1a |
| proyecto-subnet-public2-us-east-1b | Pública | 10.0.16.0/20 | us-east-1b |
| proyecto-subnet-private1-us-east-1a | Privada | 10.0.128.0/20 | us-east-1a |
| proyecto-subnet-private2-us-east-1b | Privada | 10.0.144.0/20 | us-east-1b |

## Security Groups (reglas de entrada)

grupo-publico

| Tipo | Puerto | Origen |
| --- | --- | --- |
| SSH | 22 | 163.117.0.0/16 (red UC3M) |
| HTTP | 80 | 0.0.0.0/0 |
| HTTPS | 443 | 0.0.0.0/0 |

grupo-privado

| Tipo | Puerto | Origen |
| --- | --- | --- |
| MySQL/Aurora | 3306 | grupo-publico |
| SSH | 22 | grupo-publico |
| Todo el tráfico | Todos | grupo-privado |

## Instancias EC2 (Amazon Linux 2023, t2.micro, key pair keypair-cdist)

| Instancia | Interfaz | Subred | IP privada | Security Group |
| --- | --- | --- | --- | --- |
| servidor-web-publico | enX0 | public1-us-east-1a | 10.0.0.4 | grupo-publico |
| servidor-web-publico | enX1 | private1-us-east-1a | 10.0.128.4 | grupo-privado |
| servidor-privado | enX0 | private1-us-east-1a | 10.0.128.5 | grupo-privado |

Elastic IP 54.209.9.51 asociada a la interfaz de 10.0.0.4.

## Salida temporal a internet del servidor privado (ya retirada)

- Elastic IP 52.55.192.195 asociada a servidor-privado (desasociada y liberada al terminar).
- Ruta 0.0.0.0/0 -> proyecto-igw en proyecto-rtb-private1-us-east-1a (eliminada al terminar).
