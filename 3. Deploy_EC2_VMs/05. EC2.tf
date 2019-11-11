resource "aws_instance" "Windows_VM_1" {
    ami                         = var.test_amis[var.region]
    availability_zone           = "${var.tf_AZForSubnetVM1}"
    ebs_optimized               = false
    instance_type               = "t2.micro"
    monitoring                  = false
    key_name                    = "${var.AWS-FTGT}
    subnet_id                   = aws_subnet.PublicSubnet.id
    vpc_security_group_ids      = [aws_security_group.SG_Public.id]
    associate_public_ip_address = true
    private_ip                  = "172.16.0.50"
    source_dest_check           = true

    root_block_device {
        volume_type           = "gp2"
        volume_size           = 8
        delete_on_termination = true
    }

    tags = {
        "Name" = "Linux_PublicSub"
    }
}


resource "aws_instance" "Windows_VM_2" {
    ami                         = var.test_amis[var.region]
    availability_zone           = var.avail-zone-c[var.region]
    ebs_optimized               = false
    instance_type               = "t2.micro"
    monitoring                  = false
    key_name                    = var.ec2_key_name
    subnet_id                   = aws_subnet.PrivateSubnet.id
    vpc_security_group_ids      = [aws_security_group.SG_Private.id]
    associate_public_ip_address = true
    private_ip                  = "172.16.1.51"
    source_dest_check           = true

    root_block_device {
        volume_type           = "gp2"
        volume_size           = 8
        delete_on_termination = true
    }

    tags = {
        "Name" = "Linux_PrivateSub"
    }
}

