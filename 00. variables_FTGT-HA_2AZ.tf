# Variables for "01. terraform-FTGT-HA2AZ.tf"

terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = "us-east-1"
  version = "~> 2.33"
}

variable "region" {
  type        = string
  default     = "us-east-1"
}

variable "availability-zones" {
  type = list(string)
  default = [
     "us-east-1a",
    "us-east-1b"
  ]
}

variable "tf_VPCCIDR" {
			default = "10.0.0.0/16"
			description = "Provide a network CIDR for the VPC"
		}

variable "tf_AZForSubnet1" {
            default = "us-east-1a"
			description = "Select an Availability Zone for the first set of subnets"
		}

variable "tf_AZForSubnet2" {
            default = "us-east-1b"
            description = "Select an Availability Zone for the second set of subnets"
		}

variable "tf_PublicSubnet1" {
            default = "10.0.1.0/24"
			description = "Provide a network CIDR for PublicSubnet1"
		}

variable "tf_PrivateSubnet1" {
			default = "10.0.2.0/24"
			description = "Provide a network CIDR for PrivateSubnet1"
		}

variable "tf_HASyncSubnet1" {
			default = "10.0.3.0/24"
			description = "Provide a network CIDR for HASyncSubnet1"
		}

variable "tf_HAMgmtSubnet1" {
			default = "10.0.4.0/24"
			description = "Provide a network CIDR for HAMgmtSubnet1"
		}

variable "tf_PublicSubnet2" {
			default = "10.0.10.0/24"
			description = "Provide a network CIDR for PublicSubnet2"
		}

variable "tf_PrivateSubnet2" {
			default = "10.0.20.0/24"
			description = "Provide a network CIDR for PrivateSubnet2"
		}

variable "tf_HASyncSubnet2" {
            default = "10.0.30.0/24"
			description = "Provide a network CIDR for HASyncSubnet2"
		}

variable "tf_HAMgmtSubnet2" {
			default = "10.0.40.0/24"
			description = "Provide a network CIDR for HAMgmtSubnet2"
        }