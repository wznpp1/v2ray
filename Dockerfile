FROM ubuntu:latest

RUN apt-get update && apt-get install -y curl unzip && bash <(curl -L -s https://github.com/wznpp1/v2ray/raw/master/get.ubuntu.sh)

CMD ["caddy", "-log /etc/caddy/caddy.log -agree=true -conf=/etc/caddy/Caddyfile"]
