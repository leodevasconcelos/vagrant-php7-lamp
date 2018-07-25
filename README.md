# vagrant-php7

Requirements
------------
* VirtualBox <http://www.virtualbox.org>
* Vagrant <http://www.vagrantup.com>
* Git <http://git-scm.com/>

Usage
-----

### Startup

1. Download one of the releases available [https://github.com/vendettafv/vagrant-php7](https://github.com/vendettafv/vagrant-php7)
2. Extract the ZIP file.
3. From the command-line:
```
$ cd vagrant-php7
$ vagrant up
```
That is pretty simple.

### Connecting

#### Apache
The Apache server is available at <http://192.168.10.100>

#### MySQL
Externally the MySQL server is available at port 8889, and when running on the VM it is available as a socket or at port 3306 as usual.
Username: root
Password: root

Technical Details
-----------------
* Ubuntu 16.04 LTS (Xenial Xerus)
* PHP 7.2
* MySQL 5.7
* Apache
* Memcached
* phpMyAdmin
* Composer
* Git

We are using the base Ubuntu 16.04 box from Vagrant. If you don't already have it downloaded
the Vagrantfile has been configured to do it for you. This only has to be done once
for each account on your host computer.

The web root is located in the project directory at `www/` and you can install your files there

And like any other vagrant file you have SSH access with
```
$ vagrant ssh
```
