#!/bin/bash

apt-get update
apt-get install -y curl unzip

#v2ray
bash <(curl -L -s https://install.direct/go.sh)
curl https://getcaddy.com | bash -s personal
