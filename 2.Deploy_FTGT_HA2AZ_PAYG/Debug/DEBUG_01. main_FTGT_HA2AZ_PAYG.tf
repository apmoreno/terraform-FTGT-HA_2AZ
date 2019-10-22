#Need to have copied CloudFormation templates etc into S3 bucket in AWS which should be made public
#Need to have an ongoing subscription to FortiGate on-demand (PAYG) in AWS Marketplace
#Need to have deployed VPC with 4 Subnets using module "1.Deploy_VPC"

#First step to get the id of the Route Table for PublicSubnet2, this is a parameter used in th CloudFormation stack.
#1. Retrieve existing VPC id, 2.retrieve id of all subnets in the VPC, 3.retrive the id of PublicSubnet2, 4.retrieve the id of the route table for this subnet.

#data "aws_vpcs" "foo" {
  #tags = {
 #   service = "production"
 # }
 #    depends_on = [aws_subnet.PublicSubnet]
#}

#output "foo" {
#  value = "${data.aws_vpcs.foo.ids}"
#}


data "aws_vpc" "tf_existing_VPC" {
  cidr_block = "${var.tf_VPCCIDR}"
 # cidr_block = "10.0.0.0/16"
}

output "VPC id" {
  value = "${aws_vpc.tf_existing_VPC.id}"
}

data "aws_subnet_ids" "tf_PublicSubnet2" {
    vpc_id = "${data.aws_vpc.tf_existing_VPC.id}"
  tags = {
    Name = "FTGT-HA-2AZs-PublicSubnet2"
#    Name ="{$var.tf_StackLabel}-PublicSubnet2"
}
}

output "Subnets" {
  value = "${data.aws_subnet_ids.tf_PublicSubnet2}"
}

#data "aws_route_table" "tf_PublicSubnet2RouteTableID" {
#  subnet_id = "${element(data.aws_subnet_ids.tf_PublicSubnet2.ids, 1)}"
#}



################################
#Debug block:
#output "existing_VPC_CIDR" {
#  value = "${var.tf_VPCCIDR}"
#}

#output "VPC_ID" {
#  value = "${data.aws_vpc.tf_existing_VPC.id}"
#}

#}
#output "filter_name_for_PublicSubnet2" {
#  value = "{$var.tf_StackLabel}-PublicSubnet2"
#}
#output "id_of_PublicSubnet2" {
#  value = "${element(data.aws_subnet_ids.tf_PublicSubnet2.ids, 1)}"
#}
#output "id_of_PublicSubnet2RouteTableID" {
#  value = "${data.aws_route_table.tf_PublicSubnet2RouteTableID}"
#}
########################

 
#use: 
#resource "aws_instance" "app" {
#count         = "3"
#ami           = "${var.ami}"
#instance_type = "t2.micro"
#subnet_id     = "${element(data.aws_subnet_ids.private.ids, count.index)}"
#}

#data "aws_route_table" "selected" {
#  subnet_id = "${var.subnet_id}"
#}

#resource "aws_route" "route" {
#  route_table_id            = "${data.aws_route_table.selected.id}"
#  destination_cidr_block    = "10.0.1.0/22"
#  vpc_peering_connection_id = "pcx-45ff3dc1"
#}

#variable "vpc_id" {}
#
#data "aws_vpc" "selected" {
 # id = "${var.vpc_id}"
#}

#use:
#resource "aws_subnet" "example" {
#  vpc_id            = "${data.aws_vpc.selected.id}"
#  availability_zone = "us-west-2a"
#  cidr_block        = "${cidrsubnet(data.aws_vpc.selected.cidr_block, 4, 1)}"
#}