terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "terraform_state" {
	bucket = "modusminima-net-terraform-state"
	acl = "private"
        versioning {
    		enabled = true
  	}
}
