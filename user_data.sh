#!/bin/bash

/usr/bin/yum -y install git

/usr/bin/pip install --upgrade pip
/usr/local/bin/pip install ansible

/usr/bin/aws s3 cp s3://my-provision.whiteray.tokyo/git-keys/id_git_rsa ~/.ssh/id_rsa
/usr/bin/aws s3 cp s3://my-provision.whiteray.tokyo/ssh/config ~/.ssh/config
/usr/bin/aws s3 cp s3://my-provision.whiteray.tokyo/provision/provision.yml /tmp/provision.yml

/bin/echo -e "[server]\n127.0.0.1" > /tmp/hosts
/usr/local/bin/ansible-playbook -i /tmp/hosts /tmp/provision.yml --connection=local

/bin/chmod 400 ~/.ssh/id_rsa
/bin/chmod 400 ~/.ssh/config

/usr/bin/git clone git@github.com:seiya-tsukada/my_aws_provision.git ~/my_aws_provision




