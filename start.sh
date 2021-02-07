#!/usr/bin/env bash
set -Ceu
SCRIPT_DIR=$(cd $(dirname $0); pwd)

/usr/sbin/iptables -t nat -A PREROUTING -i wlan0 -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 6080
/usr/sbin/iptables -t nat -A PREROUTING -i wlan0 -p tcp -m tcp --dport 443 -j REDIRECT --to-ports 6443
/usr/sbin/iptables -t nat -A OUTPUT -p tcp ! -d 172.16.0.0/24 -o enp0s31f6 --dport 80 -j DNAT --to 127.0.0.1:6080
/usr/sbin/iptables -t nat -A OUTPUT -p tcp ! -d 172.16.0.0/24 -o enp0s31f6 --dport 443 -j DNAT --to 127.0.0.1:6443
docker run --rm --network=host --name docker_squid_1 \
  -v $SCRIPT_DIR/docker/squid_conf:/squid_conf \
  -v $SCRIPT_DIR/docker/squid_conf/squid:/var/log/squid:rw \
  -v /etc/localtime:/etc/localtime:ro \
  docker_squid || true
