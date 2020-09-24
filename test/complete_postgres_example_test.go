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

func TestTerraformAwsCompletePostgreSQL(t *testing.T) {
	t.Parallel()

	expectedName := fmt.Sprintf("terratest-aws-rds-postgres-example-%s", strings.ToLower(random.UniqueId()))
	expectedPort := int64(5432)
	expectedDatabaseName := "terratest"
	username := "demouser"
	password := "demouserpassword"
	awsRegion := "eu-west-1"
	enginename := "postgres"
	majorengineversion := "9.6"
	engineversion := "9.6.9"
	publiclyaccessible := "true"
	examplesPath := "../examples/complete-postgres"

	terraformOptions := createTerratestOptions(t, expectedName, expectedPort, expectedDatabaseName, username,
		password, awsRegion, enginename, majorengineversion, engineversion, publiclyaccessible, examplesPath)

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	dbInstanceID := terraform.Output(t, terraformOptions, "this_db_instance_id")
	address := terraform.Output(t, terraformOptions, "this_db_instance_address")
	port := aws.GetPortOfRdsInstance(t, dbInstanceID, awsRegion)

	assert.NotNil(t, address)
	assert.Equal(t, expectedPort, port)
}
