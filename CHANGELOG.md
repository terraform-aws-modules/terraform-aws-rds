# Change Log

All notable changes to this project will be documented in this file.

<a name="unreleased"></a>
## [Unreleased]



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

- Updated readme with conditional creatino section
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

- Add availability zone to instance ressource module ([#35](https://github.com/terraform-aws-modules/terraform-aws-rds/issues/35))


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
- fianl-snapshot_identifier should default to nothing
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
- Merge branch 'encryption' of github.com:fmartingr/terraform-aws-rds into encryption
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


[Unreleased]: https://github.com/terraform-aws-modules/terraform-aws-rds/compare/v2.18.0...HEAD
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
