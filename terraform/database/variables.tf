####################################################################################################
### GLOBAL
####################################################################################################
variable "environment" {
  default     = "dev"
  description = "The Name of environment. Possible values are: `dev`, `stg`, `prd`"
  type        = string
}

variable "bootstrap_workspace_name" {
  description = "The name of bootstrap workspace"
  type        = string
}

####################################################################################################
### RDS
####################################################################################################
variable "database_identifier_prefix" {
  default = "safepass-sentinel"
  type    = string
}

variable "database_port" {
  default = 5432
  type    = number
}

variable "database_engine" {
  default = "postgres"
  type    = string
}

variable "database_family" {
  default = "postgres16"
  type    = string
}

variable "database_engine_version" {
  default = "16.4"
  type    = string
}

variable "database_instance_class" {
  default = "db.t3.micro"
  type    = string
}

variable "database_allocated_storage" {
  default = 20
  type    = number
}

variable "database_skip_final_snapshot" {
  default = true
  type    = bool
}

variable "database_publicly_accessible" {
  default = true
  type    = bool
}
