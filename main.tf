##################
# DB subnet group
##################
module "db_subnet_group" {
  source = "./modules/db_subnet_group"

  identifier  = "${var.identifier}"
  name_prefix = "${var.identifier}-"
  subnet_ids  = ["${var.subnet_ids}"]

  tags = "${var.tags}"
}

#####################
# DB parameter group
#####################
module "db_parameter_group" {
  source = "./modules/db_parameter_group"

  identifier  = "${var.identifier}"
  name_prefix = "${var.identifier}-"
  family      = "${var.family}"

  parameters = ["${var.parameters}"]

  tags = "${var.tags}"
}

##############
# DB instance
##############
module "db_instance" {
  source = "./modules/db_instance"

  identifier = "${var.identifier}"

  engine            = "${var.engine}"
  engine_version    = "${var.engine_version}"
  instance_class    = "${var.instance_class}"
  allocated_storage = "${var.allocated_storage}"
  storage_type      = "${var.storage_type}"
  storage_encrypted = "${var.storage_encrypted}"
  kms_key_id        = "${var.kms_key_id}"

  name     = "${var.name}"
  username = "${var.username}"
  password = "${var.password}"
  port     = "${var.port}"

  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  db_subnet_group_name   = "${module.db_subnet_group.this_db_subnet_group_id}"
  parameter_group_name   = "${module.db_parameter_group.this_db_parameter_group_id}"

  multi_az            = "${var.multi_az}"
  iops                = "${var.iops}"
  publicly_accessible = "${var.publicly_accessible}"

  allow_major_version_upgrade = "${var.allow_major_version_upgrade}"
  auto_minor_version_upgrade  = "${var.auto_minor_version_upgrade}"
  apply_immediately           = "${var.apply_immediately}"
  maintenance_window          = "${var.maintenance_window}"
  skip_final_snapshot         = "${var.skip_final_snapshot}"
  copy_tags_to_snapshot       = "${var.copy_tags_to_snapshot}"

  backup_retention_period = "${var.backup_retention_period}"
  backup_window           = "${var.backup_window}"

  storage_encrypted = "${var.encrypted}"

  tags = "${var.tags}"
}
