terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "http://localhost:4566"
  }
}

# 1. Red Virtual (VPC)
resource "aws_vpc" "mi_red_prueba" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-desde-terraform"
  }
}

# 2. Subred Pública
resource "aws_subnet" "subred_publica" {
  vpc_id                  = aws_vpc.mi_red_prueba.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "subred-publica-iac"
  }
}

# 3. Grupo de Seguridad (Firewall)
resource "aws_security_group" "sg_web" {
  name        = "sg_web"
  description = "Permite acceso HTTP y SSH"
  vpc_id      = aws_vpc.mi_red_prueba.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 4. Servidor EC2 Simulado
resource "aws_instance" "servidor_web" {
  ami                    = "ami-12345678"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subred_publica.id
  vpc_security_group_ids = [aws_security_group.sg_web.id]

  tags = {
    Name = "servidor-web-localstack"
  }
}
