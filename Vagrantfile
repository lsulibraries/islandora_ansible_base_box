# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Monolithic box
  config.vm.define :all do |a|
    a.vm.network "forwarded_port", guest: 80, host: 8088
    a.vm.network "forwarded_port", guest: 8080, host: 8888
    a.vm.network "forwarded_port", guest: 3306, host: 3306
    a.vm.network "private_network", ip: "192.168.33.9"
    
    a.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
    end
  end

  config.vm.define :www do |w|
    w.vm.network "forwarded_port", guest: 80, host: 8080
    w.vm.network "private_network", ip: "192.168.33.52"
  end

  config.vm.define :db do |d|
    d.vm.network "forwarded_port", guest: 3306, host: 3366
    d.vm.network "private_network", ip: "192.168.33.51"
  end

  config.vm.define :java do |j|
#    j.vm.network "forwarded_port", guest: 3306, host: 3366
    j.vm.network "forwarded_port", guest: 8080, host: 8808
    j.vm.network "private_network", ip: "192.168.33.53"
  end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 3306, host: 3366

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.51"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
#  config.vm.provision "ansible" do |ansible|
#    ansible.playbook = "site.yml"
#    ansible.verbose = "vvv"
#  end

config.vm.provision "shell", inline: <<-SHELL
  useradd -m -s /bin/bash ansible
  mkdir /home/ansible/.ssh
  echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCznTv2yTUPunuYdnVd5BnDWijBdiwtIBx3dYaHaPkz1/mMuYEV7itj1O8N2eWoyeFY+mjqI24AIHmtauXV1JCwng0yehwNHjyz4IZs3rSgLVmPkYLjecM/XLVECFrfVAaKMxTFrkgYJOKrUTa1ZJPFYXvqIM/bALwnx9swDC/BkuLtXci/tRg6lbVbbfAj+NJgx902fiUTLnlTRtqzwUX9+GkJW3aVUuFqx/a+R85CHeRLxjGwynyTcDzCOO4AVuC36ZHMkyZLnjaTmXhjfZDBPHaVeMzrRhIwMn69IB9BWJzPGLcw42RZMZPOwLVzGb/waqWbYnclFTjmaWJaeVDZ jpeak5@lib-dig003" > /home/ansible/.ssh/authorized_keys
  echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible
  chmod 0550 /etc/sudoers.d/ansible
  SHELL

end
