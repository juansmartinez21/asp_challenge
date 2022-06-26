provider "aws" {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    region = var.region
}

#Modules

#Generate a random password
module "generate_random_password" {
  source = "./modules/random_password"
}

#Store password in param store
module "ssm" {
  source = "./modules/ssm"
  user_password = module.generate_random_password.output_password_generated
}

#edge Lambda for auth 
module "lamba" {
  source = "./modules/lambda_function"
  user = var.user
  password = module.ssm.output_parameter_store_value
}

