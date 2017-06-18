# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box              = "php7-default"
  config.vm.box_url          = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"
  config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 3306, host: 33061, host_ip: "127.0.0.1"
  config.vm.network "private_network", ip: "192.168.33.115"
  config.vm.network "public_network"

  config.vm.synced_folder "src/", "/vagrant"

  # Virtual Box Settings
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 4096
    vb.cpus   = 2
    vb.customize [
        "modifyvm", :id,
        "--hwvirtex", "on",
        "--nestedpaging", "on",
        "--largepages", "on",
        "--ioapic", "on",
        "--pae", "on",
        "--paravirtprovider", "kvm",
        "--natdnsproxy1", "off",
        "--natdnshostresolver1", "off"
    ]
  end

  # provisioning
  config.vm.provision "shell", :path => "provision/basics.sh"
  config.vm.provision "shell", :path => "provision/php.sh"
  config.vm.provision "shell", :path => "provision/vim.sh"
  config.vm.provision "shell", :path => "provision/database.sh"
  config.vm.provision "shell", :path => "provision/application.sh"
end
