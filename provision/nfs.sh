#!/bin/bash

apt update
apt install -y docker.io

docker pull erichough/nfs-server

mkdir -p /www/Projeto_Final_Vagrant_Docker/html/shared

docker run -d --name nfs-server --privileged -p 2049:2049 \
  -v /www/Projeto_Final_Vagrant_Docker/html/shared:/export \
  -e NFS_EXPORT_0=/export \
  -e NFS_EXPORT_1=/www/Projeto_Final_Vagrant_Docker/html/shared \
  erichough/nfs-server
