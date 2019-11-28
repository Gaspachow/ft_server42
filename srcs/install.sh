# Create subfolders
mkdir -p /var/www/localhost/phpmyadmin
mkdir certificates

# Install Update, wgetm nginx, PHP, phpMyAdmin, mariadb, mkcert (SSL Certificate)
apt-get update
apt-get upgrade -y
apt-get install wget -y
apt-get install nginx -y
apt-get install mariadb-server -y
apt-get install libnss3-tools -y
apt-get install php7.3 php7.3-fpm php7.3-mysql php-mbstring php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline -y
wget -O phpMyAdmin.tar.gz https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.gz
tar xzf phpMyAdmin.tar.gz --strip-components=1 -C /var/www/localhost/phpmyadmin
rm phpMyAdmin.tar.gz
wget -O mkcert https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64
mv mkcert certificates/mkcert
chmod +x certificates/mkcert
./certificates/mkcert -install


#Setup nginx
service nginx start
mv /tmp/nginx-config.conf etc/nginx/sites-available/localhost
cp etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

#Setup mysql
service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root
mysql wordpress -u root --password=  < /dump.sql

#Setup PHP7.3
service php7.3-fpm start

#Setup phpMyAdmin
mv /tmp/phpmyadmin.config.php /var/www/localhost/phpmyadmin/config.inc.php
chown -R www-data:www-data /var/www/*
chmod -R 777 /var/www/*

#Setup Certificates
cd certificates && ./mkcert localhost
cd ..

#Setup wordpress
wget -O wordpress.tar.gz https://wordpress.org/latest.tar.gz
mv wordpress.tar.gz /var/www/localhost/wordpress.tar.gz
cd /var/www/localhost && tar -xzf wordpress.tar.gz && rm wordpress.tar.gz

#Overall restart
service mysql restart
service php7.3-fpm restart
service nginx restart