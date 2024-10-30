####################################################################################################
### GLOBAL
####################################################################################################
variable "environment" {
  description = "The name of environment. Allowed values: `dev`, `stg`, `prd`. Defaults to `dev`"
  type        = string
}

variable "name_prefix" {
  default     = "sps"
  description = "The prefix of names. Defaults to `sps`"
  type        = string
}

####################################################################################################
### TFC
####################################################################################################
variable "vcs_repo" {
  default = {
    identifier = "pogosoftware/safepass-sentinel"
    branch     = "develop"
  }
  description = "The repository where modules are"
  type = object({
    identifier = string
    branch     = string
  })
}

variable "allow_destroy_plan" {
  default     = true
  description = "Determinate to allow query plan or not"
  type        = bool
}

variable "auto_apply" {
  default     = true
  description = "Determinate to auto apply changes or not"
  type        = bool
}

variable "terraform_version" {
  default     = "~>1.9.0"
  description = "The version of Terraform"
  type        = string
}
