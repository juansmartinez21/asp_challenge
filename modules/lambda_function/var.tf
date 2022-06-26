variable "function_name" {
  type        = string
  default     = "basicAuth"
  description = "Lambda function name"
}

variable "user" {
  type        = string
  description = "Credentials for Basic Authentication. Pass the 'user' the 'password' param is generated automatically."
}

variable "password" {
  type        = string
  description = "Access password."
}