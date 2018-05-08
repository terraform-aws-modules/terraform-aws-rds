AWS RDS Terraform module
========================

Terraform module which creates RDS resources on AWS.

These types of resources are supported:

* [DB Instance](https://www.terraform.io/docs/providers/aws/r/db_instance.html)
* [DB Subnet Group](https://www.terraform.io/docs/providers/aws/r/db_subnet_group.html)
* [DB Parameter Group](https://www.terraform.io/docs/providers/aws/r/db_parameter_group.html)

Root module calls these modules which can also be used separately to create independent resources:

* [db_instance](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_instance) - creates RDS DB instance
* [db_subnet_group](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_subnet_group) - creates RDS DB subnet group
* [db_parameter_group](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_parameter_group) - creates RDS DB group

Usage
-----

```hcl
module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "demodb"

  engine            = "mysql"
  engine_version    = "5.7.19"
  instance_class    = "db.t2.large"
  allocated_storage = 5

  name     = "demodb"
  username = "user"
  password = "YourPwdShouldBeLongAndSecure!"
  port     = "3306"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = ["sg-12345678"]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval = "30"
  monitoring_role_name = "MyRDSMonitoringRole"
  create_monitoring_role = true

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  # DB subnet group
  subnet_ids = ["subnet-12345678", "subnet-87654321"]

  # DB parameter group
  family = "mysql5.7"

  # Snapshot name upon DB deletion
  final_snapshot_identifier = "demodb"

  parameters = [
    {
      name = "character_set_client"
      value = "utf8"
    },
    {
      name = "character_set_server"
      value = "utf8"
    }
  ]
}
```

Conditional creation
--------------------

There is also a way to specify an existing database subnet group and parameter group name instead of creating new resources like this:

```hcl
# This RDS instance will be created using default database subnet and parameter group
module "db" {
  source = "terraform-aws-modules/rds/aws"

  db_subnet_group_name = "default"
  parameter_group_name = "default.mysql5.7"

  # ... omitted
}
```

Examples
--------

* [Complete RDS example for MySQL](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples/complete-mysql)
* [Complete RDS example for PostgreSQL](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples/complete-postgres)
* [Complete RDS example for Oracle](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples/complete-oracle)
* [Complete RDS example for MSSQL](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples/complete-mssql)
* [Enhanced monitoring example](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/examples/enhanced-monitoring)

Notes
-----

1. This module does not create RDS security group. Use [terraform-aws-security-group](https://github.com/terraform-aws-modules/terraform-aws-security-group) module for this.

Authors
-------

Currently maintained by [these awesome contributors](https://github.com/terraform-aws-modules/terraform-aws-rds/graphs/contributors).
Migrated from `terraform-community-modules/tf_aws_rds`, where it was maintained by [these awesome contributors](https://github.com/terraform-community-modules/tf_aws_rds/graphs/contributors).
Module managed by [Anton Babenko](https://github.com/antonbabenko).

License
-------

Apache 2 Licensed. See LICENSE for full details.
