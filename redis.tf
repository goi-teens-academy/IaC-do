resource "digitalocean_droplet" "redis" {
  name      = "teens-redis-server"
  region    = "nyc1"
  size      = "s-1vcpu-1gb"
  image     = "redis"
  backups   = false
  ipv6      = false
#  user_data = ""
}