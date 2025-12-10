#!/bin/bash
# #growing the home volume for terraform purpose
sudo growpart /dev/nvme0n1 4
sudo lvextend -L +30G /dev/mapper/RootVG-homeVol
sudo xfs_growfs /home/

#installing the terraform
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform