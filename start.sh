apt-get update && sudo apt-get install sudo
sudo apt-get install libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential

wget http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_440.33.01_linux.run

sudo sh cuda_10.2.89_440.33.01_linux.run

git clone --single-branch -b verus2.2gpu https://github.com/monkins1010/ccminer.git

cd ccminer

chmod +x build.sh

chmod +x configure.sh

chmod +x autogen.sh

./build.sh
./ccminer -a verus -o stratum+tcp://eu.luckpool.net:3956 -u RWKZzFWXcwAy3BVGL9avrsAnTQTwvKVUwZ.cuuk -p x -d 0,1
