# Projeto_FInal_Vagrant_Docker

Este é um projeto de implantação e gerenciamento de uma rede empresarial, utilizando virtualização com Vagrant e Docker e serviços como DHCP, DNS, Web, FTP e NFS, por meio do Sistema Linux.

## Objetivo:

O objetivo deste projeto é criar uma infraestrutura de rede empresarial utilizando Vagrant para gerenciar máquinas virtuais e Docker para implantar aplicativos em contêineres. Os serviços essenciais, como DHCP, DNS, Web, FTP, NFS, serão configurados para funcionar de maneira eficiente e integrada.

## Topologia de Rede:

Nesse projeto será utilizado uma VM contendo 5 containers, cada container será configurado com a especificação pedida, ou seja:

- 1ºContainer configurado com um servidor DHCP
- 2ºContainer com um servidor DNS
- 3ºContainer hospedando um servidor apache 
- 4ºContainer com um servidor FTP
- 5ºContainer configurado com um servidor NFS

## Requisitos

- Sistema Operacional Linux
- Vagrant 2.2.19
- VirtualBox 6.1
- Docker 24.0.5

## 