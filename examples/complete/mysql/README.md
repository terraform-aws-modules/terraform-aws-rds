Complete RDS example for MySQL
==============================

Configuration in this directory creates set of RDS resources including DB instance, DB subnet group and DB parameter group.

Data sources are used to discover existing VPC resources (VPC, subnet and security group).

Usage
=====

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.
