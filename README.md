# TERRAFORM_01_EC2_BASIC

## Project Overview

This Terraform project creates a basic AWS EC2 instance. It is a beginner-friendly setup for understanding Terraform providers, resources, variables, outputs, and the standard Terraform workflow.

## What This Project Creates

- One AWS EC2 instance
- Basic instance configuration
- Optional tags for resource identification
- Output values such as instance ID and public IP

## Technologies Used

| Technology | Purpose |
| --- | --- |
| Terraform | Infrastructure as Code |
| AWS EC2 | Virtual server |
| AWS Provider | AWS resource provisioning |

## Recommended Files

```text
TERRAFORM_01_EC2_BASIC/
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md
```

## Prerequisites

- AWS account
- Terraform installed
- AWS CLI installed and configured
- Valid AWS access credentials

## AWS CLI Configuration

```bash
aws configure
```

Provide:

- AWS Access Key ID
- AWS Secret Access Key
- Default region
- Output format

## Terraform Commands

### Initialize Terraform

```bash
terraform init
```

### Validate Configuration

```bash
terraform validate
```

### Preview Changes

```bash
terraform plan
```

### Apply Infrastructure

```bash
terraform apply
```

Type `yes` when Terraform asks for confirmation.

### Destroy Infrastructure

```bash
terraform destroy
```

## Expected Output

After successful deployment, Terraform should show details such as:

- EC2 instance ID
- Public IP address
- Public DNS name

## Important Notes

- Make sure the selected AMI ID exists in your AWS region.
- Use a free-tier eligible instance type if you are practicing.
- Always run `terraform destroy` after testing to avoid AWS charges.

