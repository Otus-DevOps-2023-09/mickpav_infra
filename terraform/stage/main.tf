terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "~>0.35"
    }
  }
  required_version = ">= 0.13"
}
provider "yandex" {
  token     = var.token_id
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}
module "app" {
  source           = "../modules/app"
  public_key_path  = var.public_key_path
  private_key_path = var.private_key_path
  app_disk_image   = var.app_disk_image
  subnet_id        = module.vpc.app_subnet_id
  ssh_user         = var.ssh_user
  db_url           = module.db.external_ip_address_db
}

module "db" {
  source          = "../modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
  private_key_path = var.private_key_path
  subnet_id       = module.vpc.app_subnet_id
}
module "vpc" {
  source = "../modules/vpc"
}
