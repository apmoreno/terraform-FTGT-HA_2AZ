resource "aws_subnet" "VM_Subnet1" {
    vpc_id                  = aws_vpc.Main_VPC.id
    cidr_block              = "172.16.0.0/24"
    availability_zone       = var.avail-zone-c[var.region]
    map_public_ip_on_launch = false

    tags = {
        "Name" : "PublicSubnet"
    }
}

resource "aws_subnet" "VM_Subnet2" {
    vpc_id                  = aws_vpc.Main_VPC.id
    cidr_block              = "172.16.1.0/24"
    availability_zone           = var.avail-zone-c[var.region]
    map_public_ip_on_launch = false

    tags = {
        "Name" : "PrivateSubnet"
    }
}

