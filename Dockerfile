FROM debian:buster
COPY srcs/script.sh .
RUN echo 'coucou les amis'
RUN script.sh