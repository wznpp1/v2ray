#!/bin/bash

my_ip=$(curl icanhazip.com)

mkdir -p /etc/caddy/
mkdir -p /etc/v2ray/

cat >/etc/caddy/Caddyfile <<-EOF
$my_ip.sslip.io {
    tls wznpp1@hotmail.com
    gzip
    timeouts none
	
	on startup /usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json
	on shutdown killall -s 9 v2ray


    proxy / https://liyafly.com {
        except /0af62fc3
    }
	
    proxy /0af62fc3 127.0.0.1:9006 {
        websocket
		header_upstream -Origin
    }
}
EOF

cat >/etc/v2ray/config.json <<-EOF
{
	"log": {},
	"inbounds": [
		{
			"port": 9006,
			"protocol": "vmess",
			"settings": {
				"clients": [
					{
						"id": "1ec4947b-50a7-4661-b833-ce504b85da99",
						"alterId": 4
					}
				]
			},
			"streamSettings": {
				"network": "ws",
				"security": "none",
				"wsSettings": {
					"path": "/0af62fc3"
				},
				"sockopt": {
					"tcpFastOpen": true
				}
			}
		}
	],
	"outbounds": [
		{
			"protocol": "freedom",
			"settings": {}
		}
	]
}
EOF

/usr/local/bin/caddy -log /etc/caddy/caddy.log -agree=true -conf=/etc/caddy/Caddyfile
