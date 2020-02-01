FROM debian
RUN set -x &&\
    apt update -y &&\
    apt install shadowsocks-libev -y &&\
    cp /usr/bin/ss-redir /ss-redir &&\
    apt-get clean &&\
    apt-get clean all &&\
    rm -rf /var/lib/apt/lists/* 
