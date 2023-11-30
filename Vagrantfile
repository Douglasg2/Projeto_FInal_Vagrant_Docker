# Vagrantfile

Vagrant.configure("2") do |config|

  config.vm.define "vmgateway" do |vmgateway|
    vmgateway.vm.box = "ubuntu/bionic64"
    vmgateway.vm.hostname = "vmgateway"

    vmgateway.vm.provider "virtualbox" do |vb|
      vb.memory = "3072"
      vb.cpus = 2
    end

    vmgateway.vm.network "private_network", type: "private_network", ip: "192.168.56.10"
    vmgateway.vm.network "forwarded_port", guest: 22, host: 2200, host_ip: "127.0.0.1", host_port: 2222

    vmgateway.vm.synced_folder "/var/www/html", "/var/www/html"

    vmgateway.vm.provision "docker" do |docker|
      vmgateway.vm.provision "shell", path: "provision/dhcp.sh"
      vmgateway.vm.provision "shell", path: "provision/dns.sh"
      vmgateway.vm.provision "shell", path: "provision/ftp.sh"
      vmgateway.vm.provision "shell", path: "provision/nfs.sh"
      vmgateway.vm.provision "shell", path: "provision/web.sh"
    end

    # Adicione a linha abaixo para configurar o servidor NFS
    vmgateway.vm.provision "shell", path: "provision/nfs.sh"
  end

  # Configuração da máquina FTP
  config.vm.define "vmftp" do |vmftp|
    vmftp.vm.box = "ubuntu/bionic64"
    vmftp.vm.hostname = "vmftp"

    vmftp.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end

    vmftp.vm.network "private_network", type: "dhcp"

    vmftp.vm.provision "docker" do |docker|
      docker.run "ftp", image: "ustclug/ftp"
    end
  end
end
