variable "aws_region" {
  default = "eu-central-1"
  type = string
}

variable "tfc_hostname" {
  default = "app.terraform.io"
  type = string
}

variable "tfc_organization" {
  default = "pogosoftware"
  type = string
}

variable "tfc_project" {
  default = "safepass-sentinel"
  type = string
}

variable "hcp_project" {
  default = "SafePass_Sentinel"
  type = string
}

variable "tfc_stack" {
  default = "development"
  type = string
}