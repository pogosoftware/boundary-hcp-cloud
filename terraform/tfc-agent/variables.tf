####################################################################################################
### GLOBAL
####################################################################################################
variable "environment" {
  description = "The Name of environment. Possible values are: `dev`, `stg`, `prd`"
  type        = string
}

variable "aws_region" {
  description = "The Name of AWS region"
  type        = string
}

####################################################################################################
### ECS VARIABLES
####################################################################################################
variable "image" {
  default     = "hashicorp/tfc-agent:latest"
  description = "The Name of Terraform Cloud Agent docker image"
  type        = string
}

variable "ecs_task_desired_count" {
  default     = 1
  description = "How many ECS tasks should run in parallel"
  type        = number
}

variable "cpu_units" {
  description = "Amount of CPU units for a single ECS task"
  default     = 1024
  type        = number
}

variable "memory" {
  description = "Amount of memory in MB for a single ECS task"
  default     = 2048
  type        = number
}
