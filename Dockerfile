FROM debian:buster
COPY srcs/script.sh .
RUN echo 'coucou les amis'
CMD bash script.sh