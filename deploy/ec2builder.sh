#!/bin/bash
echo -e "\n\n Lembre-se de executar como ROOT!!!";
echo -e "\n\n é necessário criar uma keypair para se conectar à instancia EC2!!!\n";
echo -e "\n\n Para uma listagem das ID de AMIs disponíveis, use o comando: aws ec2 describe-images";
set -e
if [[ $# == 5 ]]
then
    aws ec2 run-instances --image-id ${1}  --instance-type ${2} --key-name ${3} --security-group-ids ${4} --subnet-id ${5};
else
    echo -e "\n\n Passagem de argumentos incorreta, uso: \n";
    echo -e "\n\n ec2build.sh <id da AMI> <tipo da instancia (recomenadado t2.micro do free tier)> <nome da chave criada associada> <id SG> <id Subrede> \n";
fi
