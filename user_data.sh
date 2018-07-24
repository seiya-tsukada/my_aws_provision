#!/bin/bash

yum -y install git
pip install ansible

aws s3 cp s3://my-provision.whiteray.tokyo/git-keys/id_git_rsa ~/.ssh/id_rsa
aws s3 cp s3://my-provision.whiteray.tokyo/ssh/config ~/.ssh/config
aws s3 cp s3://my-provision.whiteray.tokyo/provision/provision.yml /tmp/provision.yml


echo -e "[server]\n127.0.0.1" > /tmp/hosts
ansible-playbook -i /tmp/hosts /tmp/provision.yml --connection=local

chmod 400 ~/.ssh/id_rsa
chmod 400 ~/.ssh/config
git clone git@github.com:seiya-tsukada/my_aws_provision.git ~/my_aws_provision




