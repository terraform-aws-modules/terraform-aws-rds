# Enhanced Monitoring example

Configuration in this directory creates the additional resources required to use Enhanced Monitoring.

See http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html for details

Data sources are used to discover existing VPC resources (VPC, subnet and security group).

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
