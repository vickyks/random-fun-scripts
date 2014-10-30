#!/bin/bash

# Install ROOT from source
# Written by Vicky Stephens
# run this as superuser
# but remember permissions

user=ARGV[0]

echo "Installing dependencies"
apt-get install subversion dpkg-dev make g++ gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev git

echo "Retrieving source (Note: this will take a long time)"
wget ftp://root.cern.ch/root/root_v5.34.21.source.tar.gz

echo "Unpacking source to $PWD" 
tar -zxvf root_v5.34.21.source.tar.gz

echo "Compiling from source"
cd root
./configure
sudo make
sudo make install

chmod -R 

echo "Adding root source directory to the environment (persistent)"
source $PWD/bin/thisroot.sh
echo "source $PWD/bin/thisroot.sh" >> $HOME/.bashrc"
