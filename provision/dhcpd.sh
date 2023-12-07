#!/bin/bash

# Atualiza os pacotes do sistema
apt update

# Instala o Docker
apt install -y docker.io

# Baixa a imagem Docker "networkboot/dhcpd"
docker pull networkboot/dhcpd

# Cria um contêiner temporário para copiar o arquivo dhcpd.conf
sudo docker create --name container_temporario networkboot/dhcpd
sudo docker cp dhcpd_data/dhcpd.conf container_temporario:/data/dhcpd.conf

# Remove o contêiner temporário
sudo docker rm container_temporario

# Inicia um novo contêiner DHCP usando a imagem "networkboot/dhcpd"
# Este contêiner usa o volume dhcpd_data para persistência dos dados
sudo docker run -d --net=host -v dhcpd_data:/data --restart always -p 67:67/udp networkboot/dhcpd
