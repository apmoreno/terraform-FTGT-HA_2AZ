variable "region" {
  type        = string
  default     = ""
}

variable "test_amis" {
  type = "map"
}

variable "avail-zone-a" {
   type = "map" 
}

variable "avail-zone-b" {
   type = "map" 
}

variable "avail-zone-c" {
   type = "map"
}

variable "ec2_key_name" {
type        = string
  default   = ""
}