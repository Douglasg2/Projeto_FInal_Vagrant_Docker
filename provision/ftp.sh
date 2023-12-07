#!/bin/bash

apt update
apt install -y docker.io
docker pull ustclug/ftp
    

docker run -itd --restart=always \
    -p 20-22:20-22 \
    -p 80:80 \
    -p 40000-40050:40000-40050 \
    -v /www/Projeto_Final_Vagrant_Docker/ftp_data:/srv/ftp \
    -v /www/Projeto_Final_Vagrant_Docker/ftp_logs:/var/log \
    -v /www/Projeto_Final_Vagrant_Docker/ftp_home:/home \
    -e PASV_ADDRESS=$PUBLIC_IP_ADDRESS \
    ustclug/ftp
