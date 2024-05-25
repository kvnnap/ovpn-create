#!/bin/sh

iptables -t nat -D POSTROUTING -o eth+ -j MASQUERADE

