variable "cidrvpc" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "cidr_subnet" {
  description = "CIDR block for subnet"
  default     = "10.0.1.0/24"
}


variable "availabilityZone" {
  description = "AZ for subnet"
  default     = "us-east-2a"
}

variable "dnsSupport" {
  default = true
}

variable "dnsHostNames" {
  default = true
}

variable "ingressCIDRblock" {
  type    = list
  default = [ "0.0.0.0/0" ]
}

variable "egressCIDRblock" {
  type    = list
  default = [ "0.0.0.0/0" ]
}

variable "mapPublicIP" {
  default = true
}
