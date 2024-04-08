#!/bin/bash
echo -e "Faça Download da chave associada à instancia em que deseja fazer deploy antes de usar este Script!!!";
set -e
if [[ $# == 2 ]]
then
    scp -r ./setup -i ${2} ubuntu@${1}:/home/ubuntu/
    ssh -i ${2} ubuntu@${1} "cd ./setup && sudo ./setup.sh"
else
    echo -e "\n\n Passagem de argumentos incorreta, uso: \n deploy.sh <ip da instancia> <keypair associada>"
fi
