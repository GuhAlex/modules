output "vpc_id" {
  value = "${aws_security_group.allow_ssh_icmp.id}"
}

output "id_subnet" {
  value = "${aws_subnet.subnet_public.id}"
}
