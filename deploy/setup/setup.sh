#!/bin/bash
echo -e "\n\nFazendo a configuracao no /opt, e instalando o NGINX [...]\n"
sudo mkdir /opt/challenge && sudo mv ./setup/* /opt/challenge && sudo cd /opt/challenge;
sudo tar xfz ./nginx-1.25.4.tar.gz;
cd nginx-1.25.4 && sudo ./configure && sudo make && sudo make install;
sudo cat ./nginx.conf > /usr/local/nginx/nginx.conf;
cd /usr/local/nginx/sbin && sudo ./nginx
