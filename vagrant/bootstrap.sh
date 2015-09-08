#/usr/bin/env bash

# Use single quotes instead of double quotes to make it work with special-character passwords

mkdir /root/jamaldeemer/www

chown www-data /root
chgrp www-data /root
chmod 755 /root

chown www-data /root/jamaldeemer
chgrp www-data /root/jamaldeemer
chmod 755 /root/jamaldeemer

sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get install -y apache2
sudo apt-get install -y php5

# setup hosts file
VHOST=$(cat <<EOF
<VirtualHost *:80>
    DocumentRoot "/root/jamaldeemer/www/"
    <Directory "/root/jamaldeemer/www/">
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-available/000-default.conf
echo "${VHOST}" > /etc/apache2/sites-enabled/000-default.conf

DIRECTORY=$(cat <<EOF
<Directory "/root/jamaldeemer/www/">
    Options Indexes FollowSymLinks
    AllowOverride All
    Require all granted
</Directory>
EOF
)

echo "${DIRECTORY}" >> /etc/apache2/apache2.conf

echo "Adding some nice options to vimrc..."

echo "set tabstop=2" >> /root/.vimrc
echo "set shiftwidth=2" >> /root/.vimrc
echo "set softtabstop=2" >> /root/.vimrc
echo "set expandtab" >> /root/.vimrc
echo "set hlsearch" >> /root/.vimrc
echo "syntax on" >> /root/.vimrc

cp /root/.vimrc /home/vagrant/.vimrc

# restart apache
service apache2 restart

# install PHP GD, the graphic lib (we create captchas and avatars)
sudo apt-get -y install php5-gd

# install git
sudo apt-get -y install git

# final feedback
echo "Voila!"



