terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Set the variable value in *.tfvars file
# or using -var="do_to#ken=..." CLI option
#variable "do_token" {}

# Configure the DigitalOcean Provider
variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}
data "digitalocean_ssh_key" "terraform" {
  name = "terraform"
}

resource "digitalocean_droplet" "LMS-PROD-teens" {
  image    = "ubuntu-20-04-x64"
  name     = "LMS-PROD-teens"
  region   = "ams3"
  size     = "s-4vcpu-8gb"
  ssh_keys = [data.digitalocean_ssh_key.terraform.id]
}

resource "digitalocean_droplet" "LMS-PROD-kafka" {
  image    = "ubuntu-20-04-x64"
  name     = "LMS-PROD-kafka"
  region   = "ams3"
  size     = "s-4vcpu-8gb"
  ssh_keys = [data.digitalocean_ssh_key.terraform.id]
}

# resource "digitalocean_droplet" "LMS-PROD-jenkins-teens" {
#   image    = "ubuntu-20-04-x64"
#   name     = "LMS-PROD-jenkins-teens"
#   region   = "ams3"
#   size     = "s-8vcpu-16gb"
#   ssh_keys = [data.digitalocean_ssh_key.terraform.id]
#   user_data = <<-EOF
#               #!/bin/bash
#               # Оновлення пакетів
#               apt-get update -y
#               apt-get upgrade -y

#               # Створення користувача Jenkins
#               useradd -m -s /bin/bash -U jenkins

#               # Додавання користувача Jenkins до групи sudo
#               usermod -aG sudo jenkins

#               # Налаштування безпарольного доступу до команд sudo для користувача Jenkins
#               echo 'jenkins ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

#               # Переключення на користувача Jenkins
#               su - jenkins <<EOSU
#                 # Встановлення Docker та необхідних залежностей
#                 sudo dpkg --configure -a
#                 sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
#                 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
#                 echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#                 sudo apt-get update -y
#                 sudo apt-get install -y docker-ce docker-ce-cli containerd.io

#                 # Встановлення Docker Swarm
#                 sudo docker swarm init
#                 sudo docker run -it --rm \
#                 --name swarmpit-installer \
#                 --volume /var/run/docker.sock:/var/run/docker.sock \
#                  swarmpit/install:1.9

#                 # Інші налаштування...
#                 # <Додайте ваші налаштування тут>

#               EOSU
#               EOF
# }