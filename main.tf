module "vpc" {
  source = "./._modules/vpc"
  # Variables
}

module "ecr" {
  source = "./._modules/ecr"
  # Variables
}

module "s3" {
  source = "./._modules/s3"
  # Variables
}

module "postgresql" {
  source = "./._modules/postgresql"
  # Variables
  depends_on = [module.vpc]
}