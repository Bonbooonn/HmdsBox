echo -e "\n --- Installing Libraries --- \n"

# Update packages
apt-get update

# nginx
apt-get install -y nginx

# mysql password
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

# install mysql
apt-get install -y mysql-server

# php repo
add-apt-repository ppa:ondrej/php
apt-get update

# php
apt-get install -y php8.1-fpm php8.1-cli php8.1-curl php8.1-mysql php8.1-sqlite3 php8.1-gd php8.1-xml php8.1-mcrypt php8.1-mbstring php8.1-iconv

service nginx restart
service php8.1-fpm restart

echo -e "\n --- Libraries Installed --- \n"