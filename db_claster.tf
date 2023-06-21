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

resource "digitalocean_database_cluster" "postgres-dwh-goiteens" {
  name       = "dwh-postgres-teens"
  engine     = "pg"
  version    = "15"
  size       = "db-s-1vcpu-1gb"
  region     = "ams3"
  node_count = 1
#  vpc_uuid   = [digitalocean_vpc.terraform_DWH_vpc]
}
resource "digitalocean_database_cluster" "postgres-teens-qiz" {
  name       = "teens-quiz-postgres-cluster"
  engine     = "pg"
  version    = "15"
  size       = "db-s-1vcpu-1gb"
  region     = "ams3"
  node_count = 1
  # private_networking = true  # Встановлення приватного мережевого підключення

  # private_networking_connection {
  #   name       = "teens-postgres-connection"
  #   vpc_uuid   = digitalocean_vpc.additional_vpcs[count.index].id  # Використання UUID додаткового VPC
  #   region     = "ams3"
  # }
}
resource "digitalocean_database_cluster" "postgres-teens-duel" {
  name       = "teens-duel-postgres-cluster"
  engine     = "pg"
  version    = "15"
  size       = "db-s-1vcpu-1gb"
  region     = "ams3"
  node_count = 1
  # private_networking = true  # Встановлення приватного мережевого підключення

  # private_networking_connection {
  #   name       = "teens-postgres-connection"
  #   vpc_uuid   = digitalocean_vpc.additional_vpcs[count.index].id  # Використання UUID додаткового VPC
  #   region     = "ams3"
  # }
}
resource "digitalocean_database_cluster" "postgres-teens-lms-task-aggregator" {
  name       = "teens-lms-task-aggregator-postgres-cluster"
  engine     = "pg"
  version    = "15"
  size       = "db-s-1vcpu-1gb"
  region     = "ams3"
  node_count = 1
  # private_networking = true  # Встановлення приватного мережевого підключення

  # private_networking_connection {
  #   name       = "teens-postgres-connection"
  #   vpc_uuid   = digitalocean_vpc.additional_vpcs[count.index].id  # Використання UUID додаткового VPC
  #   region     = "ams3"
  # }
}
resource "digitalocean_database_cluster" "postgres-teens-ide-extension-generator" {
  name       = "teens-ide-extension-generator-postgres-cluster"
  engine     = "pg"
  version    = "15"
  size       = "db-s-1vcpu-1gb"
  region     = "ams3"
  node_count = 1
  # private_networking = true  # Встановлення приватного мережевого підключення

  # private_networking_connection {
  #   name       = "teens-postgres-connection"
  #   vpc_uuid   = digitalocean_vpc.additional_vpcs[count.index].id  # Використання UUID додаткового VPC
  #   region     = "ams3"
  # }
}

resource "digitalocean_database_cluster" "postgres-teens-duct-tape-scripted" {
  name       = "duct-tape-scripted-postgres-cluster"
  engine     = "pg"
  version    = "15"
  size       = "db-s-1vcpu-1gb"
  region     = "ams3"
  node_count = 1
  # private_networking = true  # Встановлення приватного мережевого підключення

  # private_networking_connection {
  #   name       = "teens-postgres-connection"
  #   vpc_uuid   = digitalocean_vpc.additional_vpcs[count.index].id  # Використання UUID додаткового VPC
  #   region     = "ams3"
  # }
}
#resource "digitalocean_database_cluster" "redis" {
#  name       = "teens-redis-server"
#  engine     = "redis"
#  version    = "7"
#  size       = "db-s-1vcpu-1gb"
#  region     = "ams3"
#  node_count = 1
#}
#!!!необхідно задавати ім'я дефалтового юзера