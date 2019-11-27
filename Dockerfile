FROM debian:buster
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
CMD [ "php", "./your-script.php" ]
RUN echo 'coucou les amis'