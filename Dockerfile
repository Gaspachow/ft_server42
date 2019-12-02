FROM debian:buster
# LABEL maintainer="gsmets@student.42.fr"
COPY srcs/install.sh ./
COPY srcs/nginx-config.conf ./tmp
COPY srcs/dump.sql ./tmp
COPY srcs/wp-config.php ./tmp
COPY srcs/wordpress.tar.gz ./tmp
COPY srcs/phpmyadmin.config.php ./tmp
COPY srcs/phpMyAdmin-4.9.2-english.tar.gz ./tmp