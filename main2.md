resource "digitalocean_database_cluster" "postgres-example" {
  name       = "example-postgres-cluster"
  engine     = "pg"
  version    = "14"
  size       = "db-s-1vcpu-1gb"
  region     = "nyc1"
  node_count = 3
}
