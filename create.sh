#!/bin/sh

echo "Creating keys and server config"

docker build -t kvnnap/ovpn-create .devcontainer/
docker run --rm -it -v $PWD:/home/alpine/ovpn-create -w /home/alpine/ovpn-create kvnnap/ovpn-create:latest ./gen.sh

echo "Ready to deploy openvpn container inside deploy"

cp deploy/docker-compose.yml ..
