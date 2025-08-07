# Ansible Multi-Node Project Commands

## inventory.ini already defined

## Ping All
ansible -i inventory.ini servers -m ping

## Get Default Gateway
ansible -i inventory.ini servers -m shell -a "ip route | grep default"

## Filter IP Only
ansible -i inventory.ini servers -m shell -a "ip route | grep default | awk '{print \$3}'"

## CPU Info
ansible -i inventory.ini servers -m shell -a "lscpu | grep 'Model name'"

## Create User
ansible -i inventory.ini servers -m shell -a "useradd -m -G sudo toor" -b

## Check Last Login for User
ansible -i inventory.ini servers -m shell -a "lastlog | grep toor"

## Backup Script Run
ansible -i inventory.ini servers -m script -a "scripts/backup_etc.sh" -b

## Install NGINX
ansible -i inventory.ini servers -m apt -a "name=nginx state=present update_cache=yes" -b

## Upgrade Packages
ansible -i inventory.ini servers -m apt -a "upgrade=yes update_cache=yes" -b

## Restart SSH
ansible -i inventory.ini servers -m service -a "name=ssh state=restarted" -b

## Enable NGINX at Boot
ansible -i inventory.ini servers -m service -a "name=nginx enabled=yes" -b

## Create Group
ansible -i inventory.ini servers -m group -a "name=managers state=present" -b

## Add User to Group
ansible -i inventory.ini servers -m user -a "name=toor groups=sudo,managers append=yes state=present" -b
