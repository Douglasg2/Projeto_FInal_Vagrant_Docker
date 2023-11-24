# Projeto_FInal_Vagrant_Docker

Este é um projeto de implantação e gerenciamento de uma rede empresarial, utilizando virtualização com Vagrant e Docker e serviços como DHCP, DNS, Web, FTP e NFS, por meio do Sistema Linux.

## Objetivo:

O objetivo deste projeto é criar uma infraestrutura de rede empresarial utilizando Vagrant para gerenciar máquinas virtuais e Docker para implantar aplicativos em contêineres. Os serviços essenciais, como DHCP, DNS, Web, FTP, NFS, serão configurados para funcionar de maneira eficiente e integrada.

## Topologia de Rede:

Nesse projeto será utilizado uma VM configurada com um IP estático, essa VM contém 5 containers, cada container será configurado com a especificação pedida, ou seja:

- 1º Container configurado com um servidor DHCP
- 2º Container com um servidor DNS
- 3º Container hospedando um servidor apache 
- 4º Container com um servidor FTP
- 5º Container configurado com um servidor NFS

## Segmentação de Sub-Rede

1. Serviço DHCP
    - Sub-rede: 192.168.56.0/26
    -   Faixa de endereços disponíveis para DHCP: 192.168.56.1 a 192.168.56.62

2. Serviço DNS
    - Sub-rede: 192.168.56.0/26
    - Faixa de endereços disponíveis para DNS: 192.168.56.65 a 192.168.56.126

3. Serviço Web Apache
    - Sub-rede: 192.168.56.0/26
    - Faixa de endereços disponíveis para Web: 192.168.56.129 a 192.168.56.190

4. Serviço DHCP
    - Sub-rede: 192.168.56.0/26
    - Faixa de endereços disponíveis para FTP: 192.168.56.193 a 192.168.56.254

5. Serviço DHCP
    - Sub-rede: 192.168.56.0/26
    - Faixa de endereços disponíveis para NFS: 192.168.56.257 a 192.168.56.318





## Requisitos

- Sistema Operacional Linux
- Vagrant 2.2.19
- VirtualBox 6.1
- Docker 24.0.5

## 