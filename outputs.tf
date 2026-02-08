output "ec2_instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.my_ec2_instance[*].public_ip # Outputting public IPs of all instances as a list
} 

output "ec2_public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.my_ec2_instance[*].public_dns # Outputting public DNS names as well for reference
}

output "ec2_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.my_ec2_instance[*].private_ip # Outputting private IPs as well for reference
}
