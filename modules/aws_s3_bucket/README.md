# AWS S3 Bucket Terraform Module

This Terraform module creates and configures an AWS S3 bucket with versioning enabled.

## Features

- Creates an S3 bucket with a customizable prefix
- Enables bucket versioning for state management and recovery

## Usage

```hcl
terraform {
  required_version = ">= 1.13.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "aws-region-#"
  # ... other provider configuration, e.g. profile...
}

module "aws_s3_bucket" {
  source              = "git::https://github.com/Investments-Assistant/terraform-modules//modules/aws_s3_bucket?ref=main"
  use_case_name_short = "shortname"
  repository_name     = "repository-name"
}
```

## Variables

| Name                 | Type    | Description                                                          | Required |
|----------------------|---------|----------------------------------------------------------------------|----------|
| use_case_name_short  | string  | A short name for the use case, used as a prefix for resource names.  | yes      |
| repository_name      | string  | The name of the repository, used as part of the S3 bucket name.      | yes      |

## Outputs

This module exposes the following outputs:

| Name         | Description                         |
|--------------|-------------------------------------|
| bucket_name  | The name of the created S3 bucket.  |

You can reference it as `module.aws_s3_bucket.bucket_name`.

## Providers

- [hashicorp/aws](https://registry.terraform.io/providers/hashicorp/aws/latest)

## Notes

- Ensure your AWS credentials are properly configured for Terraform.
- Adjust the AWS provider configuration according to your environment and region.
