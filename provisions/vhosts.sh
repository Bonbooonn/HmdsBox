echo -e "\n --- Nginx Vhost Configuration --- \n"
# Nginx

# Unlink default nginx conf
unlink /etc/nginx/sites-enabled/default

# Link files
ln -sf /etc/nginx/sites-available/* /etc/nginx/sites-enabled/

service nginx restart
service php8.1-fpm restart

echo -e "\n --- Nginx Vhost Configuration Done --- \n"