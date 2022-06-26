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

#OAI Cloudfront
module "s3_bucket_access" {
    source = "./modules/cloud_front_oai"
}

#S3 Configuration
module "s3_bucket" {
    source = "./modules/s3"
    bucket_name = var.s3_bucket_name
    oai_iam_arn = module.s3_bucket_access.output_oai_iam_arn
}

#Upload content to S3 Bucket.
module "bucket_content" {
    source = "./modules/bucket_content"
    bucket_id = module.s3_bucket.output_bucket_id
}



