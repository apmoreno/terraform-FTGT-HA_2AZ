# This module should be run after module "main_Deploy_VPC.tf"
#Need to have deployed VPC with 4 Subnets using module "1.Deploy_VPC"
# Need to have copied CloudFormation templates etc into S3 bucket in AWS which should be made public
#Need to have an ongoing subscription to FortiGate on-demand (PAYG) or BYOL in AWS Marketplace
# For BYOL, need to have licence files installed in S3 bucket


resource "aws_cloudformation_stack" "FTGT-HA2AZ-PAYG" {
  name = "FTGT-HA-2-AZs-PAYG"

  parameters = {
    "VPCID" = "${var.tf_existing_VPC_id}"
    "VPCCIDR" = "${var.tf_VPCCIDR}"
    "PublicSubnet1" = "${var.tf_PublicSubnet1_id}"
    "PrivateSubnet1"= "${var. tf_PrivateSubnet1_id}"
    "HASyncSubnet1" = "${var.tf_HASyncSubnet1_id}"
    "HAMgmtSubnet1" = "${var.tf_HAMgmtSubnet1_id}"
    "PublicSubnet2" = "${var.tf_PublicSubnet2_id}"
    "PrivateSubnet2" = "${var.tf_PrivateSubnet2_id}"
    "HASyncSubnet2" = "${var.tf_HASyncSubnet2_id}"
    "HAMgmtSubnet2" = "${var.tf_HAMgmtSubnet2_id}"
    "InstanceType" = "${var.tf_InstanceType}"
	"CIDRForInstanceAccess" = "${var.tf_CIDRForInstanceAccess}"
    "AZForFGT1" = "${var.tf_AZForSubnet1}"
    "AZForFGT2" = "${var.tf_AZForSubnet2}"
    "KeyPair" = "${var.tf_KeyPair}"
	"S3EndpointDeployment" = "${var.tf_S3EndpointDeployment}"
	"PublicSubnet2RouteTableID" = "${var.tf_PublicSubnet2RouteTableID}"
	"InitS3Bucket" = "${var.tf_InitS3Bucket}"
	"InitS3BucketRegion" = "${var.tf_InitS3BucketRegion}"
	"LicenseType" = "${var.tf_LicenseType}"
	"FortiGate1LicenseFile" = "${var.tf_FortiGate1LicenseFile}"
	"FortiGate2LicenseFile" = "${var.tf_FortiGate2LicenseFile}"
	"PublicSubnet1RouterIP" = "${var.tf_PublicSubnet1RouterIP}"
	"PrivateSubnet1RouterIP" = "${var.tf_PrivateSubnet1RouterIP}"
	"HAMgmtSubnet1RouterIP" = "${var.tf_HAMgmtSubnet1RouterIP}"
	"PublicSubnet2RouterIP" = "${var.tf_PublicSubnet2RouterIP}"
	"PrivateSubnet2RouterIP" = "${var.tf_PrivateSubnet2RouterIP}"
	"HAMgmtSubnet2RouterIP" = "${var.tf_HAMgmtSubnet2RouterIP}"
    "FortiGate1PublicIP" = "${var.tf_FortiGate1PublicIP}"
	"FortiGate1PrivateIP" = "${var.tf_FortiGate1PrivateIP}"
	"FortiGate1HAsyncIP" = "${var.tf_FortiGate1HAsyncIP}"
	"FortiGate1HAmgmtIP" = "${var.tf_FortiGate1HAmgmtIP}"
    "FortiGate2PublicIP" = "${var.tf_FortiGate2PublicIP}"
	"FortiGate2PrivateIP" = "${var.tf_FortiGate2PrivateIP}"
	"FortiGate2HAsyncIP" = "${var.tf_FortiGate2HAsyncIP}"
	"FortiGate2HAmgmtIP" = "${var.tf_FortiGate2HAmgmtIP}"
  }
  
  on_failure = "ROLLBACK"
  
  capabilities = [
  "CAPABILITY_IAM", 
  "CAPABILITY_AUTO_EXPAND"
  ]
  
  tags = {
        "Name" : "FTGT-HA2AZ_PAYG"
    }
  
  template_url="https://apollinaire-ftgt-ha-2az-template.s3.amazonaws.com/FGCP_DualAZ_ExistingVPC.template.json"
} 

