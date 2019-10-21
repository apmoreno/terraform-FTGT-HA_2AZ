#Need to have copied CloudFormation templates etc into S3 bucket in AWS, which should be made public
#Need to have an ongoing subscription to FortiGate on-demand (PAYG) in AWS Marketplace

resource "aws_cloudformation_stack" "VPC_for_FTGT-HA2AZ" {
  name = "${var.tf_StackLabel}"

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

###### 

resource "aws_vpc" "Main_VPC" {
    cidr_block           = "10.1.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support   = true
    instance_tenancy     = "default"

    tags = {
        "Name" : "Other_VPC"
    }
}


data "aws_vpc" "foo" {
  #tags = {
 #   service = "production"
 # }
}

output "foo" {
  value = "${data.aws_vpc.foo.id}"
}


#data "aws_vpc" "tf_existing_VPC" {
  #cidr_block = "${var.tf_VPCCIDR}"
  #cidr_block = "10.0.0.0/16"
##}

#data "aws_subnet_ids" "tf_PublicSubnet2" {
 # vpc_id = "${data.aws_vpc.tf_existing_VPC.id}"
#  tags = {
##    Name = "FTGT-HA-2AZs-PublicSubnet2"
#    Name ="{$var.tf_StackLabel}-PublicSubnet2"
#}
#}

#data "aws_route_table" "tf_PublicSubnet2RouteTableID" {
#  subnet_id = "${element(data.aws_subnet_ids.tf_PublicSubnet2.ids, 1)}"
#}