# Create A VPC

resource "aws_vpc" "dev" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Custom_vpc"
  }

}

# Create Public Subnet

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "Public_subnet"
  }

}

# Create Private Subnet

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "Private_subnet"
  }

}

#Create Internet Gateway & Attach to VPC
resource "aws_internet_gateway" "dev" {
  vpc_id = aws_vpc.dev.id

}
# Create an Elastic IP for the NAT Gateway
resource "aws_eip" "nat" {
  tags = {
    Name = "NAT_gateway_eip"
  }
}

#Create NAT Gateway
resource "aws_nat_gateway" "dev" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id
  tags = {
    Name = "NAT_gateway"
  }
}

#Create Route table for private subnet  
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.dev.id
  }
  tags = {
    Name = "Private_RT"
  }

}

# Associate Private Subnet with Private Route Table
resource "aws_route_table_association" "private" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private.id
}

#Create Route table & Edit routes 

resource "aws_route_table" "dev" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev.id
  }
  tags = {
    Name = "Public_RT"
  }

}

#Create Subnet Association

resource "aws_route_table_association" "name" {
  route_table_id = aws_route_table.dev.id
  subnet_id      = aws_subnet.public.id

}

#create Security Group
resource "aws_security_group" "allows_tls" {
  name   = "allows_tls"
  vpc_id = aws_vpc.dev.id
  tags = {
    Name = "dev_sg"
  }

  # Ingress rules (Allow inbound traffic)
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  # Egress rules (Allow inbound traffic)  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # "-1" allows all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#create Public server 
resource "aws_instance" "Public_server" {
  ami                         = "ami-0fd05997b4dff7aac"
  instance_type               = "t2.micro"
  key_name                    = "Demo_vpc"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.allows_tls.id]
  associate_public_ip_address = true


  tags = {
    Name = "Public_ec2"
  }
}

#Create Private Server in private subnet 
resource "aws_instance" "Private_ec2" {
  ami="ami-0fd05997b4dff7aac"
  instance_type = "t2.micro"
  key_name = "Demo_vpc"
  subnet_id = aws_subnet.private.id
   tags = {
    Name = "Private_ec2"
  }
}
