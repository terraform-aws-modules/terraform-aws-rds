# MySQL S3 Import Example

Configuration in this directory creates set of RDS resources including DB instance, DB subnet group and DB parameter group where the database itself is imported from a MySQL Percona Xtrabackup stored in S3.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Testing

In order to test this example, you will need a database backup in order to upload to S3 and import into the module. A backup has been provided under `backup/`, but in the case that a new backup needs to be created, the steps outlined below should suffice for creating a backup that can be used for the sake of testing and verifying module functionality/changes.

1. Create database container

```bash
$ docker run -d --name percona-server-mysql-8.0.20 -e MYSQL_ROOT_PASSWORD=root percona/percona-server:8.0.20
$ docker exec -it percona-server-mysql-8.0.20 bash
$ mysql -u root -p # password is also root
```

2. Once logged into container and database, create database and user used by RDS

```sql
CREATE DATABASE s3Import;
CREATE USER 's3_import_user'@'localhost' IDENTIFIED BY 'YourPwdShouldBeLongAndSecure!';
GRANT ALL PRIVILEGES ON * . * TO 's3_import_user'@'localhost';
FLUSH PRIVILEGES;
```

3. Use Percona Xtrabackup container to dump database and upload to S3

```bash
$ mkdir -p /tmp/backup
$ docker run --name percona-xtrabackup-8.0 --mount type=bind,src=/tmp/backup,dst=/backup --volumes-from percona-server-mysql-8.0.20 percona/percona-xtrabackup:8.0 xtrabackup --backup --data-dir=/var/lib/mysql --target-dir=/backup --user=root --password=root
$ mv /tmp/backup ./backup
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.49 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.49 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_db"></a> [db](#module\_db) | ../../ |  |
| <a name="module_import_s3_bucket"></a> [import\_s3\_bucket](#module\_import\_s3\_bucket) | terraform-aws-modules/s3-bucket/aws | ~> 2.0 |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | terraform-aws-modules/security-group/aws | ~> 4 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 2.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.s3_import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.s3_import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [random_pet.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [aws_iam_policy_document.s3_import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3_import_assume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_instance_address"></a> [db\_instance\_address](#output\_db\_instance\_address) | The address of the RDS instance |
| <a name="output_db_instance_arn"></a> [db\_instance\_arn](#output\_db\_instance\_arn) | The ARN of the RDS instance |
| <a name="output_db_instance_availability_zone"></a> [db\_instance\_availability\_zone](#output\_db\_instance\_availability\_zone) | The availability zone of the RDS instance |
| <a name="output_db_instance_endpoint"></a> [db\_instance\_endpoint](#output\_db\_instance\_endpoint) | The connection endpoint |
| <a name="output_db_instance_hosted_zone_id"></a> [db\_instance\_hosted\_zone\_id](#output\_db\_instance\_hosted\_zone\_id) | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| <a name="output_db_instance_id"></a> [db\_instance\_id](#output\_db\_instance\_id) | The RDS instance ID |
| <a name="output_db_instance_name"></a> [db\_instance\_name](#output\_db\_instance\_name) | The database name |
| <a name="output_db_instance_password"></a> [db\_instance\_password](#output\_db\_instance\_password) | The database password (this password may be old, because Terraform doesn't track it after initial creation) |
| <a name="output_db_instance_port"></a> [db\_instance\_port](#output\_db\_instance\_port) | The database port |
| <a name="output_db_instance_resource_id"></a> [db\_instance\_resource\_id](#output\_db\_instance\_resource\_id) | The RDS Resource ID of this instance |
| <a name="output_db_instance_status"></a> [db\_instance\_status](#output\_db\_instance\_status) | The RDS instance status |
| <a name="output_db_instance_username"></a> [db\_instance\_username](#output\_db\_instance\_username) | The master username for the database |
| <a name="output_db_parameter_group_arn"></a> [db\_parameter\_group\_arn](#output\_db\_parameter\_group\_arn) | The ARN of the db parameter group |
| <a name="output_db_parameter_group_id"></a> [db\_parameter\_group\_id](#output\_db\_parameter\_group\_id) | The db parameter group id |
| <a name="output_db_subnet_group_arn"></a> [db\_subnet\_group\_arn](#output\_db\_subnet\_group\_arn) | The ARN of the db subnet group |
| <a name="output_db_subnet_group_id"></a> [db\_subnet\_group\_id](#output\_db\_subnet\_group\_id) | The db subnet group name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
