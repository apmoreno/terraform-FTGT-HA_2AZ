#Need to have copied CloudFormation templates etc into S3 bucket in AWS, which should be made public
#Need to have an ongoing subscription to FortiGate on-demand (PAYG) in AWS Marketplace

resource "aws_cloudformation_stack" "VPC_for_FTGT-HA2AZ" {
  name = "VPC-FTGT-HA-2-AZs"

  parameters = {
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
        "Name" : "VPC_FTGT-HA2AZ"
    }
  
  template_url="https://apollinaire-ftgt-ha-2az-template.s3.amazonaws.com/BaseVPC_FGCP_DualAZ.template.json"
} 

