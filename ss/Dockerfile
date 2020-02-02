FROM debian
RUN set -x &&\
    apt update -y &&\
    apt install shadowsocks-libev -y &&\
    cp /usr/bin/ss-redir /ss-redir &&\
    apt-get clean &&\
    apt-get clean all &&\
    rm -rf /var/lib/apt/lists/* 

ENV SERVER 127.0.0.1
ENV PORT 4000
ENV LOCAL_ADDRESS 0.0.0.0
ENV LOCAL_PORT 4444
ENV PASSWORD example
ENV TIMEOUT 100
ENV ENCRYPT_METHOD aes-128-cfb
CMD /ss-redir -s $SERVER -p $PORT -b $LOCAL_ADDRESS -l $LOCAL_PORT -k $PASSWORD -t $TIMEOUT -m $ENCRYPT_METHOD


