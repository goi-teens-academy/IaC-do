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
