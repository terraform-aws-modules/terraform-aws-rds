<p align="center">
  <img src="https://github.com/terraform-aws-modules/terraform-aws-rds/blob/main/examples/intel-enhanced-mysql/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

## Intel Enhanced Optimizations Example for RDS MySQL

This example creates an Intel Enhanced Optimizations Example for RDS MySQL. The example implements two optimizations:

- Intel Xeon Instance Selection
- Intel Xeon MySQL Optimizations using parameter groups

The RDS database server is created on Intel Xeon 3rd Generation Scalable processors **m6i.xlarge instances by default. Other recommendations can be found on main.tf**

Additionally, the database is pre-configured with parameters within the database parameter group that is optimized for Intel architectures. The goal simplify getting started with an optimally configured database.

The MySQL Optimizations were based off [Intel Xeon Tuning Guide](<https://www.intel.com/content/www/us/en/developer/articles/guide/open-source-database-tuning-guide-on-xeon-systems.html>)

We have included a new sub module that brings in all the optimizations from a stand alone module at <https://github.com/intel/terraform-intel-aws-mysql-parameter-group/>. Within the enhanced optimization code we have made a few updates.

main.tf updates:

```hcl
################################################################################
# Intel Xeon MySQL Enhanced Parameter Group
################################################################################
# https://github.com/intel/terraform-intel-aws-mysql-parameter-group
# Intel Xeon Tuning Guide https://www.intel.com/content/www/us/en/developer/articles/guide/open-source-database-tuning-guide-on-xeon-systems.html

module "aws-mysql-parameter-group" {
  source  = "intel/aws-mysql-parameter-group/intel"
  version = "2.0.0"
}

... 

  ################################################################################
  # Intel
  ################################################################################
  # Intel based 6i Instances running Intel Xeon 3rd Generation Scalable processors (code-named Ice Lake) are recommended for optimal price/performance
  # General Purpose: db.m6i.large, db.m6i.xlarge, db.m6i.2xlarge, db.m6i.4xlarge, db.m6i.8xlarge, db.m6i.12xlarge, db.m6i.16xlarge, db.m6i.24xlarge, db.m6i.32xlarge
  # Memory Optimized: db.r6i.large, db.r6i.xlarge, db.r6i.2xlarge, db.r6i.4xlarge, db.r6i.8xlarge, db.r6i.12xlarge, db.r6i.16xlarge, db.r6i.24xlarge, db.r6i.32xlarge

  # Intel Instance selection
  instance_class       = "db.m6i.large"
  # Intel parameter group selection
  parameter_group_name = module.aws-mysql-parameter-group.db_parameter_group_name

```

## Usage

To run this example you need to execute:

```bash
terraform init
terraform plan
terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

## Performance Data

<center>

#### [Process up to 1.33x more MySQL database transactions with the 3rd Generation Intel® Xeon® Scalable Processor (Ice Lake) vs. previous generation](https://www.intel.com/content/www/us/en/content-details/753185/book-up-to-1-42x-the-reservations-at-once-with-aws-ec2-m6i-instances-vs-aws-m5n-instances.html)

<p align="center">
  <a href="https://www.intel.com/content/www/us/en/content-details/753185/book-up-to-1-42x-the-reservations-at-once-with-aws-ec2-m6i-instances-vs-aws-m5n-instances.html">
  <img src="https://github.com/intel/terraform-intel-aws-mysql/blob/main/images/aws-mysql-1.png?raw=true" alt="Link" width="600"/>
  </a>
</p>

#

#### [Handle up to 1.32x more MySQL transactions per minute with AWS M6i 3rd Generation Intel® Xeon® Scalable Processor (Ice Lake) vs. previous generation](https://www.intel.com/content/www/us/en/content-details/752377/select-aws-ec2-m6i-instances-and-support-up-to-1-38x-the-ecommerce-transactions-for-mysql-databases-vs-aws-ec2-m5-instances.html)

<p align="center">
  <a href="https://www.intel.com/content/www/us/en/content-details/752377/select-aws-ec2-m6i-instances-and-support-up-to-1-38x-the-ecommerce-transactions-for-mysql-databases-vs-aws-ec2-m5-instances.html">
  <img src="https://github.com/intel/terraform-intel-aws-mysql/blob/main/images/aws-mysql-2.png?raw=true" alt="Link" width="600"/>
  </a>
</p>

#

#### [Get better price per performance($$/per) value by selecting Intel® Xeon® Scalable Processor vs. ARM](https://www.intel.com/content/www/us/en/content-details/765568/increase-mysql-database-transactions-by-1-65x-with-aws-ec2-m5-instances-vs-aws-ec2-m6g-instances.html)

<p align="center">
  <a href="https://www.intel.com/content/www/us/en/content-details/765568/increase-mysql-database-transactions-by-1-65x-with-aws-ec2-m5-instances-vs-aws-ec2-m6g-instances.html">
  <img src="https://github.com/intel/terraform-intel-aws-mysql/blob/main/images/aws-mysql-3.png?raw=true" alt="Link" width="600"/>
  </a>
</p>

#

#### [Process up to 1.18x more MySQL Transactions with AWS EC2 C5 Instances vs. AWS EC2 C5a Instances](https://www.intel.com/content/www/us/en/content-details/756027/process-up-to-1-18x-more-mysql-transactions-with-aws-ec2-c5-instances-vs-aws-ec2-c5a-instances.html)

<p align="center">
  <a href="https://www.intel.com/content/www/us/en/content-details/756027/process-up-to-1-18x-more-mysql-transactions-with-aws-ec2-c5-instances-vs-aws-ec2-c5a-instances.html">
  <img src="https://github.com/intel/terraform-intel-aws-mysql/blob/main/images/aws-mysql-4.png?raw=true" alt="Link" width="600"/>
  </a>
</p>

</center>

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.25 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.25 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_db"></a> [db](#module\_db) | ../.. | n/a |
| <a name="module_intel_parameter_group"></a> [intel\_parameter\_group](#module\_intel\_parameter\_group) | intel/aws-mysql-parameter-group/intel | ~> 2.0 |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | terraform-aws-modules/security-group/aws | ~> 5.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_enhanced_monitoring_iam_role_arn"></a> [db\_enhanced\_monitoring\_iam\_role\_arn](#output\_db\_enhanced\_monitoring\_iam\_role\_arn) | The Amazon Resource Name (ARN) specifying the monitoring role |
| <a name="output_db_instance_address"></a> [db\_instance\_address](#output\_db\_instance\_address) | The address of the RDS instance |
| <a name="output_db_instance_arn"></a> [db\_instance\_arn](#output\_db\_instance\_arn) | The ARN of the RDS instance |
| <a name="output_db_instance_availability_zone"></a> [db\_instance\_availability\_zone](#output\_db\_instance\_availability\_zone) | The availability zone of the RDS instance |
| <a name="output_db_instance_cloudwatch_log_groups"></a> [db\_instance\_cloudwatch\_log\_groups](#output\_db\_instance\_cloudwatch\_log\_groups) | Map of CloudWatch log groups created and their attributes |
| <a name="output_db_instance_endpoint"></a> [db\_instance\_endpoint](#output\_db\_instance\_endpoint) | The connection endpoint |
| <a name="output_db_instance_engine"></a> [db\_instance\_engine](#output\_db\_instance\_engine) | The database engine |
| <a name="output_db_instance_engine_version_actual"></a> [db\_instance\_engine\_version\_actual](#output\_db\_instance\_engine\_version\_actual) | The running version of the database |
| <a name="output_db_instance_hosted_zone_id"></a> [db\_instance\_hosted\_zone\_id](#output\_db\_instance\_hosted\_zone\_id) | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| <a name="output_db_instance_identifier"></a> [db\_instance\_identifier](#output\_db\_instance\_identifier) | The RDS instance identifier |
| <a name="output_db_instance_master_user_secret_arn"></a> [db\_instance\_master\_user\_secret\_arn](#output\_db\_instance\_master\_user\_secret\_arn) | The ARN of the master user secret (Only available when manage\_master\_user\_password is set to true) |
| <a name="output_db_instance_name"></a> [db\_instance\_name](#output\_db\_instance\_name) | The database name |
| <a name="output_db_instance_port"></a> [db\_instance\_port](#output\_db\_instance\_port) | The database port |
| <a name="output_db_instance_resource_id"></a> [db\_instance\_resource\_id](#output\_db\_instance\_resource\_id) | The RDS Resource ID of this instance |
| <a name="output_db_instance_status"></a> [db\_instance\_status](#output\_db\_instance\_status) | The RDS instance status |
| <a name="output_db_instance_username"></a> [db\_instance\_username](#output\_db\_instance\_username) | The master username for the database |
| <a name="output_db_parameter_group_arn"></a> [db\_parameter\_group\_arn](#output\_db\_parameter\_group\_arn) | The ARN of the db parameter group |
| <a name="output_db_parameter_group_id"></a> [db\_parameter\_group\_id](#output\_db\_parameter\_group\_id) | The db parameter group id |
| <a name="output_db_subnet_group_arn"></a> [db\_subnet\_group\_arn](#output\_db\_subnet\_group\_arn) | The ARN of the db subnet group |
| <a name="output_db_subnet_group_id"></a> [db\_subnet\_group\_id](#output\_db\_subnet\_group\_id) | The db subnet group name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
