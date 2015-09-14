# 

## Installation


~~~
vagrant up
vagrant ssh
cd /opt/islandora_ansible
source /opt/ansible/hacking/env-setup
ansible-playbook site.yml -i hosts -u vagrant -vv --connection=local
~~~
