
# Creating AWS Key-Pair

resource "aws_key_pair" "Swiggy-Key" {
  key_name   = "Swiggy-key"
  tags = "Swiggy-Web-App-Key"
  public_key = file("${path.module}/id_rsa.pub")
}

# Creating AWS Security Group

resource "aws_security_group" "Swiggy-security-groups" {
  name        = "Swiggy-security-groups"
  description = "Allow TLS Inbound traffic for 22,443,80,8080 port and All Outbound port"

  ingress = [
    for port in var.ports : {
      description      = "TLS from VPC"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Swiggy-Web-App-security-groups"
  }
}


# Creating EC2 Instance
resource "aws_instance" "Swiggy-Web-App" {
  ami             = "${var.image_id}"
  instance_type   = "${var.instance_type}"
  key_name        = aws_key_pair.Swiggy-Key.key_name
  vpc_security_group_ids = ["${aws_security_group.Swiggy-security-groups.id}"]
  user_data = file("${path.module}/resource.sh")
  tags = {
    Name = "Swiggy web application deployment on Docker"
  }
}