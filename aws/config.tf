# terraform {
#   backend "s3" {
#     bucket = "<SOME_BUCKET>"
#     key    = "<SOME_DOMAIN>"
#     region = "<SOME_REGION>"
#   }
# }
# data "terraform_remote_state" "network" {
#   backend = "s3"
#   config {
#     bucket = "<SOME_BUCKET>"
#     key    = "${var.name}.${var.domain}/iam"
#     region = "${var.region}"
#   }
# }
provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "~/.aws/credentials"
}
variable "region" {
  type    = "string"
  default = "us-west-2"
}
variable "gluu_version" {
  type    = "string"
  default = "3.1.6"
}
variable "ami" {
  type    = "string"
  default = "ami-005bdb005fb00e791"
}
variable "name" {
  type    = "string"
  default = "iam"
}
variable "volume_size" {
  type    = "string"
  default = "20"
}
variable "instance_type" {
  type    = "string"
  default = "t2.medium"
}
variable "domain" {
  type    = "string"
}
variable "email" {
  type    = "string"
}
variable "country_code" {
  type    = "string"
}
variable "org_name" {
  type    = "string"
}
variable "city" {
  type    = "string"
}
variable "state" {
  type    = "string"
}
