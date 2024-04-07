#!/bin/bash

echo -e "\n\nLembre-se de executar como ROOT!!!!!\n\n"

if [[ $# == 3 ]]
then
    which aws;
    if [[ $? == 0 ]]
    then
        echo -e "\nAtualizando o AWS CLI... \n"
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip";
        unzip awscliv2.zip;
        sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update;
    else
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip";
        unzip awscliv2.zip;
        sudo ./aws/install;
    fi
    export PATH=~/bin:$PATH;
    echo -e "\n\nConfigurando o AWS CLI... \n\n"
    aws configure set aws_access_key_id ${1};
    aws configure set aws_secret_access_key ${2};
    aws configure set default.region ${3};
else
    echo -e "\n\n argumentos inválidos, uso:\n awsclisetp.sh <access key> <secret acces key> <região az>\n\n";
fi
