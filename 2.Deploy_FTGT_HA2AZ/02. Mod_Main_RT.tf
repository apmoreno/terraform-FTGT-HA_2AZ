output "debug1" {
    value = "${var.tf_FortiGate1PrivateIP}"
}

output "debug2"{
    value = "${substr(var.tf_FortiGate1PrivateIP,0,9)}"
}

data "aws_network_interface" "eni1Port2Ftgt1" {
  depends_on = [aws_cloudformation_stack.DEPLOY_FTGT-HA2AZ]
  filter {
        name = "private-ip-address"
#        name = "addresses.private-ip-address"
        values = ["${substr(var.tf_FortiGate1PrivateIP,0,9)}"]
}
}

resource "aws_default_route_table" "Main_VPC_RT" {
  default_route_table_id = "${data.aws_vpc.Existing_VPC.main_route_table_id}"
  depends_on = [aws_cloudformation_stack.DEPLOY_FTGT-HA2AZ]
  
    route {
        cidr_block = "0.0.0.0/0"
        network_interface_id = "${data.aws_network_interface.eni1Port2Ftgt1.id}"
    }

    tags = {
        "Name" : "Main_VPC_RT"
    }
}

output "debug3" {
    value = "${var.tf_InitS3Bucket}"
}
output "debug4" {
    value = "${var.tf_InitS3BucketRegion}"
}
output "debug5" {
    value = "${var.tf_LicenseType}"
}
output "debug6" {
    value = "${var.tf_FortiGate1LicenseFile}"
}
output "debug7" {
    value = "${var.tf_FortiGate2LicenseFile}"
}