#Need to have copied CloudFormation templates etc into S3 bucket in AWS, which should be made public
#Need to have an ongoing subscription to FortiGate on-demand (PAYG) in AWS Marketplace
#Need to have deployed VPC, with 4 Subnets using module "Deploy_VPC"

#Retrieve existing VPC id
data "aws_vpc" "existing_VPC" {
  cidr_block = "${var.vpc_cidr}"
}

resource "aws_cloudformation_stack" "FTGT-HA2AZ_PAYG" {
  name = "VPC-FTGT-HA-2-AZs_PAYG"

  parameters = {
    "VPCID" = "${data.aws_vpc.existing_VPC.id}"
    "VPCCIDR" = "${var.tf_VPCCIDR}"
    "AZForSubnet1" = "${var.tf_AZForSubnet1}"
    "AZForSubnet2" = "${var.tf_AZForSubnet2}"
    "PublicSubnet1" = "${var.tf_PublicSubnet1}"
    "PrivateSubnet1"= "${var.tf_PrivateSubnet1}"
    "HASyncSubnet1" = "${var.tf_HASyncSubnet1}"
    "HAMgmtSubnet1" = "${var.tf_HAMgmtSubnet1}"
    "PublicSubnet2" = "${var.tf_PublicSubnet2}"
    "PrivateSubnet2" = "${var.tf_PrivateSubnet2}"
    "HASyncSubnet2" = "${var.tf_HASyncSubnet2}"
    "HAMgmtSubnet2" = "${var.tf_HAMgmtSubnet2}"
  
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

