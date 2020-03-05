service php7.3-fpm start
service nginx start
service mysql start
cp /var/www/html/index.nginx-debian.html .
rm /var/www/html/index.nginx-debian.html
mysql -u root -p="root" < handledatabase
rm /etc/nginx/sites-available/localhost
cp localhost /etc/nginx/sites-available/localhost
rm /etc/nginx/sites-enabled/localhost
sudo ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
service nginx restart
service mysql stop
service mysql start
tail -f /var/log/nginx/access.log /var/log/nginx/error.log
