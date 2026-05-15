resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = "india-vpc"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${aws_vpc.vpc.tags.Name}-igw"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_private_cidr_block

  tags = {
    Name = "${aws_vpc.vpc.tags.Name}-private-subnet"
  }
}

resource "aws_subnet" "main1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_public_cidr_block
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    Name = "${aws_vpc.vpc.tags.Name}-public-subnet"
  }
}

resource "aws_route_table" "routetable" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "${aws_vpc.vpc.tags.Name}-route-table"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main1.id
  route_table_id = aws_route_table.routetable.id
}

resource "aws_security_group" "sg" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }
  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }
    ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }
  tags = {
    Name = "${aws_vpc.vpc.tags.Name}-sg"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  subnet_id     = aws_subnet.main1.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  instance_type = var.instance_type

  tags = {
    Name = "HelloWorld"
  }
}
