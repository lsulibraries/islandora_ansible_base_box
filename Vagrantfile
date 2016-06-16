# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 80,   host: 8000 # apache
  config.vm.network "forwarded_port", guest: 8080, host: 8080 # tomcat
  config.vm.network "forwarded_port", guest: 3306, host: 3306 # mysql
  config.vm.network "forwarded_port", guest: 8888, host: 8888 # djatoka

  config.vm.network "private_network", ip: "192.168.111.111"
  #config.vm.post_up_message = "Access Islandora at localhost:8000\nAccess Tomcat at localhost:8080"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "8000"
  end
  
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "build.yml"
      ansible.verbose = 'vv'
      ansible.extra_vars = {
        mysql_local_installation: "true",
        attach_mounts: false
      }
    end
end
