AWS RDS Terraform module
========================

Terraform module which creates RDS resources on AWS.

These types of resources are supported:

* [DB Instance](https://www.terraform.io/docs/providers/aws/r/db_instance.html)
* [DB Subnet Group](https://www.terraform.io/docs/providers/aws/r/db_subnet_group.html)
* [DB Parameter Group](https://www.terraform.io/docs/providers/aws/r/db_parameter_group.html)

Root module calls these modules which can also be used separately to create independent resources:

* [db_instance](modules/db_instance) - creates RDS DB instance
* [db_subnet_group](modules/db_subnet_group) - creates RDS DB subnet group
* [db_parameter_group](modules/db_parameter_group) - creates RDS DB group

Usage
-----

```hcl
module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "demodb"
  
  engine            = "mysql"
  engine_version    = "5.7.11"
  instance_class    = "db.t2.large"
  allocated_storage = 5
  
  name     = "demodb"
  username = "user"
  password = "YourPwdShouldBeLongAndSecure!"
  port     = "3306"
  
  vpc_security_group_ids = ["sg-12345678"]
  
  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  monitoring_interval = "30"
  monitoring_role_arn = "arn:aws:iam::123456789012:role/rds-monitoring-role"
  
  tags = {
    Owner       = "user"
    Environment = "dev"
  }
  
  # DB subnet group
  subnet_ids = ["subnet-12345678", "subnet-87654321"]
  
  # DB parameter group
  family = "mysql5.7"

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

Examples
--------

* [Complete RDS example](examples/complete)
* [Enhanced monitoring example](examples/enhanced_monitoring)

Limitations
-----------

* [module db_parameter_group](modules/db_parameter_group) does not implement setting of parameters

Notes
-----

1. This module does not create RDS security group. Use [terraform-aws-sg](https://github.com/terraform-aws-modules/terraform-aws-sg) module for this.

Authors
-------

Migrated from `terraform-community-modules/tf_aws_rds`, where it was maintained by [these awesome contributors](https://github.com/terraform-community-modules/tf_aws_rds/graphs/contributors).
Currently maintained by [these awesome contributors](https://github.com/terraform-aws-modules/terraform-aws-rds/graphs/contributors).
Module managed by [Anton Babenko](https://github.com/antonbabenko).

License
-------

Apache 2 Licensed. See LICENSE for full details.