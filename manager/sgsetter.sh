#!/bin/bash
echo -e "Lembre-se de executar como ROOT!!!"
set -e
if [[ $# == 2 ]]
then
    export sgid=$(aws ec2 create-security-group --group-name ${2} --description "SG para instancia EC2, servindo HTTP simples" --vpc-id ${1} --query SecurityGroup.GroupId --output text);
    aws ec2 authorize-security-group-ingress --group-id ${sgid} --protocol tcp --port 22 --cidr 0.0.0.0/0;
    aws ec2 authorize-security-group-ingress --group-id ${sgid} --protocol tcp --port 80 --cidr 0.0.0.0/0;
    aws ec2 authorize-security-group-ingress --group-id ${sgid} --protocol tcp --port 443 --cidr 0.0.0.0/0;
else
    echo -e "\n passagem de argumentos incorreta, uso: \n sgsetter.sh <VPC ID> <Nome do SG>";
fi

