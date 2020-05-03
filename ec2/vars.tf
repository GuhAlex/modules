variable "kind" {
  description = "Kind of instance"
  default     = "t2.micro"
}
variable "image" {
  description = "Image of instance" 
  default     = "ami-004d3abe7e5109c79"
}
variable "qtd" {
description = "Quantidade de instances"
  default   = "1"
}
variable "id_subnet" {
  description = "Subnet ID"
}
variable "id_vpc_sg" {
  description = "ID VPC Security Group"
}
variable "name_key" {
  description = "Key SSH"
}

