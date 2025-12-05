#!/bin/bash

dnf install ansible -y
component=$1
ansible-pull -U https://github.com/DevopsChandraTech/ansible-roboshop-roles-tf.git -e component=$component main.yaml