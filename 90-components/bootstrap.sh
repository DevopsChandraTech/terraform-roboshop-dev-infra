#!/bin/bash

dnf install ansible -y
component=$1
environment=$2
#ansible-pull -U https://github.com/DevopsChandraTech/ansible-roboshop-roles-tf.git -e component=$component main.yaml

REPO_URL=https://github.com/DevopsChandraTech/ansible-roboshop-roles-tf.git
REPO_DIR=/opt/roboshop/ansible
ANSIBLE_DIR=ansible-roboshop-roles-tf

mkdir -p $REPO_DIR
mkdir -p /var/log/roboshop
touch ansible.log

cd $REPO_DIR

#if the ansible directory exists pull the changes,if not clone the changes

if [ -d $ANSIBLE_DIR ]; then
    cd $ANSIBLE_DIR
    git pull
else
    git clone $REPO_URL
    cd $ANSIBLE_DIR
fi

ansible-playbook -e component=$component -e env=$environment main.yaml
