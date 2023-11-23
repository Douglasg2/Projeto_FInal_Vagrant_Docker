Vagrant.configure("2") do |config|
  config.vm.define "vmgateway" do |vmgateway|

    vmgateway.vm.box = "ubuntu/focal64"
    vmgateway.vm.hostname = "vmgateway"

    vmgateway.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
    end
    vmgateway.vm.network "private_network", type: "private_network", ip: "192.168.56.10"
    
    vmgateway.vm.network "forwarded_port", guest: 80, host: 8080

    vmgateway.vm.synced_folder "./var/www/html", "/var/www/html"


    vmgateway.vm.provision "docker" do |docker|
      docker.run "shell", path: "provision/dhcp.sh"
      docker.run "shell", path: "provision/dns.sh"
      docker.run "shell", path: "provision/ftp.sh"
      docker.run "shell", path: "provision/nfs.sh"
      docker.run "shell", path: "provision/web.sh"
    end
  end
end
