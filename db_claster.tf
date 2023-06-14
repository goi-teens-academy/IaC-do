resource "digitalocean_database_cluster" "postgres-teens" {
  name       = "teens-postgres-cluster"
  engine     = "pg"
  version    = "15"
  size       = "db-s-1vcpu-1gb"
  region     = "ams3"
  node_count = 1
}

#resource "digitalocean_database_db" "database-example1" {
# cluster_id = digitalocean_database_cluster.postgres-example.id
#name       = "foobar"
#}

resource "digitalocean_database_cluster" "postgres-analistic" {
  name       = "analistic-postgres-teens"
  engine     = "pg"
  version    = "15"
  size       = "db-s-1vcpu-1gb"
  region     = "ams3"
  node_count = 1
}
