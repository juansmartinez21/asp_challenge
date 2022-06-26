output "output_lambda_arn" {
  value       = aws_lambda_function.auth_function.qualified_arn
  description = "Lambda function ARN with version"
}