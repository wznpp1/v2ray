FROM alpine:latest

RUN apk add nodejs npm
RUN npm install -g whistle whistle.script

CMD ["whistle","run -p 8891 -n wznpp1 -w wznpp1"]

