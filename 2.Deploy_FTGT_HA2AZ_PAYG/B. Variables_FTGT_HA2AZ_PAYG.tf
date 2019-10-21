variable "region" {
  type        = string
  default     = ""
}

variable "vpc_cidr" {
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

variable "tf_PublicSubnet1" {
  type = "string"
}

variable "tf_PrivateSubnet1" {
  type = "string"
}

variable "tf_HASyncSubnet1" {
  type = "string"
}

variable "tf_HAMgmtSubnet1" {
  type = "string"
}

variable "tf_PublicSubnet2" {
  type = "string"
}

variable "tf_PrivateSubnet2" {
  type = "string"
}

variable "tf_HASyncSubnet2" {
  type = "string"
}

variable "tf_HAMgmtSubnet2" {
  type = "string"
}

variable "tf_InstanceType" {
  type = "string"
}
		
variable "tf_CIDRForInstanceAccess" {
			type = string
			}
        
variable "tf_AZForFGT1" {
			type = string
		}
variable "tf_AZForFGT2" {
			type = string
        }
variable "tf_KeyPair" {
            type        = string
            }
            
variable "tf_S3EndpointDeployment" {
			type = string
            default = ""
		}
        
#variable "tf_PublicSubnet2RouteTableID" {
#			type = string
#		}

variable "tf_InitS3Bucket" {
			type = string
		}
        
variable "tf_InitS3BucketRegion" {
			type = string			
		}
variable "tf_LicenseType" {
			type = string
		}
        
variable "tf_FortiGate1LicenseFile" {
			type = string
		}
variable "tf_FortiGate2LicenseFile" {
			type = string
		}
                     
variable "tf_PublicSubnet1RouterIP" {
			type = string
		}
variable "tf_PrivateSubnet1RouterIP" {
			type = string
		}
variable "tf_HAMgmtSubnet1RouterIP" {
			type = string
		}
variable "tf_PublicSubnet2RouterIP" {
			type = string
		}
variable "tf_PrivateSubnet2RouterIP" {
			type = string
		}
variable "tf_HAMgmtSubnet2RouterIP" {
			type = string
		}
variable "tf_FortiGate1PublicIP" {
			type = string
		}
variable "tf_FortiGate1PrivateIP" {
			type = string
		}
variable "tf_FortiGate1HAsyncIP" {
			type = string
		}
variable "tf_FortiGate1HAmgmtIP" {
			type = string
		}
variable "tf_FortiGate2PublicIP" {
			type = string
		}
variable "tf_FortiGate2PrivateIP" {
			type = string
		}
variable "tf_FortiGate2HAsyncIP" {
			type = string
		}
variable "tf_FortiGate2HAmgmtIP" {
			type = string
		}
        