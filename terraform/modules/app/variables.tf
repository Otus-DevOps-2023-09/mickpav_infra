variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable subnet_id {
  description = "Subnets for modules"
}
variable db_url {
  description = "ip for mongo-db"
}
variable private_key_path {
  description = "path to private key"
}
variable ssh_user {
  description = "user for ssh connection"
}
