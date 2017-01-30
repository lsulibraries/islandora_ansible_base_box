# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "islandx"
  config.vm.box_url = 'http://lib-dig003.lsu.edu/vagrant/islandx/'
  config.vm.box_version = '0.1.7.7'

  config.vm.network "forwarded_port", guest: 80,   host: 8000 # apache
  config.vm.network "forwarded_port", guest: 8080, host: 8080 # tomcat
  config.vm.network "forwarded_port", guest: 3306, host: 3306 # mysql
  config.vm.network "forwarded_port", guest: 8888, host: 8888 # djatoka

  config.vm.network "private_network", ip: "192.168.111.111"
  config.vm.post_up_message = "Access Islandora at localhost:8000\nAccess Tomcat at localhost:8080\n\nAdd the following to your /etc/hosts file.

127.0.0.1         hnoc.library.local
127.0.0.1         latech.library.local
127.0.0.1         loyno.library.local
127.0.0.1         lsm.library.local
127.0.0.1         lsu.library.local
127.0.0.1         lsuhsc.library.local
127.0.0.1         lsuhscs.library.local
127.0.0.1         mcneese.library.local
127.0.0.1         nicholls.library.local
127.0.0.1         state.library.local
127.0.0.1         subr.library.local
127.0.0.1         tahil.library.local
127.0.0.1         tulane.library.local
127.0.0.1         ull.library.local
127.0.0.1         ulm.library.local
127.0.0.1         uno.library.local
127.0.0.1         ldl.library.local"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4000"
    vb.cpus = 2
  end
end
