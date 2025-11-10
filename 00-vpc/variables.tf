variable "cidr_block" {
    default = "10.0.0.0/16"
}

variable "project_name" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "vpc_tags" {
    default = {
        Purpose = "vpc_module"
        DontDelete = "true"
    }
}

variable "public_cidr" {
    default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_cidr" {
    default = ["10.0.11.0/24","10.0.12.0/24"]
}

variable "az" {
    default = ["us-east-1a","us-east-1b"]
}

variable "database_cidr" {
    default = ["10.0.21.0/24","10.0.22.0/24"]
}