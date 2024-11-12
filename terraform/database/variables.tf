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
  default     = "safepass-sentinel"
  description = "The prefix name of for database instance"
  type        = string
}

variable "database_port" {
  default     = 5432
  description = "The port of database instance"
  type        = number
}

variable "database_engine" {
  default     = "postgres"
  description = "The name of database engine"
  type        = string
}

variable "database_family" {
  default     = "postgres16"
  description = "The family of database instance"
  type        = string
}

variable "database_engine_version" {
  default     = "16.4"
  description = "The version of database instance"
  type        = string
}

variable "database_instance_class" {
  default     = "db.t3.micro"
  description = "The instance class of database instance"
  type        = string
}

variable "database_allocated_storage" {
  default     = 20
  description = "The allocation storage size of database instance"
  type        = number
}

variable "database_skip_final_snapshot" {
  default     = true
  description = "Determinate to skip the final snapshot or not"
  type        = bool
}

variable "database_publicly_accessible" {
  default     = true
  description = "Determinates to expose database publicly or not"
  type        = bool

}
variable "database_manage_master_user_password" {
  default     = false
  description = "Determinate to manage master user password or not"
  type        = bool
}
