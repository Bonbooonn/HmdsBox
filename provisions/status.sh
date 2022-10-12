echo -e "\n --- Checking Stack Status --- \n"

service nginx status
service php8.1-fpm status
service mysql status

echo -e "\n --- Checking Stack Status END --- \n"