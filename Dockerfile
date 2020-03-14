FROM ubuntu:latest

RUN apt-get update && apt-get install -y curl unzip && bash <(curl -L -s https://install.direct/go.sh) && curl https://getcaddy.com | bash -s personal

COPY run.sh /etc/caddy/run.sh

CMD ["bash","/etc/caddy/run.sh"]
