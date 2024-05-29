#!/bin/sh

clients="test1 test2"
cn="kvnnap"

# Generate pki
if [ ! -d "pki" ]; then
    easyrsa init-pki
    easyrsa --req-cn=$cn build-ca nopass
    easyrsa gen-dh
fi

# Server
if [ ! -f "pki/inline/server.inline" ]; then
    easyrsa build-server-full server nopass
fi

# Move server dir
mkdir -p conf/server
cp server.conf up.sh down.sh pki/ca.crt pki/dh.pem pki/issued/server.crt pki/private/server.key conf/server
mv conf/server/server.conf conf/server/server.ovpn

# Iterate over the array
for client in $clients; do
    if [ ! -f "pki/inline/$client.inline" ]; then
        easyrsa build-client-full $client nopass
        # easyrsa --req-cn=$client build-client-full $client nopass
    fi
    mkdir -p conf/$client
    cp client.conf conf/$client/$client.ovpn
    cat pki/inline/$client.inline >> conf/$client/$client.ovpn
done


