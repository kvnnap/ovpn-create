#!/bin/sh

iptables -t nat -A POSTROUTING -o eth+ -j MASQUERADE

