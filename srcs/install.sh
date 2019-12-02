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
mv ./tmp/phpMyAdmin-4.9.2-english.tar.gz phpMyAdmin.tar.gz
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
mysql wordpress -u root --password=  < /tmp/dump.sql

#Setup PHP7.3
service php7.3-fpm start

#Setup Certificates
cd certificates && ./mkcert localhost
cd ..

#Setup wordpress
cp /tmp/wordpress.tar.gz /var/www/localhost/wordpress.tar.gz
cd /var/www/localhost && tar -xzf wordpress.tar.gz && rm wordpress.tar.gz
cd ../../..
mv /tmp/wp-config.php var/www/localhost/wordpress
mv /tmp/index.html var/www/localhost/index.html

#Setup phpMyAdmin
mv /tmp/phpmyadmin.config.php /var/www/localhost/phpmyadmin/config.inc.php
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

#Overall restart
service mysql restart
service php7.3-fpm restart
service nginx restart