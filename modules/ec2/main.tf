resource "aws_instance" "app" {
  count         = 2
  ami           = var.ami_id
  instance_type = "t3.micro"
  subnet_id     = element(var.private_subnets, count.index)
  iam_instance_profile = var.iam_instance_profile_name
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "${var.project_name}-ec2-${count.index + 1}"
  }
}