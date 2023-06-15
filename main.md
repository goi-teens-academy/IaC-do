variable "do_token" {}

provider "digitalocean" {
  token   = "${var.do_token}"
  version = "1.9.1"
}

resource "digitalocean_vpc" "my_vpc" {
  name   = "my-vpc"
  region = "nyc1"
}
resource "digitalocean_droplet" "app_droplet" {
  count     = 3
  image     = "ubuntu-20-04-x64"
  name      = "app-droplet-${count.index}"
  region    = "nyc1"
  size      = "s-1vcpu-1gb"
  vpc_uuid  = digitalocean_vpc.my_vpc.id
  user_data = "#!/bin/bash\napt-get update\napt-get install -y nginx"
}

output "app_droplet_ips" {
  value = [for d in digitalocean_droplet.app_droplet : d.ipv4_address]
}
resource "digitalocean_database_cluster" "db_cluster" {
  count    = 3
  name     = "db-cluster-${count.index}"
  engine   = "pg"
  version  = "13"
  region   = "nyc1"
  size     = "db-s-1vcpu-1gb"
  vpc_uuid = digitalocean_vpc.my_vpc.id
  user_config {
    pg_hba = "host all all 0.0.0.0/0 md5"
  }
}

output "db_cluster_hostnames" {
  value = [for db in digitalocean_database_cluster.db_cluster : db.connection.host]
}
resource "digitalocean_droplet" "nginx_droplet" {
  image     = "ubuntu-20-04-x64"
  name      = "nginx-droplet"
  region    = "nyc1"
  size      = "s-1vcpu-1gb"
  vpc_uuid  = digitalocean_vpc.my_vpc.id
  user_data = "#!/bin/bash\napt-get update\napt-get install -y nginx"
}

output "nginx_droplet_ip" {
  value = digitalocean_droplet.nginx_droplet.ipv4_address
}
