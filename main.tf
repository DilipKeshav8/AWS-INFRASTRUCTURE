module "vpc" {
  source = "./modules/vpc"
  project_name = var.project_name
}

module "alb" {
  source         = "./modules/alb"
  project_name   = var.project_name
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnet_ids
  alb_sg_id = module.iam.alb_sg_id
}

module "iam" {
  source       = "./modules/iam"
  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
}

module "ec2" {
  source                   = "./modules/ec2"
  project_name             = var.project_name
  ami_id                   = var.ami_id
  private_subnets          = module.vpc.private_subnet_ids
  iam_instance_profile_name = var.ec2_instance_profile_name
  security_group_id = module.iam.ec2_sg_id
}

module "secrets_manager" {
  source       = "./modules/secrets_manager"
  project_name = var.project_name
  db_username  = var.db_username
  db_password  = var.db_password
}

module "rds" {
  source            = "./modules/rds"
  project_name      = var.project_name
  private_subnets   = module.vpc.private_subnet_ids
  db_username       = var.db_username
  db_password       = var.db_password
  secrets_manager_arn = module.secrets_manager.secrets_arn
  vpc_id            = module.vpc.vpc_id
  ec2_sg_id = module.iam.ec2_sg_id
    db_sg_id  = module.iam.rds_sg_id  # pass the RDS security group ID from IAM module

}

module "s3" {
  source       = "./modules/s3"
  project_name = var.project_name
}

module "monitoring" {
  source         = "./modules/monitoring"
  project_name   = var.project_name
  notification_email = var.notification_email
  ec2_instance_ids = module.ec2.ec2_instance_ids
}