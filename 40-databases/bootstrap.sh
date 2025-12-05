#!/bin/bash

dnf install ansible -y
ansible-pull -U https://github.com/DevopsChandraTech/ansible-roboshop-roles-tf.git -e componant=mongodb main.yaml