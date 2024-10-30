####################################################################################################
### GENERATE USERNAME AND PASSWORD
####################################################################################################
resource "random_string" "postgres_username" {
  length  = 16
  special = false
  upper   = false
}

resource "random_password" "postgres_password" {
  length           = 32
  special          = true
  override_special = "/@£$"
}

####################################################################################################
### SETUP SECURITY GROUP
####################################################################################################
resource "aws_security_group_rule" "ingress_allow_ssh" {
  type              = "ingress"
  to_port           = 5432
  protocol          = "tcp"
  from_port         = 5432
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = local.postrgres_sg_id
}

####################################################################################################
### SETUP RDS CLUSTER
####################################################################################################
module "postgres" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.10.0"

  identifier = local.identifier
  db_name    = "safepass"

  engine            = var.database_engine
  engine_version    = var.database_engine_version
  family            = var.database_family
  instance_class    = var.database_instance_class
  allocated_storage = var.database_allocated_storage

  skip_final_snapshot = var.database_skip_final_snapshot
  publicly_accessible = var.database_publicly_accessible

  username = local.postgres_username
  password = local.postgres_password
  port     = var.database_port

  subnet_ids             = local.postgres_subnet_id
  vpc_security_group_ids = [local.postrgres_sg_id]

  tags = {
    InstanceGroup = "RDS_Postgres"
    Environment   = var.environment
  }
}
