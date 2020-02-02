FROM debian
RUN set -x &&\
    apt update -y &&\
    apt install wget -y &&\
    wget https://github.com/xtaci/kcptun/releases/download/v20200103/kcptun-linux-amd64-20200103.tar.gz &&\
    tar zxvf kcptun-linux-amd64-20200103.tar.gz &&\
    ln -s /client_linux_amd64 /usr/bin/kcp &&\
    apt-get clean &&\
    apt-get clean all &&\
    rm -rf /var/lib/apt/lists/* 

ENV LOCAL 127.0.0.1:4000
ENV SERVER 1.1.1.1:4000
ENV KCP_PARAMETERS --crypt aes-256 --key example --sndwnd 64 --rcvwnd 1024 --mtu 1300 --conn 2 --mode fast2
CMD kcp  -l $LOCAL -r $SERVER  $KCP_PARAMETERS
