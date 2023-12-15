FROM golang as v2ray_build
RUN set -x &&\
    cd / &&\
    git clone https://github.com/shadowsocks/v2ray-plugin.git &&\
    cd /v2ray-plugin &&\
    go build

FROM debian
RUN set -x \
    && apt-get update \
    && apt-get install --no-install-recommends -y shadowsocks-libev curl procps \
    && cd /root/ \
    && apt-get clean \
    && apt-get clean all \
    && rm -rf /var/lib/apt/lists/*
RUN cp /usr/bin/ss-redir /ss-redir
RUN cp /usr/bin/ss-server /ss-server
COPY --from=v2ray_build /v2ray-plugin/v2ray-plugin /v2ray-plugin


ENV SERVER 127.0.0.1
ENV PORT 4000
ENV LOCAL_ADDRESS 0.0.0.0
ENV LOCAL_PORT 4444
ENV PASSWORD example
ENV TIMEOUT 100
ENV ENCRYPT_METHOD aes-128-cfb

WORKDIR /
