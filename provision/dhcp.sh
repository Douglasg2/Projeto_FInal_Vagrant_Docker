apt update
apt install -y docker.io
docker pull wordpress/dhcpd

sudo docker run --name some-wordpress --network some-network -d wordpress/dhcpd