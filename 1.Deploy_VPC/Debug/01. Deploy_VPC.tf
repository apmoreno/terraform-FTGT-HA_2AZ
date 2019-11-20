#Need to have copied CloudFormation templates etc into S3 bucket in AWS, which should be made public
#Need to have an ongoing subscription to FortiGate on-demand (PAYG) or BYOL in AWS Marketplace
# For BYOL, need to have licence files installed in S3 bucket


resource "aws_cloudformation_stack" "VPC_for_FTGT-HA2AZ" {
   name = "${var.nameTag}"

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

#Now retrieve several parameters that will be needed in "01. main_FTGT_HA2AZ_PAYG.tf": 
# - the id of the VPC created
# - the Routing Table id for Public Subnet 2 
# the id for each of the 8 subnets created 

# Routing Table id for Public Subnet 2:
#1. Retrieve existing VPC id, 2.retrieve id of all subnet  PublicSubnet2, 3.retrieve the id of the route table for this subnet.

data "aws_vpc" "loc_existing_VPC" {
  cidr_block = "${var.tf_VPCCIDR}"
  depends_on = [aws_cloudformation_stack.VPC_for_FTGT-HA2AZ]
}

data "aws_subnet_ids" "find_PublicSubnet2" {
    vpc_id = "${data.aws_vpc.loc_existing_VPC.id}"
  tags = {
 #   Name = "FTGT-HA-2AZs-PublicSubnet2"
    Name ="${var.nameTag}-PublicSubnet2"
        }
}

data "aws_route_table" "find_PublicSubnet2RouteTableID" {
    subnet_id = "${sort(data.aws_subnet_ids.find_PublicSubnet2.ids)[0]}"
}
output "existing_VPC_id" {
  value = "${data.aws_vpc.loc_existing_VPC.id}"
}

# Need to open the default Security Group to accept all inbound traffic, from all sources
data "aws_security_group" "selected" {
  name = ""
  depends_on = [aws_cloudformation_stack.VPC_for_FTGT-HA2AZ]
}

resource "aws_security_group_rule" "allow_all" {
  type            = "ingress"
  from_port       = 0
  to_port         = 65535
  protocol        = "all"
# Opening to 0.0.0.0/0 can lead to security vulnerabilities.
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${data.aws_security_group.selected.id}"
}

#Export the id of Public Subnet 2 and the associated Route Table ID
output "tf_PublicSubnet2RouteTableID" {
    value = "${data.aws_route_table.find_PublicSubnet2RouteTableID.route_table_id}"
}

output "nameTag_VPC"{
    value = "${lookup(data.aws_vpc.loc_existing_VPC.tags, "Name","")}"
}

output "tf_PublicSubnet2ID" {
    value = "${sort(data.aws_subnet_ids.find_PublicSubnet2.ids) [0]}"

}
output "debug_Sub2name" {
    value ="${var.nameTag}-PublicSubnet2"
}


data "aws_subnet" "sub_PublicSubnet1" {
  depends_on = [aws_cloudformation_stack.VPC_for_FTGT-HA2AZ]
  cidr_block = "${var.tf_PublicSubnet1}"
} 
output "mod_PublicSubnet1_id"{
    value = "${data.aws_subnet.sub_PublicSubnet1.id}"
}

data "aws_subnet" "sub_PrivateSubnet1" {
  depends_on = [aws_cloudformation_stack.VPC_for_FTGT-HA2AZ]
  cidr_block = "${var.tf_PrivateSubnet1}"
}
output "mod_PrivateSubnet1_id"{
    value = "${data.aws_subnet.sub_PrivateSubnet1.id}"
}

data "aws_subnet" "sub_HASyncSubnet1" {
  depends_on = [aws_cloudformation_stack.VPC_for_FTGT-HA2AZ]
  cidr_block = "${var.tf_HASyncSubnet1}"
} 
output "mod_HASyncSubnet1_id"{
    value = "${data.aws_subnet.sub_HASyncSubnet1.id}"
}

data "aws_subnet" "sub_HAMgmtSubnet1" {
  depends_on = [aws_cloudformation_stack.VPC_for_FTGT-HA2AZ]
  cidr_block = "${var.tf_HAMgmtSubnet1}"
} 
output "mod_HAMgmtSubnet1_id"{
    value = "${data.aws_subnet.sub_HAMgmtSubnet1.id}"
}

data "aws_subnet" "sub_PublicSubnet2" {
  depends_on = [aws_cloudformation_stack.VPC_for_FTGT-HA2AZ]
  cidr_block = "${var.tf_PublicSubnet2}"
} 
output "mod_PublicSubnet2_id"{
    value = "${data.aws_subnet.sub_PublicSubnet2.id}"
}

data "aws_subnet" "sub_PrivateSubnet2" {
  depends_on = [aws_cloudformation_stack.VPC_for_FTGT-HA2AZ]
  cidr_block = "${var.tf_PrivateSubnet2}"
}
output "mod_PrivateSubnet2_id"{
    value = "${data.aws_subnet.sub_PrivateSubnet2.id}"
}

data "aws_subnet" "sub_HASyncSubnet2" {
  depends_on = [aws_cloudformation_stack.VPC_for_FTGT-HA2AZ]
  cidr_block = "${var.tf_HASyncSubnet2}"
} 
output "mod_HASyncSubnet2_id"{
    value = "${data.aws_subnet.sub_HASyncSubnet2.id}"
}

data "aws_subnet" "sub_HAMgmtSubnet2" {
  depends_on = [aws_cloudformation_stack.VPC_for_FTGT-HA2AZ]
  cidr_block = "${var.tf_HAMgmtSubnet2}"
} 
output "mod_HAMgmtSubnet2_id"{
    value = "${data.aws_subnet.sub_HAMgmtSubnet2.id}"
}
################################################
### Next lines no longer needed - used to debug

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
#    instance_tenancy     = "default"###
#
#    tags = {
#        "Name" : "Other_VPC"
#    }
#}

#data "aws_vpc" "foo" {
#depends_on = [aws_vpc.Main_VPC]
#cidr_block           = "10.1.0.0/16"
  #tags = {
 #   service = "production"
 # }
#}


#data "aws_vpc" "foo" {
#depends_on = [aws_vpc.Main_VPC]
#cidr_block           = "10.1.0.0/16"
#  tags = {
#    service = "production"
#  }
#}

##output "foo" {
#  value = "${data.aws_vpc.foo.id}"
#}


#output "debug_PublicSubnet2RouteTableID" {
#    value = "${aws_vpc.Main_VPC.main_route_table_id}"
#}