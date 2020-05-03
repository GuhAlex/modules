resource "aws_vpc" "MyVPC" {
  cidr_block           = var.cidrvpc
  enable_dns_support   = var.dnsSupport
  enable_dns_hostnames = var.dnsHostNames
tags = {
  Name = "My VPC"
}
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.MyVPC.id
tags = {
  Name = "IGW"
}
}

resource "aws_subnet" "subnet_public" {
  vpc_id		  = aws_vpc.MyVPC.id
  cidr_block		  = var.cidr_subnet
  map_public_ip_on_launch = var.mapPublicIP
  availability_zone       = var.availabilityZone
tags = {
  Name = "SubNet Public"
}
}

resource "aws_route_table" "rtb_public" {
  vpc_id     = aws_vpc.MyVPC.id
route {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}
tags = {
  Name = "Route Table Public"
}
}

resource  "aws_route_table_association" "rta_subnet_public" {
 subnet_id      = aws_subnet.subnet_public.id
 route_table_id = aws_route_table.rtb_public.id
}


resource "aws_security_group" "allow_ssh_icmp" {
  name   = "allw_ssh_icmp"
  vpc_id = aws_vpc.MyVPC.id

ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = var.ingressCIDRblock
}

egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = var.egressCIDRblock
}


ingress {
  
 from_port   = 8
 to_port     = 0
 protocol    = "icmp"
 cidr_blocks = var.ingressCIDRblock
}


tags = {
  Name = "allow SSH ICMP"
}
}




