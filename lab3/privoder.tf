terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.54"
    }
  }
}
provider "aws" {
  shared_credentials_files = ["/home/mrkernel/.aws/credentials"]
  region                   = "us-east-1"
}
