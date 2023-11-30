#!/bin/bash

apt update
apt install -y docker.io
docker pull docksal/dns

docker run --name provision_dns -d -e DNS_DOMAIN=docksal -e DNS_IP=192.168.100.64 -e LOG_QUERIES=true docksal/dns