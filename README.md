# mi-debian-php-apache
Ejercicio 3 de la práctica de Docker: DEBIAN + APACHE + PHP

Crear imagen
$ docker build -t mi-debian-php:apache

Crear contenedor
$ docker run –name debian-php-apache -p 8080:80 -p 8443:443 -d mi-debian-php:apache
