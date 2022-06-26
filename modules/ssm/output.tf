output "output_parameter_store_value" {
    description = "returns the storage value of parameter store"
    value = aws_ssm_parameter.ps.value
}