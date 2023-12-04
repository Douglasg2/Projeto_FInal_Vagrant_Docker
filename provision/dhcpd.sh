#!/bin/bash

apt update
apt install -y docker.io
docker pull networkboot/dhcpd

sudo docker run -v dhcpd_data:/data --name container_temporario busybox true
sudo docker cp "/dhcpd/dhcpd.conf" container_temporario:/data/dhcpd.conf
sudo docker rm container_temporario


sudo docker run -d --net=host -v dhcpd_data:/data --restart always -p 67:67/udp networkboot/dhcpd

