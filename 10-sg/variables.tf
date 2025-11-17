variable "project_name" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "sg_names" {
    type = list
    # databases
    default = ["mongodb","redis","mysql","rabbitmq",
    # backend
    "catalogue","user","cart","shipping","payment",
    # frontend
    "frontend",
    # bastion
    "bastion"
    ]
}


