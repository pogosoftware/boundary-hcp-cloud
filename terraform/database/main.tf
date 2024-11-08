####################################################################################################
### GENERATE USERNAME AND PASSWORD
####################################################################################################
resource "random_string" "postgres_username" {
  length  = 16
  special = false
  upper   = false
  numeric = false
}

resource "random_password" "postgres_password" {
  length  = 32
  special = false
}

####################################################################################################
### SETUP SECURITY GROUP
####################################################################################################
resource "aws_security_group_rule" "ingress_allow_postgres_db" {
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

  skip_final_snapshot         = var.database_skip_final_snapshot
  publicly_accessible         = var.database_publicly_accessible
  manage_master_user_password = var.database_manage_master_user_password

  username = local.postgres_username
  password = local.postgres_password
  port     = var.database_port

  subnet_ids             = local.postgres_subnet_id
  db_subnet_group_name   = local.postgres_subnet_group_name
  vpc_security_group_ids = [local.postrgres_sg_id]

  tags = {
    InstanceGroup = "RDS_Postgres"
    Environment   = var.environment
  }
}

####################################################################################################
### CREATE ROLES
####################################################################################################
resource "postgresql_role" "ro" {
  depends_on = [module.postgres, aws_security_group_rule.ingress_allow_postgres_db]

  name    = "ro"
  inherit = false
}

resource "postgresql_grant" "readonly_tables" {
  depends_on = [module.postgres, aws_security_group_rule.ingress_allow_postgres_db]

  database    = module.postgres.db_instance_name
  role        = postgresql_role.ro.name
  schema      = "public"
  object_type = "table"
  privileges  = ["SELECT"]
}
