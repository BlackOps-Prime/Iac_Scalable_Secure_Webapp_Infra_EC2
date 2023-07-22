output "ec2_instances_ids" {
  value = aws_instance.this[*].id
}
