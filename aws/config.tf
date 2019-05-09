terraform {
  backend "s3" {
    bucket = "codejamninja-terraform"
    key    = "iam.codejam.ninja/iam"
    region = "us-west-2"
  }
}
data "terraform_remote_state" "network" {
  backend = "s3"
  config {
    bucket = "codejamninja-terraform"
    key    = "${var.name}.${var.domain}/iam"
    region = "${var.region}"
  }
}
provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "~/.aws/credentials"
}
variable "region" {
  type    = "string"
  default = "us-west-2"
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
  default = "codejam.ninja"
}
variable "email" {
  type    = "string"
  default = "tech@codejam.ninja"
}
