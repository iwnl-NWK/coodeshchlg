#!/bin/bash
echo -e "\n Lembre-se de executar como ROOT!!!\n"
set -e
if [[ $# == 3 ]]
then
    echo -e "\n Criando a VPC... \n"
    export vpcid=$(aws ec2 create-vpc --cidr-block ${1} --query Vpc.VpcId --output text);
    echo -e "\n Criando uma subrede pública para a VPC criada... \n"
    export subid=$(aws ec2 create-subnet --vpc-id ${vpcid} --cidr-block ${2} --availability-zone ${3} --query Subnet.SubnetId --output text);
    echo -e "\n Criando um internet gateway para a VPC criada... \n"
    export igwid=$(aws ec2 create-internet-gateway --query InternetGateway.InternetGatewayId --output text);
    echo -e "\n Conectando o internet gateway à VPC criada... \n"
    aws ec2 attach-internet-gateway --vpc-id ${vpcid} --internet-gateway-id ${igwid} 
    echo -e "\n Criando uma routetable para tráfego público... \n"
    export rtid=$(aws ec2 create-route-table --vpc-id ${vpcid} --query RouteTable.RouteTableId --output text);
    echo -e "\n Redirecionando todo tráfego para o gateway através da regra na routetable... \n"
    aws ec2 create-route --route-table-id ${rtid} --destination-cidr-block 0.0.0.0/0 --gateway-id ${igwid};
    echo -e "\n Associando a routetable à subrede da VPC criada... \n"
    aws ec2 associate-route-table --route-table-id ${rtid} --subnet-id ${subid};
else
    echo -e "\n\n passagem de argumentos incorreta! uso: \n vpcsetup.sh <cidr block da vpc> <cidr block da subrede> <regiao Az>\n";
fi
