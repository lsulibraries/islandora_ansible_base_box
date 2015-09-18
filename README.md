
## Installation


~~~
git clone --recursive
cd islandora_vagrant
vagrant up
~~~

If the installation fails, try restarting it from your vagrant folder with `vagrant provision`

If you need to run ansible from the machine:
~~~
vagrant ssh
sudo su
cd /opt/islandora_ansible
source /opt/ansible/hacking/env-setup
ansible-playbook site.yml -i hosts -u vagrant -vv --connection=local
~~~
