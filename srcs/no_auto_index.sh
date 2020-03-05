service php7.3-fpm start
service nginx start
service mysql start
mysql -u root -p="root" < handledatabase
cp index.nginx-debian.html /var/www/html/index.nginx-debian.html
rm /etc/nginx/sites-available/localhost
cp localhostwithoutautoindex /etc/nginx/sites-available/localhost
rm /etc/nginx/sites-enabled/localhost
sudo ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
service nginx restart
service mysql stop
service mysql start
tail -f /var/log/nginx/access.log /var/log/nginx/error.log