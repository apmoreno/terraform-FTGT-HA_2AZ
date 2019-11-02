# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.12 syntax, which means it is no longer compatible with any versions below 0.12.
# ----------------------------------------------------------------------------------------------------------------------
terraform {
  required_version = ">= 0.12"
}

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AWS environment - one VPCs with two public and two private subnet each in the  same AZ. See Fortinet GitHub for details:
# https://github.com/fortinet/aws-cloudformation-templates/tree/master/HA/6.2/DualAZ
# ---------------------------------------------------------------------------------------------------------------------

module "Deploy_VPC" {
    
  source = "./1.Deploy_VPC"
  
  region = "${var.region}"
  tf_StackLabel = "${var.tf_StackLabel}"
  tf_VPCCIDR = "${var.tf_VPCCIDR}"
  tf_AZForSubnet1 = "${var.tf_AZForSubnet1}"
  tf_AZForSubnet2 = "${var.tf_AZForSubnet2}"
  tf_PublicSubnet1 = "${var.tf_PublicSubnet1}"
  tf_PrivateSubnet1 = "${var.tf_PrivateSubnet1}"
  tf_HASyncSubnet1 = "${var.tf_HASyncSubnet1}"
  tf_HAMgmtSubnet1 = "${var.tf_HAMgmtSubnet1}"
  tf_PublicSubnet2 = "${var.tf_PublicSubnet2}"
  tf_PrivateSubnet2 = "${var.tf_PrivateSubnet2}"
  tf_HASyncSubnet2 = "${var.tf_HASyncSubnet2}"
  tf_HAMgmtSubnet2 = "${var.tf_HAMgmtSubnet2}"
 
}

module "Deploy_FTGT_HA2AZ_PAYG" {
    
    source = "./2.Deploy_FTGT_HA2AZ_PAYG"
    region = "${var.region}"
    tf_existing_VPC_id = "${module.Deploy_VPC.existing_VPC_id}"   
    tf_VPCCIDR = "${var.tf_VPCCIDR}"
    tf_PublicSubnet1 = "${var.tf_PublicSubnet1}"
    tf_PrivateSubnet1= "${var.tf_PrivateSubnet1}"
    tf_HASyncSubnet1 = "${var.tf_HASyncSubnet1}"
    tf_HAMgmtSubnet1 = "${var.tf_HAMgmtSubnet1}"
    tf_PublicSubnet2 = "${var.tf_PublicSubnet2}"
    tf_PrivateSubnet2 = "${var.tf_PrivateSubnet2}"
    tf_HASyncSubnet2 = "${var.tf_HASyncSubnet2}"
    tf_HAMgmtSubnet2 = "${var.tf_HAMgmtSubnet2}"
    tf_InstanceType = "${var.tf_InstanceType}"
	tf_CIDRForInstanceAccess = "${var.tf_CIDRForInstanceAccess}"
    tf_AZForSubnet1 = "${var.tf_AZForSubnet1}"
    tf_AZForSubnet2 = "${var.tf_AZForSubnet2}"
    tf_KeyPair = "${var.tf_KeyPair}"
	tf_S3EndpointDeployment = "${var.tf_S3EndpointDeployment}"
    tf_PublicSubnet2RouteTableID = "${module.Deploy_VPC.tf_PublicSubnet2RouteTableID}"
	tf_InitS3Bucket = "${var.tf_InitS3Bucket}"
	tf_InitS3BucketRegion = "${var.region}"
	tf_LicenseType = "${var.tf_LicenseType}"
	tf_FortiGate1LicenseFile = "${var.tf_FortiGate1LicenseFile}"
	tf_FortiGate2LicenseFile = "${var.tf_FortiGate2LicenseFile}"
	tf_PublicSubnet1RouterIP = "${var.tf_PublicSubnet1RouterIP}"
	tf_PrivateSubnet1RouterIP = "${var.tf_PrivateSubnet1RouterIP}"
	tf_HAMgmtSubnet1RouterIP = "${var.tf_HAMgmtSubnet1RouterIP}"
	tf_PublicSubnet2RouterIP = "${var.tf_PublicSubnet2RouterIP}"
	tf_PrivateSubnet2RouterIP = "${var.tf_PrivateSubnet2RouterIP}"
	tf_HAMgmtSubnet2RouterIP = "${var.tf_HAMgmtSubnet2RouterIP}"
    tf_FortiGate1PublicIP = "${var.tf_FortiGate1PublicIP}"
	tf_FortiGate1PrivateIP = "${var.tf_FortiGate1PrivateIP}"
	tf_FortiGate1HAsyncIP = "${var.tf_FortiGate1HAsyncIP}"
	tf_FortiGate1HAmgmtIP = "${var.tf_FortiGate1HAmgmtIP}"
    tf_FortiGate2PublicIP = "${var.tf_FortiGate2PublicIP}"
	tf_FortiGate2PrivateIP = "${var.tf_FortiGate2PrivateIP}"
	tf_FortiGate2HAsyncIP = "${var.tf_FortiGate2HAsyncIP}"
	tf_FortiGate2HAmgmtIP = "${var.tf_FortiGate2HAmgmtIP}"
    }