# Test folder

This folder contains the automated tests for the modules complete-mysql and complete postgres 

## Prerequisites

- The latest version of [Go](https://golang.org/). Minimum version: 1.13
- Hashicorp [Terraform](https://www.terraform.io/downloads.html).
- AWS credentials as environment variables: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`

## If you wants run all the tests

```bash
cd test
go test -v -timeout 45m
```

## If you wants run a specific test

To run a specific test called `TestTerraformAwsCompleteMysql`:

```bash
cd test
go test -v -timeout 45m -run TestTerraformAwsCompleteMysql
```

## TO DO

Automated tests for other modules, soon
