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

