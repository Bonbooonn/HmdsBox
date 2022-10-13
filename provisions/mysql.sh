echo -e "\n --- Setting up mysql database --- \n"

# Variables
DBHOST=localhost
DBNAME=hmds_main
DBUSER=root
DBPASSWORD=root

# Create Database
mysql --user='root' --password="$DBPASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DBNAME DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_unicode_ci"


# Laravel Migrations
cd /var/www/hmds_api 
php artisan migrate


echo -e "\n --- Setting up mysql done --- \n"