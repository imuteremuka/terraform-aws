module "compute" {
source  = "terraform-aws-modules/ec2-instance/aws"
version = "6.2.0"
region = var.region 

tags = local.common_tags
} 
