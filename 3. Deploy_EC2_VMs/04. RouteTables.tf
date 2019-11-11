Not sure I need this.
If the default route table alreadys ends out-ot-subnet data to port 2 of the FTGT, then no need .

resource "aws_default_route_table" "ProtectedSubnet1" {
  default_route_table_id = "${aws_vpc.Main_VPC.default_route_table_id}"
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.Main_IGW.id
    }

    tags = {
        "Name" : "Main_VPC_RT"
    }
}


#resource "aws_default_route_table" "VPC1_Production" {
#  default_route_table_id = "${aws_vpc.Main_VPC.default_route_table_id}"
#
#  route {
#        cidr_block = "0.0.0.0/0"
#	    transit_gateway_id = "${aws_ec2_transit_gateway.SecTransitGateway.id}"
# }
#  
#    tags = {
#        "Name" : "VPC1_Production"
#    }
#}
