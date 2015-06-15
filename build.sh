#!/bin/sh
set -x

tar xfz zeromq-4.1.0-rc1.tar.gz
cd zeromq-4.1.0
./configure
make
make check
sudo make install
cd ..

mkdir czmq-master-ff0d028b16
cd czmq-master-ff0d028b16
unzip ../czmq-master-ff0d028b16.zip
patch -p 1 < ../beacon.patch
rm CMakeCache.txt
cmake . 
make
make test
sudo make install
cd ..

mkdir zyre-master-9d7e62d2c9
cd zyre-master-9d7e62d2c9
unzip ../zyre-master-9d7e62d2c9.zip
rm CMakeCache.txt
cmake .
make
# Hangs...
#make test
sudo make install
cd ..

