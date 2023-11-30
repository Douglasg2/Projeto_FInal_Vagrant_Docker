#!/bin/bash

apt update

apt install -y docker.io

docker pull networkboot/dhcpd

docker volume create dhcpd_data

docker run -d --net=host -v dhcpd_data:/data --restart always -p 67:67/udp \
  -v "/vagrantDHCP/dhcpd.conf:/data/dhcpd.conf" networkboot/dhcpd


