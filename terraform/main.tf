provider "aws" {
  region = var.region # region  = "us-east-1"
  profile = var.user # profile = "cli-user-full"  # Ensure this matches your AWS CLI profile # profile = "new-terraform-profile"
}

module "cluster" {
  source = "./modules/cluster"
  region = var.region
  vpc_cidr = var.vpc_cidr
  subnet_cidr_a = var.subnet_cidr_a
  subnet_cidr_b = var.subnet_cidr_b
  availability_zone_a = var.availability_zone_a
  availability_zone_b = var.availability_zone_b
  cluster_name = var.cluster_name
  iam_role_name = var.iam_role_name
}

module "ecr" {
  source = "./modules/ecr"
}

module "ecs" {
  source = "./modules/ecs"
  cluster_name = var.cluster_name
}

module "elb" {
  source = "./modules/elb"
  vpc_id  = module.cluster.vpc_id
  # subnets = module.cluster.subnet_ids # subnets = [module.cluster.subnet_id]
  # subnets = [module.cluster.subnet_id_a, module.cluster.subnet_id_b]
  subnets = module.cluster.subnet_ids
}


#module "TestS3" {
#  source  = "./modules/TestS3"
#  bucket_name = var.bucket_name
#}

module "s3" {
  source  = "./modules/s3"
  bucket_name = var.bucket_name
}

module "sqs" {
  source = "./modules/sqs"
  queue_name = var.queue_name
}
