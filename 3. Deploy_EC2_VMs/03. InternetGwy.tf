resource "aws_internet_gateway" "Main_IGW" {
    vpc_id = aws_vpc.Main_VPC.id

    tags = {
        "Name" = "Main_IGW"
    }
}

