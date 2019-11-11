resource "aws_subnet" "ProtectedSubnet1" {
    vpc_id                  = "${var.tf_existing_VPC_id}"
    cidr_block              = "${var.tf_ProtectedSubnet1}"
    availability_zone       = "${var.tf_AZForSubnetVM1}"
    map_public_ip_on_launch = false

    tags = {
        "Name" : "ProtectedSubnet1"
    }
}

resource "aws_subnet" "ProtectedSubnet2" {
    vpc_id                  = "${var.tf_existing_VPC_id}"
    cidr_block              = "${var.tf_ProtectedSubnet2}"
    availability_zone       = "${var.tf_AZForSubnetVM2}"
    map_public_ip_on_launch = false

    tags = {
        "Name" : "ProtectedSubnet2"
    
}

