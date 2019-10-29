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

#Now retrieve the Routing Table id for Public Subnet 2 (default name is "FTGT-HA-2AZs-PublicSubnet2") 
# This is a parameter used in the CloudFormation stack.
#1. Retrieve existing VPC id, 2.retrieve id of all subnet  PublicSubnet2, 3.retrieve the id of the route table for this subnet.

data "aws_vpc" "tf_existing_VPC" {
  cidr_block = "${var.tf_VPCCIDR}"
  depends_on = [aws_cloudformation_stack.VPC_for_FTGT-HA2AZ]

  #cidr_block = "10.0.0.0/16"
}


data "aws_subnet_ids" "find_PublicSubnet2" {
    vpc_id = "${data.aws_vpc.tf_existing_VPC.id}"
  tags = {
 #   Name = "FTGT-HA-2AZs-PublicSubnet2"
    Name ="${var.tf_StackLabel}-PublicSubnet2"
}
}

data "aws_route_table" "find_PublicSubnet2RouteTableID" {
    subnet_id = "${sort(data.aws_subnet_ids.find_PublicSubnet2.ids)[0]}"
}

#Export the id of Public Subnet 2 and the associated Route Table ID
output "tf_PublicSubnet2RouteTableID" {
    value = "${data.aws_route_table.find_PublicSubnet2RouteTableID.route_table_id}"
}

output "tf_PublicSubnet2ID" {
    value = "${sort(data.aws_subnet_ids.find_PublicSubnet2.ids) [0]}"

}


################################################
### Next lines no longer needed - used to debug
#output "existing_VPC_id" {
#  value = "${data.aws_vpc.tf_existing_VPC.id}"
#}
#output "debug_Sub2name" {
#value ="${var.tf_StackLabel}-PublicSubnet2"

#}
#output "tf_PublicSubnet2ID" {
#  value = "${data.aws_subnet_ids.tf_PublicSubnet2}"
#}



#resource "aws_vpc" "Main_VPC" {
#    cidr_block           = "10.1.0.0/16"
#    enable_dns_hostnames = true
#    enable_dns_support   = true
#    instance_tenancy     = "default"
#
#    tags = {
#        "Name" : "Other_VPC"
#    }
#}


#data "aws_vpc" "foo" {
#depends_on = [aws_vpc.Main_VPC]
#cidr_block           = "10.1.0.0/16"
#  #tags = {
# #   service = "production"
# # }
#}

##output "foo" {
#  value = "${data.aws_vpc.foo.id}"
#}


#output "debug_PublicSubnet2RouteTableID" {
#    value = "${aws_vpc.Main_VPC.main_route_table_id}"
#}