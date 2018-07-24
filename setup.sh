#!/bin/bash

# Script de Configuração do Servidor Vagrant LAMP

# Ubuntu 16.04 LTS (Xenial Xerus)
# PHP 7.2
# MySQL 5.7
# Apache
# Memcached
# Composer

echo "####### Iniciando a Instalação do Servidor #######"

echo "# Atualizando lista de pacotes e instalando as atualizações #"
sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade

echo "####### Instalando pacotes essenciais #######"
sudo apt-get install software-properties-common python-software-properties curl

echo "####### Instalando MySQL Server #######"
sudo apt-get install mysql-server

echo "####### Instalando MySQL Instalação Segura #######"
sudo mysql_secure_installation

echo "####### Instalando Apache2 #######"
sudo apt-get install apache2

echo "####### Adiconando repositório do PHP 7.2 #######"
sudo add-apt-repository -y ppa:ondrej/php && sudo apt-get update

echo "####### Instalando pacotes do PHP 7.2 #######"
sudo apt-get install php7.2-cli libapache2-mod-php7.2 php7.2-mysql php7.2-curl php-memcached php7.2-dev php7.2-sqlite3 php7.2-mbstring php7.2-gd php7.2-json



