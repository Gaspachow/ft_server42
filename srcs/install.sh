# Create subfolders
mkdir -p /var/www/localhost
mkdir /var/www/localhost/phpmyadmin

# Install Update, wgetm nginx, PHP, phpMyAdmin, mariadb
apt-get update
apt-get upgrade -y
apt-get install wget -y
apt-get install nginx -y
apt-get install mariadb-server -y
apt-get install php7.3 php7.3-fpm php7.3-mysql php-mbstring php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline -y
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.gz
tar xzf phpMyAdmin-latest-english.tar.gz --strip-components=1 -C /var/www/localhost/phpmyadmin
rm phpMyAdmin-latest-english.tar.gz


#Setup nginx
service nginx start
mv /tmp/nginx-config.conf etc/nginx/sites-enabled/default
service nginx reload

#Setup PHP7.3
service php7.3-fpm start

#Setup phpMyAdmin
mv /tmp/phpmyadmin.config.php /var/www/localhost/phpmyadmin/config.inc.php 


