# Variables for "01. terraform-FTGT-HA2AZ.tf"
# Parameters in this file will determine the AWS region used as well:
# - whether PAYG or BYOL is used-
# - where the BYOL licence files are stored
# - whether a new S3 end pointwill be created (default is YES)
# - the S3 bucket where config files will be created

# When changing regions, update at minimum the following variables:
 # region in:  region = "me-south-1" (provider "aws")
 # default     = "me-south-1" (variable "region")
 # tf_AZForSubnet1
 # tf_AZForSubnet2
 # tf_KeyPair
 # tf_InitS3Bucket
 # tf_AZForSubnetVM1
 # tf_AZForSubnetVM2
 # For BYOL,ensure you have licence files specified by variables:  
 # tf_FortiGate1LicenseFile
 # tf_FortiGate2LicenseFile

terraform {
  required_version = ">= 0.12"
}

provider "aws" {
region = "me-south-1"
 # region ="us-east-1"
  version = "~> 2.33"
}

variable "enable_honeypot" {
  description = "If set to true, enable T-POT honeypot"
  type        = bool
  default = true
}

variable "region" {
  type        = string
  default     = "me-south-1"
 # default     = "us-east-1"

  # Possible values:
  # us-east-2
  # us-east-1
  # us-west-1
  # us-west-2
  # ap-south-1
  # ap-northeast-2
  # ap-southeast-1
  # ap-southeast-2
  # ap-northeast-1
  # ca-central-1
  # eu-central-1
  # eu-west-1
  # eu-west-2
  # eu-west-3
  # eu-north-1
  # me-south-1
  # sa-east-1
  # us-gov-east-1 <- Not Supported !
  # us-gov-west-1 <- Not Supported !
  # ap-northeast-3 <- Not Supported !
  # ap-east-1 <- Not Supported !
  # cn-north-1 <- Not Supported !
  # cn-northwest-1 <- Not Supported !
}

variable "tf_StackLabel" {
			default = "FTGT-HA-2AZs"
			description = "Name of the CloudFormation stack"
		}
  
variable "nameTag"{
            type = string
            default = ""
} 


variable "tf_VPCCIDR" {
			default = "10.0.0.0/16"
			description = "Provide a network CIDR for the VPC"
		}

variable "tf_AZForSubnet1" {
#            default = "us-east-1a"
          default = "me-south-1a"
           
			description = "Select an Availability Zone for the first set of subnets"
		}

variable "tf_AZForSubnet2" {
            type = "string"
#            default = "us-east-1b"
            default = "me-south-1b"
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
#          default =  "c5.2xlarge"

			description = "Select the instance type for the FortiGates"
		}
variable "tf_CIDRForInstanceAccess" {
			type = string
			default = "0.0.0.0/0"
			description = "Provide a network CIDR from which the FortiGate instances will be accessed"
		}

variable "tf_KeyPair" {
            type        = string
          # default = "AWS-FTGT"
            default = "BH_Demo"

            description = "Key Pair used for accessing the Windows VMs"

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
#            default = "ftgt-bucket-us-east-1"
          default = "ftgt-bucket-me-south-1"
description =  "Provide the Init S3 Bucket name where your config files will be created"
		}
        
variable "tf_InitS3BucketRegion" {
			type = string
            default = ""
			description =  "Select the Region where the Init S3 Bucket exists *** the bucket should exist in the same region as this deployment for successful bootstrapping ***"
			
		}
variable "tf_LicenseType" {
			type = string
            default = "BYOL"
			description =  "Select the license type for the FortiGates"
#			"AllowedValues"
#				"PAYG"
#				"BYOL"
		}
        
variable "tf_FortiGate1LicenseFile" {
			type = string
            default =  "FGVM4VTM19001627.lic"
			description =  "[BYOL Only leave blank for PAYG] Provide the name of the BYOL license file in the Init S3 Bucket for FortiGate1 (ie fgt1.lic or prefix/fgt1.lic)"
		}
variable "tf_FortiGate2LicenseFile" {
			type = string
            default =  "FGVM4VTM19001628.lic"
			description =  "[BYOL Only leave blank for PAYG] Provide the name of the BYOL license file in the Init S3 Bucket for FortiGate2 (ie fgt2.lic or prefix/fgt2.lic)"
		}       

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

#AMIs for: "Windows_Server-2019-English-Full-Base-2019.10.09" 

variable "tf_windows_amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-00cb4c0d60b9476f4"
    "us-west-1" = "ami-0ed87187d8ca9"
    "us-east-2" = "ami-067317d2d40fd5919"
    "us-west-2" = "ami-0d7d80db021ba0d11"
#   "ap-east-1"  UNSUPPORTED
    "ap-south-1" = "ami-07545b3a1f4619f4b"
#   "ap-northeast-3"  UNSUPPORTED
    "ap-northeast-2" = "ami-0c276975654214bf3"
    "ap-southeast-1" = "ami-03cfcf203483cb4f0"
    "ap-southeast-2" = "ami-0eb941b8e00feef88"
    "ap-northeast-1" = "ami-0e48df3801c3e668e"
    "ap-northeast-2" = "ami-0c276975654214bf3"
    "ca-central-1" = "ami-014f55f965f51c865"
 #  "cn-north-1"  UNSUPPORTED
 #  "cn-northwest-1"   UNSUPPORTED
    "eu-central-1" = "ami-0e0564dc8e882f217"
    "eu-west-1" = "ami-0a174bb076b94a327"
    "eu-west-2" = "ami-07d5dc48e982cf42d"
    "eu-west-3" = "ami-0be23ddaab6554f34"
    "eu-north-1" = "ami-0a5544d5b970b291b"
    "me-south-1" = "ami-0185a257176511db9"
    "sa-east-1" = "ami-0a8e06a326feb20e2"
 #  "us-gov-east-1"   UNSUPPORTED
 #  "us-gov-west-1"  UNSUPPORTED   
  }
}

variable "tf_AZForSubnetVM1" {
#            default = "us-east-1a"
            default = "me-south-1a"
            description = "Select an Availability Zone for the first set of subnets"
		}

variable "tf_AZForSubnetVM2" {
            type = "string"
#            default = "us-east-1b"
            default = "me-south-1b"
            description = "Select an Availability Zone for the second set of subnets"
		}

variable "tf_ProtectedSubnet1" {
            type = "string"
            default = "10.0.100.0/24"
			description = "Provide a network CIDR for ProtectedSubnet1"
		}

variable "tf_ProtectedSubnet2" {
            type = "string"
			default = "10.0.200.0/24"
			description = "Provide a network CIDR for ProtectedSubnet2"
		}
variable "tf_WindowsVM1ip" {
            type = "string"
            default = "10.0.100.77"
            description = "IP address of one of the 2 Windows Server VMs used for testing and demo"
		}
        
variable "tf_WindowsVM2ip" {
            type = "string"
            default = "10.0.200.77"
            description = "IP address of one of the 2 Windows Server VMs used for testing and demo"
        }

variable "tf_HoneyPotip" {
            type = "string"
            default = "10.0.200.99"
            description = "IP address of the T-POT honeypot"
        }
