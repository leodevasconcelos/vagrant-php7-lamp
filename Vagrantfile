###########################################
######## Configurações do Servidor ########
###########################################

# Configurações da Máquina
server_ip     = "192.168.10.100"  # IP ou DHCP
server_cpus   = "1"               # Quantidade de CPU Cores
server_memory = "512"             # Memória RAM em MB

# Setup do Servidor
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  
  config.vm.hostname = "localhost"

  # :public_network
  config.vm.network :private_network, ip: server_ip
  config.vm.network :forwarded_port, guest: 80, host: 8000
	config.vm.network :forwarded_port, guest: 443, host: 44300
  config.vm.network :forwarded_port, guest: 3306, host: 33060

  config.ssh.forward_agent = true
	
	config.vm.synced_folder "www/", "/var/www/html", mount_options: ['dmode=777','fmode=666']
  config.vm.synced_folder "ssl/", "/etc/apache2/ssl", mount_options: ['dmode=777','fmode=666']
	
	config.vm.synced_folder "~", "/vagrant", owner: "vagrant", group: "vagrant"
	
	config.vm.provider "virtualbox" do |v|
    v.cpus = server_cpus
    v.memory = server_memory
    v.name = "server-php7"
  end
end