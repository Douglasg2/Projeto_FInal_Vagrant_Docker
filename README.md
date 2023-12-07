# PROJETO FINAL VAGRANT DOCKER

Este é um projeto de implantação e gerenciamento de uma rede empresarial, utilizando virtualização com Vagrant e Docker e serviços como DHCP, DNS, Web, FTP e NFS, por meio do Sistema Linux.

## Objetivo

O objetivo deste projeto é criar uma infraestrutura de rede empresarial utilizando Vagrant para gerenciar máquinas virtuais e Docker para implantar aplicativos em contêineres. Os serviços essenciais, como DHCP, DNS, Web, FTP, NFS, serão configurados para funcionar de maneira eficiente e integrada.

## Requisitos

- Sistema Operacional Linux - Ubuntu
- Vagrant 2.2.19
- VirtualBox 6.1
- Docker 24.0.5

## Instruções para Uso

1. Clone o repositório "Projeto_FInal_Vagrant_Docker" do Github.
Link: <a>https://github.com/Douglasg2/Projeto_FInal_Vagrant_Docker</a>

2. Abra o terminal e acesse a pasta onde estiver localizado o projeto clonado utilizando o comando "cd", assim que estiver dentro da pasta execute o comando "vagrant up" para criação das VMs necessárias.

3. Execute o comando "vagrant status" para verificar se as VMs foram criadas corretamente.

4. Se as VMs foram criadas corretamente, basta inserir o comando "vagrant ssh NOME_DA_VM" (vmgateway) que irá iniciar os arquivos shell.

5. Ao terminar, basta executar o comando "vagrant halt" para encerrar as VMs. 

6. Se caso seja necessário ou queira apagar por completo a VM, execute "vagrant destroy".

## Topologia da Rede

A tabela a seguir descreve a topologia da rede proposta para este projeto.

| Máquina Virtual | Tipo           | Endereço IP       | Porta de Acesso | Serviços                    |
|------------------|----------------|-------------------|-----------------|-----------------------------|
| vmgateway        | Principal      | 192.168.56.10     | 1234 -> 22      | DHCP, DNS, FTP, NFS, Web    |
| vmftp            | Secundária     | DHCP Assigned     | Não aplicável   | FTP                         |

### Detalhes Adicionais

1. **vmgateway:**
   - Esta máquina é a máquina gateway principal.
   - Executa vários contêineres Docker para os serviços (DHCP, DNS, FTP, NFS, Web).
   - Possui uma interface de rede privada (`private_network`) com o IP estático `192.168.56.10`.
   - Há um encaminhamento de porta para acessar a máquina através da porta 1234 localmente (pode ser ajustado conforme necessário).

2. **vmftp:**
   - Uma máquina separada que executa um contêiner Docker para o serviço FTP.
   - Usa uma interface de rede privada configurada para obter um endereço IP através do DHCP.

3. **Compartilhamento de Arquivos:**
   - O diretório `/var/www/html` na máquina `vmgateway` é compartilhado com a máquina host e pode ser acessado localmente.

4. **Observações:**
   - Os detalhes específicos de configuração de cada serviço estão nos scripts de provisionamento (`dhcpd.sh`, `dns.sh`, `ftp.sh`, `nfs.sh`, `web.sh`).

Certifique-se de testar a conectividade e o funcionamento de cada serviço após a inicialização das máquinas virtuais.

## Segmentação de Sub-Rede

A tabela a seguir detalha a segmentação de sub-rede para as máquinas virtuais neste projeto.

| Máquina Virtual | Interface | Endereço IP        | Sub-rede           | Observações                             |
|------------------|-----------|--------------------|-------------------|-----------------------------------------|
| vmgateway        | eth0      | 192.168.56.10      | 192.168.56.0/24   | Interface privada (private_network)     |
| vmgateway        | eth1      | -                  | -                 | Encaminhamento de porta (Port Forwarding)|
| vmftp            | eth0      | DHCP Assigned      | -                 | Interface privada (private_network)     |

### Testes

1. Vagrant UP
<img src="https://raw.githubusercontent.com/Douglasg2/Projeto_FInal_Vagrant_Docker/55bc095b1a32dd17a9c3852364e859182bf4ea60/imagens/01.jpeg">


2. Entrando na VM "vmgateway"
<img src="https://raw.githubusercontent.com/Douglasg2/Projeto_FInal_Vagrant_Docker/55bc095b1a32dd17a9c3852364e859182bf4ea60/imagens/02.jpeg">

3. Containers ativos
<img src="https://raw.githubusercontent.com/Douglasg2/Projeto_FInal_Vagrant_Docker/55bc095b1a32dd17a9c3852364e859182bf4ea60/imagens/11.jpeg">

4. Entrando nos containers
- DNS <img src="https://raw.githubusercontent.com/Douglasg2/Projeto_FInal_Vagrant_Docker/55bc095b1a32dd17a9c3852364e859182bf4ea60/imagens/03.jpeg">

- FTP <img src="https://raw.githubusercontent.com/Douglasg2/Projeto_FInal_Vagrant_Docker/55bc095b1a32dd17a9c3852364e859182bf4ea60/imagens/04.jpeg">

- WEB <img src="https://raw.githubusercontent.com/Douglasg2/Projeto_FInal_Vagrant_Docker/55bc095b1a32dd17a9c3852364e859182bf4ea60/imagens/05.jpeg">

5. Entrando na VM "vmftp"
<img src="https://raw.githubusercontent.com/Douglasg2/Projeto_FInal_Vagrant_Docker/55bc095b1a32dd17a9c3852364e859182bf4ea60/imagens/07.jpeg">

6. Containers ativos
<img src="https://raw.githubusercontent.com/Douglasg2/Projeto_FInal_Vagrant_Docker/55bc095b1a32dd17a9c3852364e859182bf4ea60/imagens/08.jpeg">

4. Entrando nos containers
- FTP <img src="https://raw.githubusercontent.com/Douglasg2/Projeto_FInal_Vagrant_Docker/55bc095b1a32dd17a9c3852364e859182bf4ea60/imagens/04.jpeg">


### Observações Adicionais

1. **vmgateway:**
   - A interface `eth0` está configurada na sub-rede `192.168.56.0/24` usando o tipo `private_network`.
   - A interface `eth1` é usada para encaminhamento de porta, permitindo acesso externo através da porta 1234.

2. **vmftp:**
   - A interface `eth0` está configurada para obter um endereço IP via DHCP na sub-rede privada.