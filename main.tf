terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region     = "us-east-1"
  access_key = data.vault_generic_secret.aws.data["accesskey"]
  secret_key = data.vault_generic_secret.aws.data["secretkey"]
}
resource "aws_instance" "example_server" {
  ami           = "ami-04e914639d0cca79a"
  instance_type = "t2.micro"

  tags = {
    Name = "Example"
  }
}