#!/bin/bash
#####################################################
## Script de Configuração do Servidor Vagrant LAMP ##
##                 BY: vendettafv                  ##
#####################################################

# Ubuntu 16.04 LTS (Xenial Xerus)
# PHP 7.2
# MySQL 5.7
# Apache
# Memcached
# phpMyAdmin
# Composer
# Git

echo "####### Iniciando a Instalação do Servidor #######"

echo "# Atualizando lista de pacotes e instalando as atualizações #"
sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade

echo "####### Instalando pacotes essenciais #######"
sudo apt-get install software-properties-common python-software-properties curl

echo "####### Instalando Apache2 #######"
sudo apt-get install apache2

echo "####### Instalando MySQL Server #######"
sudo apt-get install mysql-server

# Código em desenvolvimento
# function _askmysqlsi() {
#   echo -ne "${bold}${yellow}MySQL Instalação Segura${normal} [${green}y${normal}]es ou [n]o: "; read responce
#   case $responce in
#     [yY] | [yY][Ee][Ss] | "" ) mysqlsi=yes ;;
#     [nN] | [nN][Oo] ) mysqlsi=no ;;
#     *) mysqlsi=yes ;;
#   esac
#   echo
# }
# function _mysqlsi() {
#   if [[ ${mysqlsi} == "yes" ]]; then
#     MAXCPUS=$(echo "$(nproc) / 2"|bc)
#     if [[ $DISTRO == Ubuntu ]]; then
#       sudo mysql_secure_installation >>"${OUTTO}" 2>&1
#     elif [[ $DISTRO == Debian ]]; then
#       sudo mysql_secure_installation >>"${OUTTO}" 2>&1
# fi

echo "####### Instalando MySQL Instalação Segura #######" #Opcional se for ambiente de desenvolvimento
sudo mysql_secure_installation

echo "####### Adiconando repositório do PHP 7.2 #######"
sudo add-apt-repository -y ppa:ondrej/php && sudo apt-get update

echo "####### Instalando pacotes do PHP 7.2 #######"
sudo apt-get install php7.2-cli libapache2-mod-php7.2 php7.2-mysql php7.2-curl php-memcached php7.2-dev php7.2-sqlite3 php7.2-mbstring php7.2-gd php7.2-json

echo "####### Instalando phpMyAdmin #######"
sudo apt-get install phpmyadmin

echo "Virtual Host para phpMyadmin"
sudo /etc/apache2/sites-available/default.conf
# Adiconar o Virtual Host abaixo
:'
<Directory "/var/www/">
    AllowOverride All
</Directory>

<VirtualHost *:80>
    DocumentRoot /var/www/phpmyadmin
    ServerName phpmyadmin.local
</VirtualHost>
'
echo "Habilitar Host"
sudo a2ensite default.conf

echo "Reiniciar Apache"
sudo /etc/init.d/apache2 restart

echo "Fix phpMyadmin"
wget -k https://files.phpmyadmin.net/phpMyAdmin/4.8.0.1/phpMyAdmin-4.8.0.1-english.tar.gz
sudo tar -xzvf phpMyAdmin-4.8.0.1-english.tar.gz -C /var/www/
sudo rm phpMyAdmin-4.8.0.1-english.tar.gz
sudo mv /var/www/phpMyAdmin-4.8.0.1-english/ /var/www/phpmyadmin

:'Adicionar no host do windows: 192.168.10.100 phpmyadmin.local'

echo "####### Instalando Composer #######"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo "####### Instalando Git #######"
sudo apt-get install git