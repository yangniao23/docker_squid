FROM centos:8
ARG http_proxy
RUN dnf -y update \
&& dnf -y install squid \
&& dnf clean all
RUN mkdir -p /usr/local/share/squid \
&& cd /usr/local/share/squid \
&& openssl req -x509 -sha256 -nodes -days 3650 -newkey rsa:2048 -subj /CN=localhost -keyout server.key -out server.crt # From https://www.karakaram.com/creating-self-signed-certificate/
RUN /usr/lib64/squid/security_file_certgen -c -s /var/spool/squid/ssl_db -M 4MB
RUN mkdir -p /squid_conf \
&& mkdir -p /usr/local/etc/squid \
&& ln -sf /squid_conf/squid.conf /etc/squid/squid.conf \
&& ln -sf /squid_conf/blacklist /usr/local/etc/squid/blacklist \
&& ln -sf /squid_conf/blacklist_day /usr/local/etc/squid/blacklist_day
COPY ./init.sh /init.sh
EXPOSE 6080 6443 3354
CMD ["/init.sh"]
