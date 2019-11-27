FROM debian:buster
LABEL maintainer="gsmets@student.42.fr"
COPY srcs/install.sh .
COPY srcs/nginx-config.conf ./tmp