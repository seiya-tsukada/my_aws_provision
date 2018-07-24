#! /bin/bash

cd /usr/local/src
aws s3 cp s3://my-provision.whiteray.tokyo/userdata.sh ./

# https://qiita.com/szk3/items/a3e054527c41d071ec94
# ansible 
# ansible-playbook site.yml -i [server_ip]