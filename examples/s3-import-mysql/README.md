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
| terraform | >= 0.12.26 |
| aws | >= 2.49 |
| random | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.49 |
| random | >= 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| db | ../../ |  |
| import_s3_bucket | terraform-aws-modules/s3-bucket/aws | 1.17.0 |
| security_group | terraform-aws-modules/security-group/aws | ~> 3.17 |
| vpc | terraform-aws-modules/vpc/aws | 2.70.0 |

## Resources

| Name |
|------|
| [aws_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) |
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) |
| [aws_iam_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) |
| [random_pet](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) |

## Inputs

No input.

## Outputs

| Name | Description |
|------|-------------|
| this\_db\_instance\_address | The address of the RDS instance |
| this\_db\_instance\_arn | The ARN of the RDS instance |
| this\_db\_instance\_availability\_zone | The availability zone of the RDS instance |
| this\_db\_instance\_endpoint | The connection endpoint |
| this\_db\_instance\_hosted\_zone\_id | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| this\_db\_instance\_id | The RDS instance ID |
| this\_db\_instance\_name | The database name |
| this\_db\_instance\_password | The database password (this password may be old, because Terraform doesn't track it after initial creation) |
| this\_db\_instance\_port | The database port |
| this\_db\_instance\_resource\_id | The RDS Resource ID of this instance |
| this\_db\_instance\_status | The RDS instance status |
| this\_db\_instance\_username | The master username for the database |
| this\_db\_parameter\_group\_arn | The ARN of the db parameter group |
| this\_db\_parameter\_group\_id | The db parameter group id |
| this\_db\_subnet\_group\_arn | The ARN of the db subnet group |
| this\_db\_subnet\_group\_id | The db subnet group name |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
