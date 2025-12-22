variable "plain" {
    default = "kishore"
}

output "print" {
    value = var.plain
}

whenever we have the call the variable with a string ithe syntax should be eg:"${var.plain}-text"

output "synstax" {
    value = "${var.plain}-text"
}