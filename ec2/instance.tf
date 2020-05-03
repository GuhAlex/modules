resource "aws_instance" "ubuntu" { 
instance_type          = var.kind
ami                    = var.image
count                  = var.qtd
subnet_id		       = var.id_subnet
vpc_security_group_ids = var.id_vpc_sg
key_name		       = var.name_key
}

