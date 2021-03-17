terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.1.3"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "modusminima-net-terraform-state"
    key = "terraform-state"
    region = "us-west-2"
  }
}

variable "vultr_api_key" {
	sensitive = true
	type = string
}

variable "ssh_key" {
	sensitive = true
	type = string
}

# Configure the Vultr Provider
provider "vultr" {
  api_key = var.vultr_api_key
  rate_limit = 700
  retry_limit = 3
}

provider "aws" {
  region = "us-west-2"
}

#resource "aws_vpc" "my_vpc" {
#  cidr_block = "10.0.20.0/22"
#
#  tags = {
#    Name = "tf-example"
#  }
#}
#resource "aws_subnet" "my_subnet" {
#  vpc_id            = aws_vpc.my_vpc.id
#  cidr_block        = "10.0.20.0/24"
#  availability_zone = "us-west-2a"
#
#  map_public_ip_on_launch = true
#
#  depends_on = [aws_internet_gateway.gw]
#
#  tags = {
#    Name = "tf-example"
#  }
#}
#
#resource "aws_internet_gateway" "gw" {
#  vpc_id = aws_vpc.my_vpc.id
#
#  tags = {
#    Name = "main"
#  }
#}

#resource "aws_route_table" "r" {
#  vpc_id = aws_vpc.my_vpc.id
#
#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = aws_internet_gateway.gw.id
#  }
#}
#
#resource "aws_route_table_association" "rt_assoc" {
#	subnet_id = aws_subnet.my_subnet.id
#	route_table_id = aws_route_table.r.id
#}

#resource "aws_default_route_table" "route_table" {
#  default_route_table_id = aws_vpc.my_vpc.default_route_table_id
#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = aws_internet_gateway.gw.id
#  }
#}

#resource "aws_network_interface" "foo" {
#  subnet_id   = aws_subnet.my_subnet.id
#  private_ips = ["10.0.20.100"]
#
#  tags = {
#    Name = "primary_network_interface"
#  }
#}
#resource "aws_eip" "bar" {
#  vpc = true
#
#  instance                  = aws_instance.dev1.id
#  associate_with_private_ip = "10.0.20.100"
#  depends_on                = [aws_internet_gateway.gw]
#}
#
#resource "aws_key_pair" "deployer" {
#  key_name   = "deployer-key"
#  public_key = var.ssh_key
#}
#
#resource "aws_instance" "dev1" {
#	ami = "ami-0349daaf0c6835e6a"
#	#ami = "ami-00f9f4069d04c0c6e"
#	instance_type = "t2.micro"
#	key_name = "deployer-key"
#        associate_public_ip_address = true 
#	subnet_id = aws_subnet.my_subnet.id
#	vpc_security_group_ids = [aws_security_group.home_sg.id]
#
#}
#
#resource "aws_instance" "dev2" {
#	ami = "ami-0349daaf0c6835e6a"
#	instance_type = "t2.micro"
#	key_name = "deployer-key"
#        associate_public_ip_address = false
#	subnet_id = aws_subnet.my_subnet.id
#	vpc_security_group_ids = [aws_security_group.home_sg.id]
#
#}
#
#resource "aws_security_group" "home_sg" {
#  name        = "home_sg"
#  description = "Allow home inbound traffic"
#  vpc_id      = aws_vpc.my_vpc.id
#
#  ingress {
#    description = "anything from home"
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["161.97.224.224/32", ]
#  }
#
#  egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#}

# Keys
resource "vultr_ssh_key" "my_key" {
	name = "my_key"
	ssh_key = var.ssh_key
}

# Firewall
resource "vultr_firewall_group" "home_restricted" {
	description = "SSH from home only"
}

resource "vultr_firewall_group" "aws_dev" {
	description = "open up everything to the aws instance"
}

resource "vultr_firewall_rule" "home_ssh_ipv4" {
	firewall_group_id = vultr_firewall_group.home_restricted.id
	protocol = "tcp"
	ip_type = "v4"
	subnet = "161.97.224.224"
	subnet_size = 32
	port = 22
	notes = "SSH from home IP address"
}
#resource "vultr_firewall_rule" "web1_home_ssh_ipv4" {
#	firewall_group_id = vultr_firewall_group.aws_dev.id
#	protocol = "tcp"
#	ip_type = "v4"
#	subnet = "161.97.224.224"
#	subnet_size = 32
#	port = 22
#	notes = "SSH from home IP address"
#}
#resource "vultr_firewall_rule" "dev1_ipv4_tcp" {
#	firewall_group_id = vultr_firewall_group.aws_dev.id
#	protocol = "tcp"
#	ip_type = "v4"
#	subnet = aws_instance.dev1.public_ip
#	subnet_size = 32
#	port = "1:65535"
#	notes = "Network traffic from dev1 in aws"
#}
#resource "vultr_firewall_rule" "dev1_ipv4_udp" {
#	firewall_group_id = vultr_firewall_group.aws_dev.id
#	protocol = "udp"
#	ip_type = "v4"
#	subnet = aws_instance.dev1.public_ip
#	subnet_size = 32
#	port = "1:65535"
#}
#resource "vultr_firewall_rule" "dev1_ipv4_icmp" {
#	firewall_group_id = vultr_firewall_group.aws_dev.id
#	protocol = "icmp"
#	ip_type = "v4"
#	subnet = aws_instance.dev1.public_ip
#	subnet_size = 32
#	port = "1:65535"
#}
#resource "vultr_firewall_rule" "dev1_ipv4_ah" {
#	firewall_group_id = vultr_firewall_group.aws_dev.id
#	protocol = "ah"
#	ip_type = "v4"
#	subnet = aws_instance.dev1.public_ip
#	subnet_size = 32
#	port = "1:65535"
#}
#resource "vultr_firewall_rule" "dev1_ipv4_esp" {
#	firewall_group_id = vultr_firewall_group.aws_dev.id
#	protocol = "esp"
#	ip_type = "v4"
#	subnet = aws_instance.dev1.public_ip
#	subnet_size = 32
#	port = "1:65535"
#}
# OpenBSD first boot
resource "vultr_startup_script" "openbsd_firstboot" {
	name = "test_script"
	script = base64encode(templatefile("openbsd_firstboot.tpl", {}))
}

# Create a web instance
resource "vultr_instance" "web1" {
	region = "dfw"
	plan = "vc2-1c-1gb"
	os_id = "412"
	ssh_key_ids = [vultr_ssh_key.my_key.id]
	firewall_group_id = vultr_firewall_group.home_restricted.id
	script_id = vultr_startup_script.openbsd_firstboot.id
        private_network_ids = [vultr_private_network.v_private_network.id]
}

# Create a web instance
#resource "vultr_instance" "web2" {
#	region = "dfw"
#	plan = "vc2-1c-1gb"
#	os_id = "412"
#	ssh_key_ids = [vultr_ssh_key.my_key.id]
#	firewall_group_id = vultr_firewall_group.home_restricted.id
#	script_id = vultr_startup_script.openbsd_firstboot.id
#        private_network_ids = [vultr_private_network.v_private_network.id]
#}

# create the private instance
resource "vultr_private_network" "v_private_network" {
    description = "my private network"
    region = "dfw"
    v4_subnet  = "10.0.24.0"
    v4_subnet_mask = 24
}

# DNS
resource "vultr_dns_domain" "modusminima_net" {
	domain = "modusminima.net"
}

resource "vultr_dns_record" "web1_dns" {
	domain = vultr_dns_domain.modusminima_net.id
	name = "web1"
	data = vultr_instance.web1.main_ip
	type = "A"
        ttl = "30"
}

#resource "vultr_dns_record" "web2_dns" {
#	domain = vultr_dns_domain.modusminima_net.id
#	name = "web2"
#	data = vultr_instance.web2.main_ip
#	type = "A"
#        ttl = "30"
#}
#
#resource "vultr_dns_record" "dev1_dns" {
#	domain = vultr_dns_domain.modusminima_net.id
#	name = "dev1"
#	data = aws_instance.dev1.public_ip
#	type = "A"
#        ttl = "30"
#}


#output "dev1_ip" {
#	value = aws_instance.dev1.public_ip
#}
#output "dev2_ip" {
#	value = aws_instance.dev2.public_ip
#}

output "vultr_web1_ip" {
	value = vultr_instance.web1.main_ip
}
#output "vultr_web2_ip" {
#	value = vultr_instance.web2.main_ip
#}
