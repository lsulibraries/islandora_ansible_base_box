
## Installation

~~~
git clone --recursive
cd islandora_vagrant
vagrant up
~~~

If the installation fails, try restarting it from your vagrant folder with `vagrant provision`

If you (Windows users) need to run ansible from the vm created by vagrant:
~~~
vagrant ssh
sudo su
cd /opt/islandora_ansible
source /opt/ansible/hacking/env-setup
ansible-playbook 6-dev.play -u vagrant -vv --connection=local -i /vagrant/win.inv
~~~

## Multisite

The multisite environment requires that you update your /etc/hosts file to include aliases for the subsites.
See the note in the `hosts` file, here in this repository, for more info.

With that done, you should be able to browse to sites at the following locations:

* http://ldl.local:8000/
* http://red.ldl.local:8000/
* http://green.ldl.local:8000/
* http://blue.ldl.local:8000/
