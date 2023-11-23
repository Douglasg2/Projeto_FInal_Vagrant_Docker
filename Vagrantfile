Vagrant.configure("2") do |config|
  config.vm.define "vm" do |vm|
    vm.vm.box = "ubuntu/focal64"
    vm.vm.hostname = "vm"

    vm.vm.network "private_network", type: "private_network", ip: "192.168.56.10"
    vm.vm.network "forwarded_port", guest: 80, host: 8080

    vm.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 2
    end

    vm.vm.synced_folder "./var/www/html", "/var/www/html"


    vm.vm.provision "docker" do |docker|
      docker.run "shell", image: "provision/dhcp.sh"
      docker.run "shell", image: "provision/dns.sh"
      docker.run "shell", image: "provision/ftp.sh"
      docker.run "shell", image: "provision/nfs.sh"
      docker.run "shell", image: "provision/web.sh"
    end
  end
end
