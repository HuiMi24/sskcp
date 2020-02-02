1. copy docker-compose.yml.example to docker-compose.yml
  `cp docker-compose.yml.example docker-compose.yml`
2. change the docker-compose.yml
  ```
  version: '3.4'
services:
  ss:
    image: ss
    container_name: ss
    network_mode: host
    restart: always
    environment:
      - SERVER=127.0.0.1
      - PORT=2000
      - LOCAL_ADDRESS=0.0.0.0
      - LOCAL_PORT=12345
      - PASSWORD=example
      - TIMEOUT=100
      - ENCRYPT_METHOD=aes-128-cfb

  kcp:
    image: kcp
    container_name: kcp
    network_mode: host
    restart: always
    environment:
      - LOCAL=127.0.0.1:2000
      - SERVER=<server ip>:<server port>
      - KCP_PARAMETERS=--crypt aes-255 --key example --sndwnd 64 --rcvwnd 1024 --mtu 1000 --conn 2 --mode fast
```
3. build docker image
  `sudo ./build.sh`
  
4. start container
  `sudo ./start.sh`
