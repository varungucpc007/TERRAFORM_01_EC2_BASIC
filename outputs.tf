output "aws_instance_web_name" {
    value = aws_instance.web.tags.Name
    description = "Name of the web instance"
}

output "aws_instance_web_id" {
    value = aws_instance.web.id
    description = "ID of the web instance"
}

output "aws_instance_web_public_ip" {
    value = aws_instance.web.public_ip
    description = "Public IP of the web instance"
}

output "aws_vpc_id" {
    value = aws_vpc.vpc.id
    description = "ID of the VPC"
}

output "aws_subnet_public_id" {
    value = aws_subnet.main.id
    description = "ID of the public subnet"
}