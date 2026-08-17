
terraform {
  required_version = ">= 0.13.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.38.0, < 4.0.0"
    }
  }

  backend "s3" {
    key = "aws-grafana-observability.tfstate"
  }
}