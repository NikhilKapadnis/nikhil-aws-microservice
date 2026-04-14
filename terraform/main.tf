provider "aws" {
  region = "us-east-1"                  
}

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true                                 # created an VPC
  enable_dns_support   = true
  tags = {
    Name = "Nikhil-vpc"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id                                 # creating an Internet Gateway 
 
  tags = {
    Name = "nikhil-igw"
  }
}
resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.main.id                # creating a public subnet2
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-1"
  }
}
resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"                         # creating a public subnet2
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-2"
  }
}
resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.11.0/24"                            # creating a private subnet1
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-1"
  }
}
resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.12.0/24"                      # creating a private subnet2
  availability_zone = "us-east-1b"

  tags = {
    Name = "private-2"
  }
}
resource "aws_eip" "nat" {
  domain = "vpc"                                           # elastic IP
}
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_1.id                       # creating a NAT gateway

  tags = {
    Name = "nikhil-nat"
  }
}
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id                                       # route table for public subnets 

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
resource "aws_route_table_association" "public_1" {              # #route table association public 1
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id                      #route table association public 2
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
                                                                  # route table for private subnets 
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
}
resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id                          #route table association private1
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id                           #route table association private2
  route_table_id = aws_route_table.private.id
}

resource "aws_ecr_repository" "app" {
  name ="nikhil-app"

  image_scanning_configuration {
    scan_on_push = true                          # creating an ecr repo 
  }
  image_tag_mutability = "MUTABLE"

  tags= {
    Name ="nikhil-ecr"
  }
}
output "ecr_repository_url" {
  value = aws_ecr_repository.app.repository_url              # giving output as URL of ecr repo
}

resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Allow HTTP"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]                       #adding an ALB SG
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}