#resource "digitalocean_vpc" "ex" {
#  name     = "project-network"
#  region   = "nyc3"
#  ip_range = "10.10.10.0/24"
#}
module "vpc" {
  source  = "terraform-do-modules/vpc/digitalocean"
  version = "0.15.1"
}