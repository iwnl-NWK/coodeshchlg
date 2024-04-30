#!/bin/bash
echo -e "\n\nFazendo a configuracao no /opt, e instalando o NGINX [...]\n"
mkdir /opt/challenge && mv ./setup/* /opt/challenge && cd /opt/challenge;
tar xfz ./nginx-1.25.4.tar.gz;
cd nginx-1.25.4 && sudo ./configure && make && make install;
cat ./nginx.conf > /usr/local/nginx/nginx.conf;
cd /usr/local/nginx/sbin && ./nginx
