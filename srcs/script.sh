service php7.3-fpm start
service nginx start
service mysql start
mysql -u root -p="root" < handledatabase
sudo ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
service nginx restart
service mysql stop
service mysql start
tail -f /var/log/nginx/access.log /var/log/nginx/error.log
