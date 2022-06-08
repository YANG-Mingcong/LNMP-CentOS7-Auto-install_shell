#run in root user
yum -y update;
yum -y upgrade;

systemctl stop firewalld;

#install nginx
yum -y install nginx;
systemctl start nginx;
systemctl enable nginx;
systemctl stop nginx;

#install mariadb
yum -y install mariadb mariadb-server;
systemctl start mariadb;
systemctl enable mariadb;

#install php
yum -y install \
https://repo.ius.io/ius-release-el7.rpm \
https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm;
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm;
yum -y install php74-devel php74-cli.x86_64 php74-common.x86_64 php74-gd.x86_64 php74-ldap.x86_64 php74-mbstring.x86_64 php74-pdo.x86_64 php74-mysqlnd php74-fpm php74-opcache php74-pecl-redis php74-xml;
systemctl start php-fpm;
systemctl enable php-fpm;
systemctl stop php-fpm;

systemctl daemon-reload;

#install cerbot
yum -y install snapd
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap

systemctl daemon-reload
snap install core
snap refresh core
snap install --classic certbot

ln -s /snap/bin/certbot /usr/bin/certbot




