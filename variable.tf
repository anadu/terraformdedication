variable "plain" {
    default = "kishore"
}

output "print" {
    value = var.plain
}

#whenever we have the call the variable with a string ithe syntax should be eg:"${var.plain}-text"

output "synstax" {
    value = "${var.plain}-text"
}

#datatypes
#string
#boolean
#number

#variable types
#plain
#list -- list it have one key and more values 
#map -- A key have again key and value 

#list
variable "list" {
    default = ["kishore",2,false]
}

variable "map" {
    default ={
        name = "kishore"
        course = "azure"
        cloud = "devops"
    }
}

#Acessing list value
output "list" {
    value = var.list[1]
}

#Acessin the map value
 output "map" {
    value = var.map["name"]
 }

 # when we keep the value terraform.tfvars automatically pick the value

 variable "env"{}

 output "whicnenv" {
    value = var.env
 }
