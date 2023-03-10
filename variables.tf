variable "region" {
default = "us-east-2"
}

variable "ami" {
default = "ami-0568936c8d2b91c4e"
}

variable "type" {
default="t2.micro"
}


variable "db_name" {
  default = "wordpress"
}

variable "db_username" {
  default = "wordpress"
}

variable "db_password" {
  default = "password"
}

variable "db-type" {
default="db.t2.micro"
}

variable "db-engine" {
default="mysql"
}

variable "db-version" {
default="5.7"
}

variable "db-storage" {
  description = "storage of database"
  type        = number
  default     = 10
}

variable "zone" {
type= list
default= ["us-east-2a", "us-east-2b", "us-east-2c"]
}

variable "access_key" {}

variable "secret_key" {}
