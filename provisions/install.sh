echo -e "\n --- Installing Libraries --- \n"

# Update packages
apt-get update

echo -e "\n --- Installing Nginx --- \n"
# nginx
apt-get install -y nginx

echo -e "\n --- Installing Nginx End --- \n"

echo -e "\n --- Installing MySQL --- \n"
# mysql password
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

# install mysql
apt-get install -y mysql-server
echo -e "\n --- Installing MySQL END --- \n"


echo -e "\n --- Installing PHP --- \n"
# php repo
add-apt-repository ppa:ondrej/php
apt-get update

# php
apt-get install -y php8.1-fpm php8.1-cli php8.1-curl php8.1-mysql php8.1-sqlite3 php8.1-gd php8.1-xml php8.1-mcrypt php8.1-mbstring php8.1-iconv

echo -e "\n --- Installing PHP END --- \n"

echo -e "\n --- Installing Composer --- \n"
# composer
apt-get update
apt-get install php8.1-cli unzip
cd ~
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo -e $HASH
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

echo -e "\n --- Installing Composer END --- \n"
service nginx restart
service php8.1-fpm restart

echo -e "\n --- Libraries Installed --- \n"