FROM debian:bullseye-slim

RUN apt-get update -y && \
    apt-get install -y libapache2-mod-php apache2 php && \
    apt-get install -y vim nano net-tools
RUN mkdir -p /var/www/html/web1/
RUN mkdir -p /etc/apache2/tls/
RUN mkdir -p /var/run/apache2 /var/log/apache2

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_LOG_DIR /var/log/apache2

COPY web1/web1.com.conf /etc/apache2/sites-available/
COPY web1/ /var/www/html/web1/
COPY web1/tls/ /etc/apache2/tls/

RUN a2enmod rewrite && \
    a2enmod ssl && \
    a2ensite web1.com.conf

EXPOSE 80
EXPOSE 443

CMD ["apache2", "-D", "FOREGROUND"]
