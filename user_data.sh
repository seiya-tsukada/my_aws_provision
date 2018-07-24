#!/bin/bash

yum -y install git
aws s3 cp s3://my-provision.whiteray.tokyo/git-keys/id_git_rsa ~/.ssh/id_rsa
aws s3 cp s3://my-provision.whiteray.tokyo/ssh/config ~/.ssh/config
chmod 400 ~/.ssh/id_rsa
chmod 400 ~/.ssh/config
git clone git@github.com:seiya-tsukada/my_aws_provision.git ~/my_aws_provision

yum -y install gcc-c++