#!/bin/sh

clients="test1 test2"
cn="kvnnap"

# Generate pki
easyrsa init-pki
easyrsa --req-cn=$cn build-ca nopass
easyrsa gen-dh
easyrsa build-server-full server nopass

# Iterate over the array
for client in $clients; do
    easyrsa build-client-full $client nopass
    # easyrsa --req-cn=$client build-client-full $client nopass
    mkdir -p conf/$client
    cp client.conf conf/$client/$client.ovpn
    cat pki/inline/$client.inline >> conf/$client/$client.ovpn
done

# Move server dir
mkdir -p conf/server
cp server.conf up.sh down.sh pki/ca.crt pki/dh.pem pki/issued/server.crt pki/private/server.key conf/server
mv conf/server/server.conf conf/server/server.ovpn
