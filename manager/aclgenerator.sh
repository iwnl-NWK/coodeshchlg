#!/bin/bash
echo -e "\n Lembre-se de executar como ROOT!!!"
set -e
if [[ $# == 2 ]]
then
    export ACLID=$(aws ec2 create-network-acl --vpc-id ${1} --query NetworkAcl.NetworkAclId --output text)
    export VPCID=${1}
    envsubst < httptemplate.json > ${2}.json
    aws ec2 create-network-acl --vpc-id ${1} --cli-input-json ${2}
else
    echo -e "\n\n passagem de argumentos incorreta, uso: \n aclgenerator.sh <VPC id> <nome da acl.json>"
fi
