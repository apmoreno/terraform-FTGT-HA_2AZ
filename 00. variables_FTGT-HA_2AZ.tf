# Variables for "01. terraform-FTGT-HA2AZ.tf"
# Parameters in this file will determine the AWS region used as well:
# - whether PAYG or BYOL is used-
# - where the BYOL licence files are stored
# - whether a new S3 end pointwill be created (default is YES)
# - the S3 bucket where config files will be created


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

#variable "availability-zones" {
#  type = list(string)
#  default = [
#     "us-east-1a",
#    "us-east-1b"
#  ]
#}

variable "tf_StackLabel" {
			default = "FTGT-HA-2AZs"
			description = "Name of the CloudFormation stack"
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
            type = "string"
            default = "us-east-1b"
            description = "Select an Availability Zone for the second set of subnets"
		}

variable "tf_PublicSubnet1" {
            type = "string"
            default = "10.0.1.0/24"
			description = "Provide a network CIDR for PublicSubnet1"
		}

variable "tf_PrivateSubnet1" {
            type = "string"
			default = "10.0.2.0/24"
			description = "Provide a network CIDR for PrivateSubnet1"
		}

variable "tf_HASyncSubnet1" {
            type = "string"
			default = "10.0.3.0/24"
			description = "Provide a network CIDR for HASyncSubnet1"
		}

variable "tf_HAMgmtSubnet1" {
            type = "string"
			default = "10.0.4.0/24"
			description = "Provide a network CIDR for HAMgmtSubnet1"
		}

variable "tf_PublicSubnet2" {
            type = "string"
			default = "10.0.10.0/24"
			description = "Provide a network CIDR for PublicSubnet2"
		}

variable "tf_PrivateSubnet2" {
            type = "string"
			default = "10.0.20.0/24"
			description = "Provide a network CIDR for PrivateSubnet2"
		}

variable "tf_HASyncSubnet2" {
            type = "string"
            default = "10.0.30.0/24"
			description = "Provide a network CIDR for HASyncSubnet2"
		}

variable "tf_HAMgmtSubnet2" {
            type = "string"
			default = "10.0.40.0/24"
			description = "Provide a network CIDR for HAMgmtSubnet2"
        }
        
variable "tf_InstanceType" {
			default =  "c5.xlarge"
			description = "Select the instance type for the FortiGates"
		}
variable "tf_CIDRForInstanceAccess" {
			type = string
			default = "0.0.0.0/0"
			description = "Provide a network CIDR from which the FortiGate instances will be accessed"
		}
        
#variable "tf_AZForFGT1" {
#			type = string
#            default = ""
#			description =  "Select an Availability Zone for FortiGate1"
#		}
#variable "tf_AZForFGT2" {
#			type = string
#            default = ""
#			description =  "Select an Availability Zone for FortiGate2"
#}

variable "tf_KeyPair" {
            type        = string
            default = "AWS-FTGT"
            }

#######################################################################        
variable "tf_S3EndpointDeployment" {
			type = string
            default = "DeployNew"
			description =  "Select if a new S3 Endpoint should be deployed or not. *** A S3 Endpoint should be used and associated to both PublicSubnets for successful bootstrapping ***"
#			"AllowedValues" 
#				"DeployNew"
#				"UseExisting"
		}
        
variable "tf_PublicSubnet2ID" {
			type = string
            default = ""
			description =  "If a new S3 Endpoint is to be deployed, identify the ID of PublicSubnet2 asa 1st step to get the associated route table ID"
		}

variable "tf_PublicSubnet2RouteTableID" {
			type = string
            default = ""
			description =  "If a new S3 Endpoint is to be deployed provide the route table ID associated to PublicSubnet2"
		}

variable "tf_InitS3Bucket" {
			type = string
            default = "apollinaire-ftgt-bucket"
			description =  "Provide the Init S3 Bucket name where your config files will be created"
		}
        
variable "tf_InitS3BucketRegion" {
			type = string
            default = ""
			description =  "Select the Region where the Init S3 Bucket exists *** the bucket should exist in the same region as this deployment for successful bootstrapping ***"
			
		}
variable "tf_LicenseType" {
			type = string
            default = "PAYG"
			description =  "Select the license type for the FortiGates"
#			"AllowedValues"
#				"PAYG"
#				"BYOL"
		}
        
variable "tf_FortiGate1LicenseFile" {
			type = string
            default =  ""
			description =  "[BYOL Only leave blank for PAYG] Provide the name of the BYOL license file in the Init S3 Bucket for FortiGate1 (ie fgt1.lic or prefix/fgt1.lic)"
		}
variable "tf_FortiGate2LicenseFile" {
			type = string
            default =  ""
			description =  "[BYOL Only leave blank for PAYG] Provide the name of the BYOL license file in the Init S3 Bucket for FortiGate2 (ie fgt2.lic or prefix/fgt2.lic)"
		}
         
#######################################################################        

variable "tf_PublicSubnet1RouterIP" {
			type = string
			default =  "10.0.1.1"
			description =  "Provide the IP address of the AWS intrinsic router (First IP from PublicSubnet1)"
		}
variable "tf_PrivateSubnet1RouterIP" {
			type = string
			default =  "10.0.2.1"
			description =  "Provide the IP address of the AWS intrinsic router (First IP from PrivateSubnet1)"
		}
variable "tf_HAMgmtSubnet1RouterIP" {
			type = string
			default =  "10.0.4.1"
			description =  "Provide the IP address of the AWS intrinsic router (First IP from HAMgmtSubnet1)"
		}
variable "tf_PublicSubnet2RouterIP" {
			type = string
			default =  "10.0.10.1"
			description =  "Provide the IP address of the AWS intrinsic router (First IP from PublicSubnet2)"
		}
variable "tf_PrivateSubnet2RouterIP" {
			type = string
			default =  "10.0.20.1"
			description =  "Provide the IP address of the AWS intrinsic router (First IP from PrivateSubnet2)"
		}
variable "tf_HAMgmtSubnet2RouterIP" {
			type = string
			default =  "10.0.40.1"
			description =  "Provide the IP address of the AWS intrinsic router (First IP from HAMgmtSubnet2)"
		}
variable "tf_FortiGate1PublicIP" {
			type = string
			default =  "10.0.1.10/24"
			description =  "Provide the IP address in CIDR form for the public interface of FortiGate1 (IP from PublicSubnet1)"
		}
variable "tf_FortiGate1PrivateIP" {
			type = string
			default =  "10.0.2.10/24"
			description =  "Provide the IP address in CIDR form for the private interface of FortiGate1 (IP from PrivateSubnet1)"
		}
variable "tf_FortiGate1HAsyncIP" {
			type = string
			default =  "10.0.3.10/24"
			description =  "Provide the IP address in CIDR form for the ha sync interface of FortiGate1 (IP from HASyncSubnet1)"
		}
variable "tf_FortiGate1HAmgmtIP" {
			type = string
			default =  "10.0.4.10/24"
			description =  "Provide the IP address in CIDR form for the ha management interface of FortiGate1 (IP from HAMgmtSubnet1)"
		}
variable "tf_FortiGate2PublicIP" {
			type = string
			default =  "10.0.10.10/24"
			description =  "Provide the IP address in CIDR form for the public interface of FortiGate2 (IP from PublicSubnet1)"
		}
variable "tf_FortiGate2PrivateIP" {
			type = string
			default =  "10.0.20.10/24"
			description =  "Provide the IP address in CIDR form for the private interface of FortiGate2 (IP from PrivateSubnet1)"
		}
variable "tf_FortiGate2HAsyncIP" {
			type = string
			default =  "10.0.30.10/24"
			description =  "Provide the IP address in CIDR form for the ha sync interface of FortiGate2 (IP from HASyncSubnet1)"
		}
variable "tf_FortiGate2HAmgmtIP" {
			type = string
			default =  "10.0.40.10/24"
			description =  "Provide the IP address in CIDR form for the ha management interface of FortiGate2 (IP from HAMgmtSubnet1)"
		}
        
