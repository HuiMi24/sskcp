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
