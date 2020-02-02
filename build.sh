
pushd ss
sudo docker build . -t ss --network=host
popd
pushd kcp/
sudo docker build . -t kcp --network=host
popd
