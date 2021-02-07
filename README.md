# Docker_squid

## How to use ~in Linux~

1. squid.confを編集する

   PROXY_SERVERを接続したいプロキシサーバのFQDNに，
   PROXY_PORTはポート名に，
   PROXY_USERはユーザ名に，
   PROXY_PASSはURパーセントエンコードされた状態のパスワードに置換する．

2. dockerを動かす

```bash
$ sudo docker build \
  --build-arg http_proxy=http://USERNAME:PASSWORD@HOSTNAME:PORT \
  --network=host .
$ sudo ln -sf $(pwd)/docker_squid.service /etc/systemd/system/docker_squid.service
$ sudo systemctl daemon-reload
$ sudo systemctl enable --now docker_squid.service
```

 