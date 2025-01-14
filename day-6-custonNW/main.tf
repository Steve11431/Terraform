# Create A VPC

resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name="Custom_vpc"
    }
  
}

# Create Public Subnet

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name="Public_subnet"
    }
  
}

# Create Private Subnet

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.1.0/24"
    tags = {
      Name="Private_subnet"
    }
  
}

#Create Internet Gateway & Attach to VPC
resource "aws_internet_gateway" "dev" {
    vpc_id = aws_vpc.dev.id
  
}
#Create Route table & Edit routes 

resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.dev.id
    route = {                       
        cidr_block ="0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev.id  
    }
  
}

#Create Subnet Association
