#!/usr/bin/env bash
mkdir -p /squid_conf \
&& mkdir -p /usr/local/etc/squid \
&& ln -sf /squid_conf/squid.conf /etc/squid/squid.conf \

squid --foreground
