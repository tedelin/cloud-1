Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.define "cloud-1"

  config.vm.network "private_network", ip: "192.168.56.178"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end
	config.vm.provision "shell", inline: <<-SHELL
		echo "PermitRootLogin yes" | sudo tee -a /etc/ssh/sshd_config
		sudo systemctl restart ssh
		sudo mkdir -p /root/.ssh
		sudo cp /home/vagrant/.ssh/authorized_keys /root/.ssh/
		sudo chown root:root /root/.ssh/authorized_keys
	SHELL
end
