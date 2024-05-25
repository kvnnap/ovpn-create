# Dev container

FROM alpine
LABEL authors="Kevin Napoli kvnnap@gmail.com"

ARG MYUSER=alpine
ARG HOME=/home/$MYUSER

RUN apk --no-cache add sudo easy-rsa git openssh-client \
 && adduser --disabled-password $MYUSER \
 && echo $MYUSER ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$MYUSER \
 && chmod 0440 /etc/sudoers.d/$MYUSER

ENV PATH="${PATH}:/usr/share/easy-rsa"

USER $MYUSER
WORKDIR $HOME
