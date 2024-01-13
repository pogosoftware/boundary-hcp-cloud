variable "tfc_organization" {
  description = "The name of TFC orgranisation"
  type        = string
}

variable "tfc_network_workspace_name" {
  description = "The name of network TFC workspace"
}

variable "boundary_workers_ingress_name" {
  default     = "boundary-ingress-worker"
  description = "The name of Boundary ingress worker"
  type        = string
}

variable "boundary_workers_egress_name" {
  default     = "boundary-egress-worker"
  description = "The name of Boundary egress worker"
  type        = string
}

variable "boundary_workers_instance_type" {
  default     = "t2.micro"
  description = "The type of Boundary worker instance"
  type        = string
}
