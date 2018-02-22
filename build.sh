#!/bin/bash
#This is required to build the stuff

set -eu pipefail

#Add here what kind of dependencies you need in general
apt-get update
apt-get install -y make automake gcc build-essential g++ cpp libc6-dev man-db autoconf pkg-config wget unzip python-pip python-dev python-setuptools
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh -b -p /usr/bin/miniconda
export PATH="/usr/bin/miniconda/bin:$PATH"
#install conda and qiime1
conda config --add channels bioconda
conda create -n qiime1 python=2.7 qiime matplotlib=1.4.3 mock nose

#The actual tool installation should be done in the Singularity file itself to make the entire thing portable! 

#Create mountpoints that we need
mkdir -p /lustre_cfc/

