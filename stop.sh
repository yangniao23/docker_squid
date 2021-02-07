#!/usr/bin/env bash
set -Ceu
docker stop docker_squid_1
/usr/sbin/iptables -t nat -D PREROUTING -i wlan0 -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 6080
/usr/sbin/iptables -t nat -D PREROUTING -i wlan0 -p tcp -m tcp --dport 443 -j REDIRECT --to-ports 6443
/usr/sbin/iptables -t nat -D OUTPUT -p tcp ! -d 172.16.0.0/24 -o enp0s31f6 --dport 80 -j DNAT --to 127.0.0.1:6080
/usr/sbin/iptables -t nat -D OUTPUT -p tcp ! -d 172.16.0.0/24 -o enp0s31f6 --dport 443 -j DNAT --to 127.0.0.1:6443
