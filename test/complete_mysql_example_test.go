package test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformAwsCompleteMysql(t *testing.T) {
	t.Parallel()

	expectedName := fmt.Sprintf("terratest-aws-rds-mysql-example-%s", strings.ToLower(random.UniqueId()))
	expectedPort := int64(3306)
	expectedDatabaseName := "terratest"
	username := "demouser"
	password := "demouserpassword"
	awsRegion := "eu-west-1"
	enginename := "mysql"
	majorengineversion := "5.7"
	engineversion := "5.7.21"
	publiclyaccessible := "true"
	examplesPath := "../examples/complete-mysql"

	terraformOptions := createTerratestOptions(t, expectedName, expectedPort, expectedDatabaseName, username,
		password, awsRegion, enginename, majorengineversion, engineversion, publiclyaccessible, examplesPath)

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	dbInstanceID := terraform.Output(t, terraformOptions, "this_db_instance_id")
	address := terraform.Output(t, terraformOptions, "this_db_instance_address")
	port := aws.GetPortOfRdsInstance(t, dbInstanceID, awsRegion)
	schemaExistsInRdsInstance := aws.GetWhetherSchemaExistsInRdsMySqlInstance(t, address, port, username, password, expectedDatabaseName)
	characterSetServer := aws.GetParameterValueForParameterOfRdsInstance(t, "character_set_server", dbInstanceID, awsRegion)
	characterSetClientValue := aws.GetParameterValueForParameterOfRdsInstance(t, "character_set_client", dbInstanceID, awsRegion)
	mariadbAuditPluginServerAuditEventsOptionValue := aws.GetOptionSettingForOfRdsInstance(t, "MARIADB_AUDIT_PLUGIN", "SERVER_AUDIT_EVENTS", dbInstanceID, awsRegion)
	mariadbAuditPluginServerAuditFileOptionValue := aws.GetOptionSettingForOfRdsInstance(t, "MARIADB_AUDIT_PLUGIN", "SERVER_AUDIT_FILE_ROTATIONS", dbInstanceID, awsRegion)

	assert.NotNil(t, address)
	assert.Equal(t, expectedPort, port)
	assert.True(t, schemaExistsInRdsInstance)
	assert.Equal(t, "utf8", characterSetClientValue)
	assert.Equal(t, "utf8", characterSetServer)
	assert.Equal(t, "CONNECT", mariadbAuditPluginServerAuditEventsOptionValue)
	assert.Equal(t, "37", mariadbAuditPluginServerAuditFileOptionValue)
}
