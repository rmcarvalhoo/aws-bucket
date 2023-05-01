terraform {
  required_version = "> 1.0.0"
  required_providers {
    # https://registry.terraform.io/providers/hashicorp/aws/latest/docs
    aws = {
      source  = "hashicorp/aws"
      version = "4.65.0"
    }
  }
}

provider "aws" {
  #https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html
  region = "us-east-1"
  #default tags, sao tags que vm deixar escrita elas vao ser usadas para todos os recursos que a conf criada no AWS 
  default_tags {
    tags = {
      owner      = "ricardo"
      managed-by = "terraform"
    }
  }
}