variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block"
  default     = "192.168.1.0/24"
}

variable "instance_tenancy" {
  type = string
  description = "Instance tenancy option for the VPC"
    default = "default"
}

variable "subnet_private_cidr_block" {
    type = string
    description = "Subnet CIDR block"
    default = "192.168.1.0/26"
}

variable "subnet_public_cidr_block" {
    type = string
    description = "Subnet CIDR block"
    default = "192.168.1.64/26"
}

variable "map_public_ip_on_launch" {
    type = bool
    description = "Map public IP on launch for the subnet"
    default = true
  
}

variable "cidr_block" {
    type = string
    description = "CIDR block for routing"
    default = "0.0.0.0/0"
}

variable "sg_name" {
    type = string
    description = "Security Group Name"
    default = "sg"
}

variable "sg_description" {
    type = string
    description = "Security Group Description"
    default = "Allow TLS inbound traffic"
}

variable "instance_type" {
    type = string
    description = "Instance type"
    default = "t3.micro"
}