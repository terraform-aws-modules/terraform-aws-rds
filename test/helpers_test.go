package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func createTerratestOptions(t *testing.T,
	expectedName string,
	expectedPort int64,
	expectedDatabaseName string,
	username string,
	password string,
	awsRegion string,
	enginename string,
	majorengineversion string,
	engineversion string,
	publiclyaccessible string,
	examplesPath string,

) *terraform.Options {

	terraformVars := map[string]interface{}{
		"name":                 expectedName,
		"port":                 expectedPort,
		"database_name":        expectedDatabaseName,
		"username":             username,
		"password":             password,
		"aws_region":           awsRegion,
		"engine_name":          enginename,
		"major_engine_version": majorengineversion,
		"engine_version":       engineversion,
		"publicly_accessible":  publiclyaccessible,
	}

	terratestOptions := &terraform.Options{
		TerraformDir: examplesPath,
		Vars:         terraformVars,
	}
	return terratestOptions
}
