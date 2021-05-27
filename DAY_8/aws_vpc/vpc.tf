resource "aws_vpc" "my_vpc" {
  
  cidr_block = var.vpc_cidr  
  
  tags   = {
    Name = "my_main_vpc" 
  }
  
}

resource "aws_internet_gateway" "my_gw" {
  
  vpc_id = aws_vpc.my_vpc.id  
  
  tags   = {
    Name = "my_internet_gateway"
  }
  
}

resource "aws_subnet" "my_aws_sub" {
  
  count                   = length(var.subnets_cidr)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = element(var.subnets_cidr,count.index)
  availability_zone       = element(var.availability_zones,count.index)
  map_public_ip_on_launch = true  
  
  tags   = {
    Name = "My_Subnet-${count.index + 1}"
  }
  
}

resource "aws_route_table" "my_routing_table" {
  
  vpc_id = aws_vpc.my_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_gw.id
  }
  
  tags   = {
    Name = "My_Public_Routing_Table"
  }
  
}

resource "aws_route_table_association" "my_rta" {
  
  count          = length(var.subnets_cidr)
  subnet_id      = element(aws_subnet.my_aws_sub.*.id, count.index)
  route_table_id = aws_route_table.my_routing_table.id
  
}
