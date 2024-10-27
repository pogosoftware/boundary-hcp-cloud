variable "aws_region" {
  default = "eu-central-1"
  type = string
}

variable "environment" {
  default = "dev"
  type = string
}

variable "tfc_hostname" {
  default = "app.terraform.io"
  type = string
}

variable "tfc_stack" {
  default = "development"
  type = string
}