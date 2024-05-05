FROM golang:1.21.0-alpine3.18 as builder
ENV GO111MODULE=on
RUN apk add git
RUN git clone https://github.com/xtaci/kcptun.git
RUN cd kcptun && \
    go build -mod=vendor -ldflags "-X main.VERSION=$(date -u +%Y%m%d) -s -w" -o /client github.com/xtaci/kcptun/client && \
    go build -mod=vendor -ldflags "-X main.VERSION=$(date -u +%Y%m%d) -s -w" -o /server github.com/xtaci/kcptun/server

FROM alpine:3.18
RUN apk add --no-cache iptables
COPY --from=builder /client /bin/kcp_client
COPY --from=builder /server /bin/kcp_server

# ENTRYPOINT [ "kcp_client", "-c", "/etc/config/kcp.json" ]
#FROM debian
#RUN set -x &&\
#    apt update -y &&\
#    apt install wget -y &&\
#    wget https://github.com/xtaci/kcptun/releases/download/v20231012/kcptun-linux-amd64-20231012.tar.gz &&\
#    tar zxvf kcptun-linux-amd64-20231012.tar.gz &&\
#    ln -s /client_linux_amd64 /usr/bin/kcp &&\
#    apt-get clean &&\
#    apt-get clean all &&\
#    rm -rf /var/lib/apt/lists/*

# ENV LOCAL 127.0.0.1:4000
# ENV SERVER 1.1.1.1:4000
# ENV KCP_PARAMETERS --crypt aes-256 --key example --sndwnd 64 --rcvwnd 1024 --mtu 1300 --conn 2 --mode fast2
# CMD kcp  -l $LOCAL -r $SERVER  $KCP_PARAMETERS
