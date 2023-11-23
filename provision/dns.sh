apt update
apt install -y docker.io
docker pull docksal/dns

docker run --name dns -d -e DNS_DOMAIN=docksal -e DNS_IP=192.168.100.64 -e LOG_QUERIES=true docksal/dns