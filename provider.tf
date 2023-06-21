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

 resource "digitalocean_droplet" "LMS-PROD-jenkins-teens" {
  image    = "ubuntu-20-04-x64"
  name     = "LMS-PROD-jenkins-teens"
  region   = "ams3"
  size     = "s-8vcpu-16gb"
  ssh_keys = [data.digitalocean_ssh_key.terraform.id]
 }
 resource "digitalocean_droplet" "DWH-PROD-GoITeens" {
  image    = "ubuntu-20-04-x64"
  name     = "Data-Ware-House-PROD"
  region   = "ams3"
  size     = "s-4vcpu-8gb"
  ssh_keys = [data.digitalocean_ssh_key.terraform.id]
#  vpc_uuid = digitalocean_vpc.vpc[1].id  # Використання першого VPC UUID
 
}
 resource "digitalocean_droplet" "QUIZ-PROD-GoITeens" {
  image    = "ubuntu-20-04-x64"
  name     = "Quiz-teens-PROD"
  region   = "ams3"
  size     = "s-4vcpu-8gb"
  ssh_keys = [data.digitalocean_ssh_key.terraform.id]
 # vpc_uuid = digitalocean_vpc.additional_vpcs[count.index].id  # Використання UUID додаткового VPC
 
}
 resource "digitalocean_droplet" "DUEL-PROD-GoITeens" {
  image    = "ubuntu-20-04-x64"
  name     = "Duel-teens-PROD"
  region   = "ams3"
  size     = "s-4vcpu-8gb"
  ssh_keys = [data.digitalocean_ssh_key.terraform.id]
 # vpc_uuid = digitalocean_vpc.additional_vpcs[count.index].id  # Використання UUID додаткового VPC
 }
 
  resource "digitalocean_droplet" "IDE-extension-generator-PROD-GoITeens" {
  image    = "ubuntu-20-04-x64"
  name     = "ide-extension-generator-teens-PROD"
  region   = "ams3"
  size     = "s-4vcpu-8gb"
  ssh_keys = [data.digitalocean_ssh_key.terraform.id]
 # vpc_uuid = digitalocean_vpc.additional_vpcs[count.index].id  # Використання UUID додаткового VPC
 }

  resource "digitalocean_droplet" "LMS-task-aggregator-PROD-GoITeens" {
  image    = "ubuntu-20-04-x64"
  name     = "lms-task-aggregator-teens-PROD"
  region   = "ams3"
  size     = "s-4vcpu-8gb"
  ssh_keys = [data.digitalocean_ssh_key.terraform.id]
#  vpc_uuid = digitalocean_vpc.additional_vpcs[count.index].id  # Використання UUID додаткового VPC
 }

   resource "digitalocean_droplet" "duct-tape-scripted-PROD-GoITeens" {
  image    = "ubuntu-20-04-x64"
  name     = "duct-tape-scripted-teens-PROD"
  region   = "ams3"
  size     = "s-4vcpu-8gb"
  ssh_keys = [data.digitalocean_ssh_key.terraform.id]
#  vpc_uuid = digitalocean_vpc.additional_vpcs[count.index].id  # Використання UUID додаткового VPC
 }