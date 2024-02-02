# Changelog

All notable changes to this project will be documented in this file.

## [6.4.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v6.3.1...v6.4.0) (2024-02-02)


### Features

* Secretsmanager secret rotation for master user password ([#537](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/537)) ([93c85ef](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/93c85efddeac23ce1dbf96f7e53d8326bca71e25))

### [6.3.1](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v6.3.0...v6.3.1) (2024-01-10)


### Bug Fixes

* Align the default value of `manage_master_user_password` in the instance sub-module with the root module ([#531](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/531)) ([8b90616](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/8b906169527162faa8fc928aa9b5edf6cfbc1f5e))

## [6.3.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v6.2.0...v6.3.0) (2023-11-13)


### Features

* Blue/green deployment for postgres ([#517](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/517)) ([9c18851](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/9c188514304cba0c05bfd88d219e676cb518e710))

## [6.2.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v6.1.1...v6.2.0) (2023-10-23)


### Features

* Add `db_instance_role_association` functionality ([#508](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/508)) ([ed027d7](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/ed027d7daa2a03df909479c3becc6bb621b7193f))

### [6.1.1](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v6.1.0...v6.1.1) (2023-08-05)


### Bug Fixes

* Change `allocated_storage` type from string to number ([#507](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/507)) ([5939ddf](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/5939ddf85ef740db8896fd475cac8f1c3fae8e8f))

## [6.1.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v6.0.0...v6.1.0) (2023-07-11)


### Features

* Pass through db_instance_master_user_secret_arn ([#502](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/502)) ([f0eb9f3](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/f0eb9f3e14b61478a772dc8bb5d3f83bb0da3294))

## [6.0.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v5.9.0...v6.0.0) (2023-06-25)


### ⚠ BREAKING CHANGES

* Replace random password generation with manage master password, min AWS provider version increased to 5.0, `id` output replaced with `identifier` (#489)

### Features

* Replace random password generation with manage master password, min AWS provider version increased to 5.0, `id` output replaced with `identifier` ([#489](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/489)) ([c66cd73](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/c66cd738f86b9cd0742d9838635970ef7b5743e4))

## [5.9.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v5.8.0...v5.9.0) (2023-05-03)


### Features

* Add output for SQL Server `listener_endpoint` ([#486](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/486)) ([564fae2](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/564fae2f62400e5fd149ed8c34c53d64bf96f9d7))

## [5.8.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v5.7.0...v5.8.0) (2023-05-03)


### Features

* Allow replicas to have a different version than primary ([#491](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/491)) ([7a0542d](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/7a0542d0281b91ee72835ad430edb64dcdb26f51))

## [5.7.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v5.6.0...v5.7.0) (2023-05-02)


### Features

* Add support for Oracle `nchar_character_set_name` ([#487](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/487)) ([c7fd6c5](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/c7fd6c53680236e5afd2562cdfad7d050175b713))

## [5.6.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v5.5.0...v5.6.0) (2023-02-17)


### Features

* Add support for permissions boundary on enhanced monitoring role ([#483](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/483)) ([b3e0aec](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/b3e0aec5efccbffd4e69d59bf7f7688a2c1f4ecf))

## [5.5.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v5.4.2...v5.5.0) (2023-02-17)


### Features

* Add support for permissions boundary on enhanced monitoring role ([#482](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/482)) ([0500e12](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/0500e12acf5ab9b100fbe995915461df43e94b38))

### [5.4.2](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v5.4.1...v5.4.2) (2023-02-12)


### Bug Fixes

* Update cloudwatch log group creation conditional ([#481](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/481)) ([927b714](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/927b714cdad3c8b1f8e28c3b0fb35f962916630f))

### [5.4.1](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v5.4.0...v5.4.1) (2023-02-08)


### Bug Fixes

* Revert `ignore_changes` for instance `latest_restorable_time` ([#479](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/479)) ([b80ec03](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/b80ec0399348c889f54d30a11fa7c4f58f320ca5))

## [5.4.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v5.3.1...v5.4.0) (2023-02-07)


### Features

* Add support for custom iam instance profile ([#473](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/473)) ([2795d5a](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/2795d5adb78643e77a2cd842670bbd4464d12003))

### [5.3.1](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v5.3.0...v5.3.1) (2023-02-07)


### Bug Fixes

* Ignore changes to last_restorable_time ([#476](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/476)) ([acb3d51](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/acb3d51a6bd6494260e91d0621ff962712d1c32e))

## [5.3.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v5.2.3...v5.3.0) (2023-01-28)


### Features

* Support blue/green updates ([#468](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/468)) ([af8c0ec](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/af8c0ec726ab84ef34a4a6cab0f1dc45a65ebdc5))

### [5.2.3](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v5.2.2...v5.2.3) (2023-01-03)


### Bug Fixes

* Ensure that passing values for option group with PostgreSQL does not cause errors ([#467](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/467)) ([696acbb](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/696acbb237352988562f78b30897f29cfe8da58a))

### [5.2.2](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v5.2.1...v5.2.2) (2022-12-20)


### Bug Fixes

* Default value of iops in main module ([#462](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/462)) ([d84b4b4](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/d84b4b4b4184cf2a32cf313b4fe294590cbdcd12))

### [5.2.1](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v5.2.0...v5.2.1) (2022-12-14)


### Bug Fixes

* Change RDS variable `iops` default value from `0` to `null` ([#456](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/456)) ([9c8d21f](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/9c8d21fc07d798203b1e96fa893e68d1fa04058e))

## [5.2.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v5.1.1...v5.2.0) (2022-12-05)


### Features

* Add support for `storage_throughput` ([#453](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/453)) ([d81bf1f](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/d81bf1f351be2d4939f7aae4625f20cc047de7a5))

### [5.1.1](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v5.1.0...v5.1.1) (2022-11-12)


### Bug Fixes

* Update CI configuration files to use latest version ([#438](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/438)) ([113a08b](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/113a08b0d4972b953b105879a487c71c9a542b3c))

## [5.1.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v5.0.3...v5.1.0) (2022-09-11)


### Features

* Add support for `network_type` ([#431](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/431)) ([a277924](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/a27792484f9634462827baf2feb663a8800e2ce4))

### [5.0.3](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v5.0.2...v5.0.3) (2022-08-15)


### Bug Fixes

* Fixed example of cross-region replica where KMS key was missing ([#428](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/428)) ([88418a7](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/88418a71bb6338cc176858cea926fade3a4eb6f8))

### [5.0.2](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v5.0.1...v5.0.2) (2022-08-11)


### Bug Fixes

* Replace deprecated name property in outputs ([#426](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/426)) ([c6e87d1](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/c6e87d1c47b0b556000719a969dd8ab62322085e))

### [5.0.1](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v5.0.0...v5.0.1) (2022-07-25)


### Bug Fixes

* Cloudwatch Log Group deletion db_instance dependency ([#423](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/423)) ([e6351a3](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/e6351a3f2bc57db305be68c78cfdce65bbb82aaf))

## [5.0.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v4.7.0...v5.0.0) (2022-07-21)


### ⚠ BREAKING CHANGES

* Update Terraform and provider versions to v1.x and v4.x, mark password input as sensitive (#420)

### Features

* Update Terraform and provider versions to v1.x and v4.x, mark password input as sensitive ([#420](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/420)) ([808407d](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/808407dfb4944ca2701d3c9d25d8f4347238dddd))

## [4.7.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v4.6.0...v4.7.0) (2022-07-14)


### Features

* Add support for `aws_db_instance_automated_backups_replication` ([#413](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/413)) ([f1e15a1](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/f1e15a16a30fa291a33ff9719cc72687124e96d0))

## [4.6.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v4.5.0...v4.6.0) (2022-07-13)


### Features

* Support `name_prefix` in `iam_role.enhanced_monitoring` ([#418](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/418)) ([644d255](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/644d25528017bc6a7d0c73fbb9b91243ff51933b))

## [4.5.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v4.4.0...v4.5.0) (2022-07-06)


### Features

* Add support for `identifier_prefix` ([#416](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/416)) ([125c426](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/125c426fc00cd1f2744189a30f9225778169cefb))

## [4.4.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v4.3.0...v4.4.0) (2022-05-27)


### Features

* Add `engine` and `engine_version_actual` outputs ([#404](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/404)) ([00b9858](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/00b98589d2e8e37a24118887241d74d2b8d0715c))

## [4.3.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v4.2.0...v4.3.0) (2022-04-27)


### Features

* Support `source_db_instance_automated_backups_arn` parameter in `restore_to_point_in_time` block ([#398](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/398)) ([559e6b1](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/559e6b11b76b428e8752e094366c36bea2c2c298))

## [4.2.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v4.1.3...v4.2.0) (2022-03-12)


### Features

* Made it clear that we stand with Ukraine ([e8dfedb](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/e8dfedb8792dce34cd029fa46cf1bf071cfc7faa))

### [4.1.3](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v4.1.2...v4.1.3) (2022-02-23)


### Bug Fixes

* Correct random password lifecycle by eagerly creating random password value ([#388](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/388)) ([b41a0a5](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/b41a0a5ef6d3b8ee590ec22507c3af85df985521))

### [4.1.2](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v4.1.1...v4.1.2) (2022-02-18)


### Bug Fixes

* Correct usage of `password` and allow restored snapshots to set password, username, etc. ([#384](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/384)) ([81db512](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/81db51292cbbb1a23b3649814691498514fbd273))

### [4.1.1](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v4.1.0...v4.1.1) (2022-02-17)


### Bug Fixes

* Remove check for `is_mssql` which is no longer valid ([#382](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/382)) ([f4481e6](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/f4481e6f4c21452840627b8cd229753229c04e5c))

## [4.1.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v4.0.0...v4.1.0) (2022-02-17)


### Features

* Add support for managing CloudWatch log groups ([#380](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/380)) ([761fb7f](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/761fb7f5b8d7bb8ae99c54d8fa143c40d0772c0a))

## [4.0.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v3.5.0...v4.0.0) (2022-02-16)


### ⚠ BREAKING CHANGES

* Update default values for security posture improvement (#369)

### Features

* Update default values for security posture improvement ([#369](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/369)) ([9149ec1](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/9149ec147327fbe5a7675ac48e9e641b5d7ec6e1))

## [3.5.0](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v3.4.2...v3.5.0) (2022-01-12)


### Features

* Added `latest_restorable_time` to ignore_changes ([#356](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/356)) ([77902c2](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/77902c21414f24026d720e72068e589b3855fab8))

### [3.4.2](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v3.4.1...v3.4.2) (2022-01-10)


### Bug Fixes

* update CI/CD process to align auto-release workflow ([#366](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/366)) ([e38aace](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/e38aaced17278567973dad4980fae8757d6a1265))

# Changelog

All notable changes to this project will be documented in this file

## [3.4.1](https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v3.4.0...v3.4.1) (2021-11-07)


### Bug Fixes

* update CI/CD process to use composite actions and auto-release workflow ([#361](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/361)) ([123ea2a](https://github.com/terraform-aws-modules/terraform-aws-rds/commit/123ea2a136c913de0588d4820b291eb4d1d74d61))

<a name="v3.4.0"></a>
## [v3.4.0] - 2021-09-07

- feat: Add new parameter monitoring_role_description ([#350](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/350))
- docs: create_option_group -> create_db_option_group in README ([#348](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/348))


<a name="v3.3.0"></a>
## [v3.3.0] - 2021-07-07

- feat: allow the creation of cross-region rds replicas ([#346](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/346))


<a name="v3.2.0"></a>
## [v3.2.0] - 2021-06-28

- feat: Add restore_to_point_in_time support for databases ([#338](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/338))


<a name="v3.1.0"></a>
## [v3.1.0] - 2021-05-26

- fix: add default values to allow for completely disabling module with bare minimum input ([#342](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/342))
- chore: Update README.md to current version ([#339](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/339))
- chore: update CI/CD to use stable `terraform-docs` release artifact and discoverable Apache2.0 license ([#332](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/332))
- chore: Updated versions&comments in examples


<a name="v3.0.0"></a>
## [v3.0.0] - 2021-04-26

- feat: Shorten outputs (removing this_) ([#330](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/330))


<a name="v2.35.0"></a>
## [v2.35.0] - 2021-04-24

- fix: mark sensitive outputs to support Terraform 0.15.x ([#329](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/329))
- chore: update documentation and pin `terraform_docs` version to avoid future changes ([#323](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/323))


<a name="v2.34.0"></a>
## [v2.34.0] - 2021-03-19

- feat: Support different tags per resource ([#319](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/319))


<a name="v2.33.0"></a>
## [v2.33.0] - 2021-03-18

- fix: correct monitoring role ARN lookup ([#318](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/318))


<a name="v2.32.0"></a>
## [v2.32.0] - 2021-03-18

- feat: support for random password ([#306](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/306))


<a name="v2.31.0"></a>
## [v2.31.0] - 2021-03-16

- chore: correct examples and scenario where replicas are used ([#317](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/317))


<a name="v2.30.0"></a>
## [v2.30.0] - 2021-03-15

- chore: remove default values and replace with null to use upstream default settings ([#315](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/315))


<a name="v2.29.0"></a>
## [v2.29.0] - 2021-03-14

- fix: set snapshot identifier and backup retention period to null to default to AWS provider settings ([#314](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/314))
- chore: Use utf8mb4 in mysql examples ([#313](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/313))


<a name="v2.28.0"></a>
## [v2.28.0] - 2021-03-14

- fix: update subnet group to fix name vs name_prefix ([#312](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/312))


<a name="v2.27.0"></a>
## [v2.27.0] - 2021-03-11

- feat: Add support for character_set_name with MSSQL Server ([#281](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/281))


<a name="v2.26.0"></a>
## [v2.26.0] - 2021-03-10

- fix: default to AWS provided option and parameter groups when not creating nor providing ([#308](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/308))


<a name="v2.25.0"></a>
## [v2.25.0] - 2021-03-09

- fix: update parameter group to fix name vs. name_prefix ([#304](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/304))


<a name="v2.24.0"></a>
## [v2.24.0] - 2021-03-08

- fix: update option group to fix name vs. name_prefix and conditional creation for postgresql ([#302](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/302))
- chore: update README.md documentation ([#300](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/300))


<a name="v2.23.0"></a>
## [v2.23.0] - 2021-03-08

- chore: update example projects ([#298](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/298))
- chore: align ci-cd static checks to use individual minimum Terraform versions ([#297](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/297))


<a name="v2.22.0"></a>
## [v2.22.0] - 2021-03-01

- feat: Add support for performance_insights_kms_key_id ([#253](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/253))


<a name="v2.21.0"></a>
## [v2.21.0] - 2021-02-22

- feat: add S3 import functionality which is supported for MySQL instances ([#289](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/289))
- chore: add `terraform_validate` hook to pre-commit checks ([#293](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/293))
- chore: add ci-cd workflow for pre-commit checks ([#292](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/292))
- chore: update documentation based on latest `terraform-docs` which includes module and resource sections ([#288](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/288))
- fix: documentation for default storage type ([#277](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/277))


<a name="v2.20.0"></a>
## [v2.20.0] - 2020-10-15

- fix: Added possibility to specify partition used in iam role policy attachment ([#256](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/256))


<a name="v2.19.0"></a>
## [v2.19.0] - 2020-10-15

- fix: Added tflint and fixes in README ([#265](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/265))
- docs: Change account to account ([#261](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/261))


<a name="v2.18.0"></a>
## [v2.18.0] - 2020-08-13

- feat: Bump version of AWS provider to support v3


<a name="v2.17.0"></a>
## [v2.17.0] - 2020-07-20

- Upgraded Terraform version supported
- feat: add Windows authentication ([#177](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/177))


<a name="v2.16.0"></a>
## [v2.16.0] - 2020-06-13

- feat: add handling for delete_automated_backups flag ([#215](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/215))


<a name="v2.15.0"></a>
## [v2.15.0] - 2020-05-13

- fix: Update minimum provider version to account for ca_cert_identifier ([#226](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/226))
- Updated pre-commit-terraform
- Updated pre-commit-terraform
- Updated pre-commit-terraform
- Fix / CA Cert Instance Default ([#189](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/189))
- Added delete timeout for db_option_group ([#186](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/186))
- Fix for issue when MonitoringRoleARN is required ([#143](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/143))
- Fix `enable_create_db_option_group` to use override first & computed second ([#170](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/170))
- Add outputs for the monitoring role arn ([#181](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/181))
- Update CA Certificate identifier default to 'rds-ca-2019' ([#182](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/182))
- Mark password as sensitive (closes [#98](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/98))
- Added ca_cert_identifier to outputs
- Updated formatting after PR [#174](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/174)
- Add support for ca_cert_identifier option ([#174](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/174))
- Disable perf insights ret period when disabled ([#153](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/153))
- Update documentation a bit after merge
- Add support for performance insights retention period ([#147](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/147))
- Update documentation a bit after merge
- Support for max_allocated_storage ([#146](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/146))
- Added performance_insights support ([#139](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/139))
- Updated pre-commit
- Fixed variable default for parameters ([#138](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/138))
- Upgraded module to support Terraform 0.12 ([#126](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/126))


<a name="v1.37.0"></a>
## [v1.37.0] - 2020-02-21

- Updated pre-commit hooks
- Set ca_cert_identifier default for internal module ([#196](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/196))
- Added delete timeout for db_option_group ([#187](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/187))
- Fix for issue when MonitoringRoleARN is required ([#140](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/140))
- Fixed default value for CA certificate identifier ([#183](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/183))
- Updated formatting after PR [#175](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/175)
- Add support for ca_cert_identifier option ([#175](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/175))
- Fix formatting for 0.11.14 ([#161](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/161))
- feat(storage): added support for max_allocated_storage ([#155](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/155))
- Use boolean value in condition ([#148](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/148))
- Update documentation a bit after merge
- Use false instead of 0 in enable_create_db_option_group flag ([#137](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/137))
- Add support of performance_insights_enabled ([#132](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/132))
- Use false instead of 0 in enable_create_db_option_group flag


<a name="v2.14.0"></a>
## [v2.14.0] - 2020-02-10

- Updated pre-commit-terraform
- Updated pre-commit-terraform
- Fix / CA Cert Instance Default ([#189](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/189))
- Added delete timeout for db_option_group ([#186](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/186))
- Fix for issue when MonitoringRoleARN is required ([#143](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/143))
- Fix `enable_create_db_option_group` to use override first & computed second ([#170](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/170))
- Add outputs for the monitoring role arn ([#181](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/181))
- Update CA Certificate identifier default to 'rds-ca-2019' ([#182](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/182))
- Mark password as sensitive (closes [#98](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/98))
- Added ca_cert_identifier to outputs
- Updated formatting after PR [#174](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/174)
- Add support for ca_cert_identifier option ([#174](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/174))
- Disable perf insights ret period when disabled ([#153](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/153))
- Update documentation a bit after merge
- Add support for performance insights retention period ([#147](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/147))
- Update documentation a bit after merge
- Support for max_allocated_storage ([#146](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/146))
- Added performance_insights support ([#139](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/139))
- Updated pre-commit
- Fixed variable default for parameters ([#138](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/138))
- Upgraded module to support Terraform 0.12 ([#126](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/126))


<a name="v1.36.0"></a>
## [v1.36.0] - 2020-01-09

- Added delete timeout for db_option_group ([#187](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/187))
- Fix for issue when MonitoringRoleARN is required ([#140](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/140))
- Fixed default value for CA certificate identifier ([#183](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/183))
- Updated formatting after PR [#175](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/175)
- Add support for ca_cert_identifier option ([#175](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/175))
- Fix formatting for 0.11.14 ([#161](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/161))
- feat(storage): added support for max_allocated_storage ([#155](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/155))
- Use boolean value in condition ([#148](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/148))
- Update documentation a bit after merge
- Use false instead of 0 in enable_create_db_option_group flag ([#137](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/137))
- Add support of performance_insights_enabled ([#132](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/132))
- Use false instead of 0 in enable_create_db_option_group flag


<a name="v2.13.0"></a>
## [v2.13.0] - 2020-01-09

- Added delete timeout for db_option_group ([#186](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/186))
- Fix for issue when MonitoringRoleARN is required ([#143](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/143))
- Fix `enable_create_db_option_group` to use override first & computed second ([#170](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/170))
- Add outputs for the monitoring role arn ([#181](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/181))
- Update CA Certificate identifier default to 'rds-ca-2019' ([#182](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/182))
- Mark password as sensitive (closes [#98](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/98))
- Added ca_cert_identifier to outputs
- Updated formatting after PR [#174](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/174)
- Add support for ca_cert_identifier option ([#174](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/174))
- Disable perf insights ret period when disabled ([#153](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/153))
- Update documentation a bit after merge
- Add support for performance insights retention period ([#147](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/147))
- Update documentation a bit after merge
- Support for max_allocated_storage ([#146](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/146))
- Added performance_insights support ([#139](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/139))
- Updated pre-commit
- Fixed variable default for parameters ([#138](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/138))
- Upgraded module to support Terraform 0.12 ([#126](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/126))


<a name="v1.35.0"></a>
## [v1.35.0] - 2020-01-07

- Fix for issue when MonitoringRoleARN is required ([#140](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/140))
- Fixed default value for CA certificate identifier ([#183](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/183))
- Updated formatting after PR [#175](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/175)
- Add support for ca_cert_identifier option ([#175](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/175))
- Fix formatting for 0.11.14 ([#161](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/161))
- feat(storage): added support for max_allocated_storage ([#155](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/155))
- Use boolean value in condition ([#148](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/148))
- Update documentation a bit after merge
- Use false instead of 0 in enable_create_db_option_group flag ([#137](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/137))
- Add support of performance_insights_enabled ([#132](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/132))
- Use false instead of 0 in enable_create_db_option_group flag


<a name="v2.12.0"></a>
## [v2.12.0] - 2020-01-07

- Fix for issue when MonitoringRoleARN is required ([#143](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/143))
- Fix `enable_create_db_option_group` to use override first & computed second ([#170](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/170))
- Add outputs for the monitoring role arn ([#181](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/181))
- Update CA Certificate identifier default to 'rds-ca-2019' ([#182](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/182))
- Mark password as sensitive (closes [#98](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/98))
- Added ca_cert_identifier to outputs
- Updated formatting after PR [#174](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/174)
- Add support for ca_cert_identifier option ([#174](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/174))
- Disable perf insights ret period when disabled ([#153](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/153))
- Update documentation a bit after merge
- Add support for performance insights retention period ([#147](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/147))
- Update documentation a bit after merge
- Support for max_allocated_storage ([#146](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/146))
- Added performance_insights support ([#139](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/139))
- Updated pre-commit
- Fixed variable default for parameters ([#138](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/138))
- Upgraded module to support Terraform 0.12 ([#126](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/126))


<a name="v1.34.0"></a>
## [v1.34.0] - 2020-01-07

- Fixed default value for CA certificate identifier ([#183](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/183))
- Updated formatting after PR [#175](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/175)
- Add support for ca_cert_identifier option ([#175](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/175))
- Fix formatting for 0.11.14 ([#161](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/161))
- feat(storage): added support for max_allocated_storage ([#155](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/155))
- Use boolean value in condition ([#148](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/148))
- Update documentation a bit after merge
- Use false instead of 0 in enable_create_db_option_group flag ([#137](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/137))
- Add support of performance_insights_enabled ([#132](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/132))
- Use false instead of 0 in enable_create_db_option_group flag


<a name="v2.11.0"></a>
## [v2.11.0] - 2020-01-07

- Fix `enable_create_db_option_group` to use override first & computed second ([#170](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/170))


<a name="v2.10.0"></a>
## [v2.10.0] - 2020-01-07

- Add outputs for the monitoring role arn ([#181](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/181))


<a name="v2.9.0"></a>
## [v2.9.0] - 2020-01-07

- Update CA Certificate identifier default to 'rds-ca-2019' ([#182](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/182))


<a name="v2.8.0"></a>
## [v2.8.0] - 2019-12-20

- Mark password as sensitive (closes [#98](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/98))


<a name="v2.7.0"></a>
## [v2.7.0] - 2019-12-20

- Added ca_cert_identifier to outputs


<a name="v2.6.0"></a>
## [v2.6.0] - 2019-12-20

- Updated formatting after PR [#174](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/174)
- Add support for ca_cert_identifier option ([#174](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/174))
- Disable perf insights ret period when disabled ([#153](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/153))
- Update documentation a bit after merge
- Add support for performance insights retention period ([#147](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/147))
- Update documentation a bit after merge
- Support for max_allocated_storage ([#146](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/146))
- Added performance_insights support ([#139](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/139))
- Updated pre-commit
- Fixed variable default for parameters ([#138](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/138))
- Upgraded module to support Terraform 0.12 ([#126](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/126))


<a name="v1.33.0"></a>
## [v1.33.0] - 2019-12-20

- Updated formatting after PR [#175](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/175)
- Add support for ca_cert_identifier option ([#175](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/175))


<a name="v1.32.0"></a>
## [v1.32.0] - 2019-08-27

- Fix formatting for 0.11.14 ([#161](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/161))


<a name="v1.31.0"></a>
## [v1.31.0] - 2019-07-28

- feat(storage): added support for max_allocated_storage ([#155](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/155))
- Use boolean value in condition ([#148](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/148))
- Update documentation a bit after merge
- Use false instead of 0 in enable_create_db_option_group flag ([#137](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/137))
- Add support of performance_insights_enabled ([#132](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/132))
- Use false instead of 0 in enable_create_db_option_group flag


<a name="v2.5.0"></a>
## [v2.5.0] - 2019-07-21

- Disable perf insights ret period when disabled ([#153](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/153))


<a name="v2.4.0"></a>
## [v2.4.0] - 2019-07-17

- Update documentation a bit after merge
- Add support for performance insights retention period ([#147](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/147))
- Update documentation a bit after merge
- Support for max_allocated_storage ([#146](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/146))
- Added performance_insights support ([#139](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/139))
- Updated pre-commit
- Fixed variable default for parameters ([#138](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/138))
- Upgraded module to support Terraform 0.12 ([#126](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/126))


<a name="v1.30.0"></a>
## [v1.30.0] - 2019-07-17

- Use boolean value in condition ([#148](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/148))
- Update documentation a bit after merge
- Use false instead of 0 in enable_create_db_option_group flag ([#137](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/137))
- Add support of performance_insights_enabled ([#132](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/132))
- Use false instead of 0 in enable_create_db_option_group flag


<a name="v2.3.0"></a>
## [v2.3.0] - 2019-07-17

- Update documentation a bit after merge
- Support for max_allocated_storage ([#146](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/146))


<a name="v2.2.0"></a>
## [v2.2.0] - 2019-06-28

- Added performance_insights support ([#139](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/139))
- Updated pre-commit
- Fixed variable default for parameters ([#138](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/138))
- Upgraded module to support Terraform 0.12 ([#126](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/126))


<a name="v1.29.0"></a>
## [v1.29.0] - 2019-06-28

- Update documentation a bit after merge
- Use false instead of 0 in enable_create_db_option_group flag ([#137](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/137))
- Add support of performance_insights_enabled ([#132](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/132))
- Use false instead of 0 in enable_create_db_option_group flag


<a name="v2.1.0"></a>
## [v2.1.0] - 2019-06-28

- Updated pre-commit
- Fixed variable default for parameters ([#138](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/138))


<a name="v2.0.0"></a>
## [v2.0.0] - 2019-06-11

- Upgraded module to support Terraform 0.12 ([#126](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/126))
- Fixed formatting


<a name="v1.28.0"></a>
## [v1.28.0] - 2019-03-29

- Updates cloudwatch logs exports for PostgreSQL ([#110](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/110))


<a name="v1.27.0"></a>
## [v1.27.0] - 2019-03-22

- Remove unused submodule output ([#108](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/108))


<a name="v1.26.0"></a>
## [v1.26.0] - 2019-03-18

- allowing custom parameter_group to pass down the stack ([#106](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/106))


<a name="v1.25.0"></a>
## [v1.25.0] - 2019-03-16

- Add tags to enhanced_monitoring iam_role ([#102](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/102))


<a name="v1.24.0"></a>
## [v1.24.0] - 2019-03-11

- Added changelog after changelog feature is added
- Add Changelog ([#100](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/100))


<a name="v1.23.0"></a>
## [v1.23.0] - 2019-03-10

- Allow create of parameter group with custom name ([#99](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/99))


<a name="v1.22.0"></a>
## [v1.22.0] - 2018-10-06

- Fixed documentation after [#83](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/83)
- Add deletion protection argument ([#83](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/83))
- Sort values of enabled_cloudwatch_logs_exports in example


<a name="v1.21.0"></a>
## [v1.21.0] - 2018-08-18

- Added support for enabled cloudwatch logs exports (fixes [#70](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/70)) ([#74](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/74))


<a name="v1.20.0"></a>
## [v1.20.0] - 2018-08-18

- Minor updates after [#64](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/64) ([#73](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/73))


<a name="v1.19.0"></a>
## [v1.19.0] - 2018-06-20

- Updated example to show usage of options group (fixed [#63](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/63))


<a name="v1.18.0"></a>
## [v1.18.0] - 2018-06-06

- Disable creation of db option group for Postgres (fixes [#62](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/62))


<a name="v1.17.0"></a>
## [v1.17.0] - 2018-06-04

- Minor fixes for db_option_group ([#55](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/55)) and prepared release
- Simplified outputs
- Add option group support ([#55](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/55))
- fixing small spelling mistake ([#61](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/61))


<a name="v1.16.0"></a>
## [v1.16.0] - 2018-05-16

- Added pre-commit hook to autogenerate terraform-docs ([#59](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/59))


<a name="v1.15.0"></a>
## [v1.15.0] - 2018-04-03

- Minor change to mssql example
- MSSQL: Adding two missing arguments for aws_db_instance: timezone & character_set_name ([#51](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/51))


<a name="v1.14.0"></a>
## [v1.14.0] - 2018-03-14

- Updated readme with conditional creation section
- Enable db_parameter_group_name variable ([#47](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/47))


<a name="v1.13.0"></a>
## [v1.13.0] - 2018-03-06

- Updated examples
- Renamed count to created in submodules ([#44](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/44))


<a name="v1.12.0"></a>
## [v1.12.0] - 2018-02-15

- Added availability_zone to root module ([#40](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/40))


<a name="v1.11.0"></a>
## [v1.11.0] - 2018-02-09

- Enable db_subnet_group_name variable ([#38](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/38))


<a name="v1.10.0"></a>
## [v1.10.0] - 2018-01-31

- Support conditional creation for the database too. ([#36](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/36))


<a name="v1.9.0"></a>
## [v1.9.0] - 2018-01-30

- Make name optional (fixes [#37](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/37))


<a name="v1.8.0"></a>
## [v1.8.0] - 2018-01-23

- Add availability zone to instance resource module ([#35](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/35))


<a name="v1.7.0"></a>
## [v1.7.0] - 2018-01-15

- Fix enhanced monitoring policy attachment ([#34](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/34))


<a name="v1.6.0"></a>
## [v1.6.0] - 2017-12-08

- Add create_before_destroy to parameter group ([#30](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/30))


<a name="v1.5.0"></a>
## [v1.5.0] - 2017-12-08

- Fixed warning in output (fixes [#32](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/32) and [#31](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/31))


<a name="v1.4.0"></a>
## [v1.4.0] - 2017-11-16

- db_subnet_group: fix failing output expressions ([#22](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/22))


<a name="v1.3.0"></a>
## [v1.3.0] - 2017-11-13

- Automatically create enhanced monitoring role ([#21](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/21))


<a name="v1.2.0"></a>
## [v1.2.0] - 2017-10-22

- Adds support for snapshot_identifier ([#18](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/18))


<a name="v1.1.1"></a>
## [v1.1.1] - 2017-10-18

- Added variable "source_db" for RDS replica option ([#13](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/13))


<a name="v1.1.0"></a>
## [v1.1.0] - 2017-10-18

- Added iam_database_authentication_enabled and license_model model (fixed [#15](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/15) and [#14](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/14))


<a name="v1.0.8"></a>
## [v1.0.8] - 2017-10-12

- Fixed [#12](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/12), final_snapshot_identifier default can't be empty actually


<a name="v1.0.7"></a>
## [v1.0.7] - 2017-10-12

- Added skip_final_snapshot=true in module also (remaining from [#3](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/3))


<a name="v1.0.6"></a>
## [v1.0.6] - 2017-10-12

- Set final_snapshot_identifier in Postgres RDS example
- Merge branch 'master' of https://github.com/terraform-aws-modules/terraform-aws-rds
- Updated README.md for MySQL RDS example
- Updated README.md for Postgres RDS example
- final-snapshot_identifier should default to nothing
- Add enhanced monitoring example to README, and add current contributors link
- Merge branch 'master' into final_snapshot_identifier
- Updated links using upstream path
- Update README.md
- Added comments for default DB username value
- Added complete example for Postgres RDS
- support final_snapshot_identifier


<a name="v1.0.4"></a>
## [v1.0.4] - 2017-10-11



<a name="v1.0.5"></a>
## [v1.0.5] - 2017-10-11

- Tweak README.md examples
- Add complete enhanced monitoring example
- Add enhanced monitoring


<a name="v1.0.3"></a>
## [v1.0.3] - 2017-09-28

- Set example storage_encrypted value to false
- Removed unused variable
- Improved kms_key_id description
- Cleaned duplicated attributes & variables
- Merge branch 'encryption' of github.com:formatting/terraform-aws-rds into encryption
- Added parameters to example
- Added kms_key_id parameter
- Using `encrypted` to set the db_instance.storage_encrypted
- Using `encrypted` to set the db_instance.storage_encrypted


<a name="v1.0.2"></a>
## [v1.0.2] - 2017-09-21

- db parameters can now be passed db_parameter_group mode


<a name="v1.0.1"></a>
## [v1.0.1] - 2017-09-14

- Added monitoring_interval parameter


<a name="v1.0.0"></a>
## v1.0.0 - 2017-09-13

- Updated comment
- Added code for RDS modules
- Initial commit


[Unreleased]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v3.4.0...HEAD
[v3.4.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v3.3.0...v3.4.0
[v3.3.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v3.2.0...v3.3.0
[v3.2.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v3.1.0...v3.2.0
[v3.1.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v3.0.0...v3.1.0
[v3.0.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.35.0...v3.0.0
[v2.35.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.34.0...v2.35.0
[v2.34.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.33.0...v2.34.0
[v2.33.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.32.0...v2.33.0
[v2.32.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.31.0...v2.32.0
[v2.31.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.30.0...v2.31.0
[v2.30.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.29.0...v2.30.0
[v2.29.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.28.0...v2.29.0
[v2.28.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.27.0...v2.28.0
[v2.27.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.26.0...v2.27.0
[v2.26.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.25.0...v2.26.0
[v2.25.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.24.0...v2.25.0
[v2.24.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.23.0...v2.24.0
[v2.23.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.22.0...v2.23.0
[v2.22.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.21.0...v2.22.0
[v2.21.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.20.0...v2.21.0
[v2.20.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.19.0...v2.20.0
[v2.19.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.18.0...v2.19.0
[v2.18.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.17.0...v2.18.0
[v2.17.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.16.0...v2.17.0
[v2.16.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.15.0...v2.16.0
[v2.15.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.37.0...v2.15.0
[v1.37.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.14.0...v1.37.0
[v2.14.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.36.0...v2.14.0
[v1.36.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.13.0...v1.36.0
[v2.13.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.35.0...v2.13.0
[v1.35.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.12.0...v1.35.0
[v2.12.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.34.0...v2.12.0
[v1.34.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.11.0...v1.34.0
[v2.11.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.10.0...v2.11.0
[v2.10.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.9.0...v2.10.0
[v2.9.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.8.0...v2.9.0
[v2.8.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.7.0...v2.8.0
[v2.7.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.6.0...v2.7.0
[v2.6.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.33.0...v2.6.0
[v1.33.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.32.0...v1.33.0
[v1.32.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.31.0...v1.32.0
[v1.31.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.5.0...v1.31.0
[v2.5.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.4.0...v2.5.0
[v2.4.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.30.0...v2.4.0
[v1.30.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.3.0...v1.30.0
[v2.3.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.2.0...v2.3.0
[v2.2.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.29.0...v2.2.0
[v1.29.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.1.0...v1.29.0
[v2.1.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.0.0...v2.1.0
[v2.0.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.28.0...v2.0.0
[v1.28.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.27.0...v1.28.0
[v1.27.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.26.0...v1.27.0
[v1.26.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.25.0...v1.26.0
[v1.25.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.24.0...v1.25.0
[v1.24.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.23.0...v1.24.0
[v1.23.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.22.0...v1.23.0
[v1.22.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.21.0...v1.22.0
[v1.21.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.20.0...v1.21.0
[v1.20.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.19.0...v1.20.0
[v1.19.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.18.0...v1.19.0
[v1.18.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.17.0...v1.18.0
[v1.17.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.16.0...v1.17.0
[v1.16.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.15.0...v1.16.0
[v1.15.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.14.0...v1.15.0
[v1.14.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.13.0...v1.14.0
[v1.13.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.12.0...v1.13.0
[v1.12.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.11.0...v1.12.0
[v1.11.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.10.0...v1.11.0
[v1.10.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.9.0...v1.10.0
[v1.9.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.8.0...v1.9.0
[v1.8.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.7.0...v1.8.0
[v1.7.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.6.0...v1.7.0
[v1.6.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.5.0...v1.6.0
[v1.5.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.4.0...v1.5.0
[v1.4.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.3.0...v1.4.0
[v1.3.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.2.0...v1.3.0
[v1.2.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.1.1...v1.2.0
[v1.1.1]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.1.0...v1.1.1
[v1.1.0]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.0.8...v1.1.0
[v1.0.8]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.0.7...v1.0.8
[v1.0.7]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.0.6...v1.0.7
[v1.0.6]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.0.4...v1.0.6
[v1.0.4]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.0.5...v1.0.4
[v1.0.5]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.0.3...v1.0.5
[v1.0.3]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.0.2...v1.0.3
[v1.0.2]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.0.1...v1.0.2
[v1.0.1]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v1.0.0...v1.0.1
