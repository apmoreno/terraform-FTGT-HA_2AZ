resource "aws_instance" "Windows_VM_1" {
    ami                         = "${var.tf_windows_amis[var.region]}"
    availability_zone           = "${var.tf_AZForSubnetVM1}"
    ebs_optimized               = false
    instance_type               = "t3.micro"
    monitoring                  = false
    key_name                    = "${var.tf_KeyPair}"
    subnet_id                   = "${aws_subnet.loc_ProtectedSubnet1.id}"
#   vpc_security_group_ids      = [aws_security_group.SG_Public.id]
#   associate_public_ip_address = true
    associate_public_ip_address = false
    private_ip                  = "${var.tf_WindowsVM1ip}"
    source_dest_check           = true
    
    root_block_device {
        volume_type           = "gp2"
        volume_size           = 30
        delete_on_termination = true
    }

    tags = {
        "Name" = "Win_Protected_VM1"
    }
}


resource "aws_instance" "Windows_VM_2" {
    ami                         = "${var.tf_windows_amis[var.region]}"
    availability_zone           = "${var.tf_AZForSubnetVM2}"
    ebs_optimized               = false
    instance_type               = "t3.micro"
    monitoring                  = false
    key_name                    = "${var.tf_KeyPair}"
    subnet_id                   = "${aws_subnet.loc_ProtectedSubnet2.id}"
   # vpc_security_group_ids      = [aws_security_group.SG_Public.id]
   associate_public_ip_address = true
#    associate_public_ip_address = false    
    private_ip                  = "${var.tf_WindowsVM2ip}"
    source_dest_check           = true
    
    root_block_device {
        volume_type           = "gp2"
        volume_size           = 30
        delete_on_termination = true
    }

    tags = {
        "Name" = "Win_Protected_VM2"
    }
}

output "SG_ids" {
  value = "${aws_instance.Windows_VM_1.vpc_security_group_ids}"
}
