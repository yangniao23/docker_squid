#!/usr/bin/env bash
mkdir -p /squid_conf \
&& mkdir -p /usr/local/etc/squid \
&& ln -sf /squid_conf/squid.conf /etc/squid/squid.conf \
&& ln -sf /squid_conf/blacklist /usr/local/etc/squid/blacklist \
&& ln -sf /squid_conf/blacklist_day /usr/local/etc/squid/blacklist_day \

squid --foreground
