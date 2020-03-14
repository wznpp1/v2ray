FROM ubuntu:latest

RUN apt-get update && apt-get install -y curl unzip && bash <(curl -L -s https://github.com/wznpp1/v2ray/raw/master/get.ubuntu.sh)
COPY run.sh /etc/caddy/run.sh

CMD ["/etc/caddy/run.sh"]
