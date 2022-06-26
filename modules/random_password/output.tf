output "output_password_generated" {
    description = "random password to access"
    value = random_string.random.id
}