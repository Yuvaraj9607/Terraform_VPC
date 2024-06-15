resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr_vpc
  tags ={   
    name=var.name   
}
}

resource "aws_subnet" "subpub1" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.subpub1
  availability_zone = var.az_subnet1
  tags = {
    name="publicsubnet1"
  }
  
}
resource "aws_subnet" "subpub2" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.subpub2
  availability_zone = var.az_subnet2
  tags = {
    name="publicsubnet2"
  }
}
resource "aws_subnet" "subpvt1" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.subpvt1
  availability_zone = var.az_subnet1
  tags = {
    name="privatesubnet1"
  }
}
resource "aws_subnet" "subpvt2" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.subpvt2
  availability_zone = var.az_subnet2

  tags = {
    name="privatesubnet2"
  }
}

resource "aws_internet_gateway" "eigw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    name="IGW"
  }
}
resource "aws_route_table" "pubrt1" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eigw.id
}
}

resource "aws_route_table" "pubrt2" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.eigw.id
    }
}
resource "aws_route_table" "pvtrt1" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.pvtnat1.id
  }
}
resource "aws_route_table" "pvtrt2" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.pvtnat2.id
  }
}
resource "aws_eip" "eip1" {
  domain = "vpc"
}
resource "aws_eip" "eip2" {
  domain = "vpc"
}
resource "aws_nat_gateway" "pvtnat1" {
  allocation_id = aws_eip.eip1.id
  subnet_id = aws_subnet.subpvt1.id
}
resource "aws_nat_gateway" "pvtnat2" {
  allocation_id = aws_eip.eip2.id
  subnet_id = aws_subnet.subpvt2.id
}
resource "aws_route_table_association" "subpvt1_assoc" {
  subnet_id = aws_subnet.subpvt1.id
  route_table_id = aws_route_table.pvtrt1.id
}
resource "aws_route_table_association" "subpvt2_assoc" {
  subnet_id = aws_subnet.subpvt2.id
  route_table_id = aws_route_table.pvtrt2.id
}
# resource "aws_security_group" "pubsg" {
#   vpc_id = aws_vpc.myvpc.id

#   ingress = [
#   {
#     from_port = 80
#     to_port = 80
#     protocol = "tcp"
#     cidr_block = ["0.0.0.0/0"]
#   },
#   {
#     from_port = 443
#     to_port = 443
#     protocol = "tcp"
#     cidr_block = ["0.0.0.0/0"]
#   },
#   {
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ]
#   egress = [
#     {
#     from_port = 0
#     to_port = 0
#     protocol = -1
#     cidr_block = ["0.0.0.0/0"]
#   }
# #  ]
# }

# resource "aws_security_group" "pvtsg" {
#   vpc_id = aws_vpc.myvpc.id

#   ingress = [
#     {
#       from_port = 22
#       to_port = 22
#       protocol = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     },
#     {
#       from_port = 80
#       to_port = 80
#       protocol = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#  ]
# }
