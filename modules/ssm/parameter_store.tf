resource "aws_ssm_parameter" "ps" {
  name  = "password"
  type  = "String"
  value = var.user_password
}