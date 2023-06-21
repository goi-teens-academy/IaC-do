#!/bin/bash
  # Оновлення пакетів
apt-get update -y
apt-get upgrade -y
# Створення користувача devopsuser
useradd -m -s /bin/bash -U devopsuser
# Додавання користувача devopsuser до групи sudo
usermod -aG sudo devopsuser
# Налаштування безпарольного доступу до команд sudo для користувача devopsuser
echo 'devopsuser ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
sudo apt install net-tools traceroute
sudo apt-get update
#install net-tools and traceroute
sudo apt install net-tools traceroute
#setup docker.io & add to swarm like worker node 
sudo apt install docker.io 
docker swarm join --token SWMTKN-1-0kh4uinkabtjvt07hslod0zskn9ptxnziz5lfjhzrhlmdopmyp-2zn6phl2egydvsxyenet8sczs 174.138.14.51:2377
#install nginx and certbot 
sudo apt install -y nginx
sudo snap install cetrbot --classic
# zetup Zabbix -agent2
echo "deb http://security.ubuntu.com/ubuntu focal-security main" | sudo tee /etc/apt/sources.list.d/focal-security.list
sudo apt-get update -y
sudo apt-get install -y libssl1.1
wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-4+ubuntu20.04_all.deb
dpkg -i zabbix-release_6.0-4+ubuntu20.04_all.deb -y
apt update
apt install zabbix-agent2 -y