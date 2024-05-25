FROM alpine
LABEL authors="Kevin Napoli kvnnap@gmail.com"

RUN apk --no-cache add openvpn

VOLUME /root/server
WORKDIR /root/server
ENTRYPOINT ["openvpn", "server.ovpn"]
