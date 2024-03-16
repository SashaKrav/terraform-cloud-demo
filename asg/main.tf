module "asg" {
  source = "terraform-aws-modules/autoscaling/aws"
  name = "wordpress"
  # Launch configuration
  lc_name = "example-lc"
  image_id        = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  # Auto scaling group
  asg_name                  = "example-asg"
  vpc_zone_identifier       = data.terraform_remote_state.vpc.outputs.private_subnets
  health_check_type         = "EC2"
  min_size                  = 0
  max_size                  = 1
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
}