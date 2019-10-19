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

