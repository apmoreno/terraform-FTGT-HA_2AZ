resource "aws_instance" "Windows_VM_1" {
    ami                         = "${var.test_amis[var.region]}
    availability_zone           = "${var.tf_AZForSubnetVM1}"
    ebs_optimized               = false
    instance_type               = "t2.micro"
    monitoring                  = false
    key_name                    = "${var.tf_ec2_key_name}
    subnet_id                   = "${aws_subnet.ProtectedSubnet1.id}"
   # vpc_security_group_ids      = [aws_security_group.SG_Public.id]
    associate_public_ip_address = true
    private_ip                  = "${var.tf_Windows_VM_1_ip}"
    source_dest_check           = true
    
    root_block_device {
        volume_type           = "gp2"
        volume_size           = 8
        delete_on_termination = true
    }

    tags = {
        "Name" = "Win_Protected_VM1"
    }
}


resource "aws_instance" "Windows_VM_2" {
    ami                         = "${var.test_amis[var.region]}
    availability_zone           = "${var.tf_AZForSubnetVM2}"
    ebs_optimized               = false
    instance_type               = "t2.micro"
    monitoring                  = false
    key_name                    = "${var.tf_ec2_key_name}
    subnet_id                   = "${aws_subnet.ProtectedSubnet2.id}"
   # vpc_security_group_ids      = [aws_security_group.SG_Public.id]
    associate_public_ip_address = true
    private_ip                  = "${var.tf_Windows_VM_2_ip}"
    source_dest_check           = true
    
    root_block_device {
        volume_type           = "gp2"
        volume_size           = 8
        delete_on_termination = true
    }

    tags = {
        "Name" = "Win_Protected_VM2"
    }
}
