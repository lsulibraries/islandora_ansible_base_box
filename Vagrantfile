# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "islandx"
  config.vm.box_url = 'http://lib-dig003.lsu.edu/vagrant/islandx/'
  config.vm.box_version = '0.1.7.5'

  config.vm.synced_folder "wwwroot/", "/opt/mounts/drupal", create: true, owner: "www-data", group: "www-data"

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

  # Use rbconfig to determine if we're on a windows host or not.
  require 'rbconfig'
  is_windows = (RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/)
  if is_windows
    config.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "local.yml"
      ansible.verbose = 'vv'
      ansible.install = true
      ansible.extra_vars = {
        mysql_local_installation: "true",
        attach_mounts: false,
        drupal_reverse_proxy: false,
        fqdn_suffix: 'library.local'
		}
    end
  else
    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "local.yml"
      ansible.verbose = 'vv'
      ansible.extra_vars = {
        mysql_local_installation: "true",
        attach_mounts: false,
        drupal_reverse_proxy: false,
        fqdn_suffix: 'library.local'		}
    end
  end
end
