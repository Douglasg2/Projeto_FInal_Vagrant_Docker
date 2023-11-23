Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/focal64"
  
    config.vm.network "private_network", type: "dhcp"
    config.vm.network "forwarded_port", guest: 80, host: 8080
  
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 2
    end
  
    config.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y apache2
    SHELL
  
    config.vm.synced_folder "./var/www/html", "/var/www/html"
  
    config.vm.provision "docker" do |docker|
      docker.run "service-1", image: "nome-da-imagem-1"
      docker.run "service-2", image: "nome-da-imagem-2"
      docker.run "service-3", image: "nome-da-imagem-3"
      docker.run "service-4", image: "nome-da-imagem-4"
      docker.run "service-5", image: "nome-da-imagem-5"
    end
  end

  #d