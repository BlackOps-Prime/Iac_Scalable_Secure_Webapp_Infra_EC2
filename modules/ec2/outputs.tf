output "ec2_instances_ids" {
  value = aws_instance.this[*].id
}

output "ec2_instances_private_ip" {
  value = aws_instance.this.private_ip
}
