# AWS-INFRASTRUCTURE
Automates secure, scalable AWS infrastructure with Terraform — includes VPC, EC2, RDS, ALB, S3, IAM, Secrets Manager, and CloudWatch monitoring.

# 🚀 AWS Infrastructure Automation with Terraform

This project automates the provisioning of a secure, scalable, and production-ready AWS infrastructure using **Terraform**. It follows **Infrastructure as Code (IaC)** principles for consistency, reproducibility, version control, and modular scalability.

---

## 📁 Project Structure
AWS-INFRASTRUCTURE/
├── main.tf # Root configuration file
├── variables.tf # Root input variables
├── outputs.tf # Root outputs
├── terraform.tfvars # Environment-specific values
├── provider.tf # AWS provider setup
└── modules/
├── vpc/ # Virtual Private Cloud
├── alb/ # Application Load Balancer
├── ec2/ # EC2 Instances
├── iam/ # IAM Roles & Security Groups
├── rds/ # RDS Database
├── s3/ # S3 Buckets
├── secrets_manager/ # AWS Secrets Manager
└── monitoring/ # CloudWatch Monitoring & Alarms


## 🔧 Modules Breakdown

### `vpc/`
Creates a custom VPC with public/private subnets, internet/NAT gateways, and route tables.

### `alb/`
Deploys an Application Load Balancer across public subnets with target groups and listener rules.

### `ec2/`
Launches EC2 instances in private subnets with proper IAM roles and security groups.

### `iam/`
Manages IAM roles, policies, and creates security groups for ALB, EC2, and RDS following the **principle of least privilege**.

### `rds/`
Provisions a PostgreSQL RDS instance with subnet group and security group access from EC2. Credentials are securely stored in AWS **Secrets Manager**.

### `s3/`
Creates versioned S3 buckets for object storage, with optional lifecycle policies.

### `secrets_manager/`
Stores sensitive data (e.g., DB credentials) securely and integrates with EC2 and RDS.

### `monitoring/`
Sets up **CloudWatch** dashboards, alarms, and **SNS topics** for system health notifications.

---

## 🌐 Tools Used

| Tool               | Purpose                          |
|--------------------|----------------------------------|
| Terraform          | Infrastructure as Code (IaC)     |
| AWS Provider       | Manage AWS Resources             |
| CloudWatch         | Monitoring & Metrics             |
| Secrets Manager    | Secure Credential Storage        |
| Git / GitHub       | Version Control                  |
| S3 & DynamoDB      | Remote State Storage & Locking   |

---

## 🔐 Security Best Practices

- All compute and database resources are deployed in **private subnets**.
- Secrets like DB credentials are stored in **AWS Secrets Manager**.
- IAM roles and policies are minimal and scoped.
- **S3 bucket versioning** and **lifecycle policies** enabled.
- Terraform **remote state** is stored in S3 with DynamoDB locking.

---

## ⚙️ Remote State Backend (S3 + DynamoDB)

This project uses a remote backend for Terraform state:

terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "envs/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

🚀 Getting Started
✅ Prerequisites
Terraform v1.3+

AWS CLI configured with credentials

Existing S3 bucket and DynamoDB table (optional for remote state)


Deployment Steps

terraform init
terraform validate
terraform plan
terraform apply

Example Input Variables (terraform.tfvars)

project_name               = "my-app"
db_username                = "admin"
db_password                = "supersecret123"
ami_id                     = "ami-0abcdef1234567890"
ec2_instance_profile_name = "my-ec2-role"
notification_email         = "you@example.com"


📤 Outputs After Deployment
✅ VPC ID and Subnet IDs

✅ ALB DNS Name

✅ EC2 Instance IDs

✅ RDS Endpoint

✅ Secrets Manager ARN

✅ S3 Bucket Name

🧹 Cleanup Resources
To destroy all provisioned infrastructure:

terraform destroy



📚 License
MIT License — free to use, modify, and distribute. Contributions welcome!
