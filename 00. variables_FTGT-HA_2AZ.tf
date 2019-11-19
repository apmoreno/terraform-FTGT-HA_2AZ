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
            default = "BYOL"
			description =  "Select the license type for the FortiGates"
#			"AllowedValues"
#				"PAYG"
#				"BYOL"
		}
        
variable "tf_FortiGate1LicenseFile" {
			type = string
            default =  "FGVM4VTM19001629.lic"
			description =  "[BYOL Only leave blank for PAYG] Provide the name of the BYOL license file in the Init S3 Bucket for FortiGate1 (ie fgt1.lic or prefix/fgt1.lic)"
		}
variable "tf_FortiGate2LicenseFile" {
			type = string
            default =  "FGVM4VTM19001630.lic"
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

variable "tf_windows_amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-0d4df21ffeb914d61"
    "us-west-1" = "ami-05f5b1fdbdbc92ec7"
    "us-east-2" = "ami-085a6b327e41e6912"
    "us-west-2" = "ami-0bff712af642c77c9"
#   "ap-east-1"  UNSUPPORTED
    "ap-south-1" = "ami-07b1360b71c3716d8"
#   "ap-northeast-3"  UNSUPPORTED
    "ap-northeast-2" = "ami-0fd7175b57c51b752"
    "ap-southeast-1" = "ami-00534e787c8349c76"
    "ap-southeast-2" = "ami-0f307b7625bd712cd"
    "ap-northeast-1" = "ami-0e48df3801c3e668e"
    "ca-central-1" = "ami-0054a87febcce8612"
 #  "cn-north-1"  UNSUPPORTED
 #  "cn-northwest-1"   UNSUPPORTED
    "eu-central-1" = "ami-034937fd7f621ba85"
    "eu-west-1" = "ami-0c143cb48fa7c1ec9"
    "eu-west-2" = "ami-06ea28ca18bb79e3c"
    "eu-west-3" = "ami-0ba894c68b1681e24"
    "eu-north-1" = "ami-09b605f903aef31cd"
    "me-south-1" = "ami-083a1092752dd42df"
    "sa-east-1" = "ami-05b2ce93b518cf8ee"
 #  "us-gov-east-1"   UNSUPPORTED
 #  "us-gov-west-1"  UNSUPPORTED

    
  }
}


#"Windows_Server-2019-English-Full-Base-2019.10.09", 
#    "Windows_Server-2019-English-STIG-Full-2019.10.09", 
#    "Windows_Server-2019-English-Core-Base-2019.10.09", 


variable "tf_AZForSubnetVM1" {
            default = "us-east-1a"
			description = "Select an Availability Zone for the first set of subnets"
		}

variable "tf_AZForSubnetVM2" {
            type = "string"
            default = "us-east-1b"
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
		}
        
variable "tf_WindowsVM2ip" {
            type = "string"
            default = "10.0.200.77"   
        }