output "public_subnets_security_group_id" {
  value = aws_security_group.public_subnet_traffic_rules.id
}

output "private_subnets_security_group_id" {
  value = aws_security_group.application_traffic_rules.id
}

output "private_subnets_security_group_name" {
  value = aws_security_group.application_traffic_rules.name
}

output "database_subnets_security_group_id" {
  value = aws_security_group.database_traffic_rules.id
}