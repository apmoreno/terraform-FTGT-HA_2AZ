variable "region" {
  type        = string
  default     = ""
}

variable "tf_existing_VPC_id" {
  type = "string"
}

variable "test_amis" {
  type = "map"
}

variable "tf_existing_VPC_id" {
  type = "string"
}

variable "tf_VPCCIDR" {
  type = "string"
}

variable "tf_AZForSubnet1" {
  type = "string"
}

variable "tf_AZForSubnet2" {
  type = "string"
}

variable "ec2_key_name" {
type        = string
  default   = ""
}
variable "tf_AZForSubnetVM1" {
            default = ""
		}

variable "tf_AZForSubnetVM2" {
            type = "string"
            default = ""
		}

variable "tf_ProtectedSubnet1" {
            type = "string"
            default = ""
		}

variable "tf_ProtectedSubnet2" {
            type = "string"
			default = ""
            }