#!/bin/bash
#
# Helper script to unify build logic between different operating systems. Can be
# executed like this from the main directory:
#
#     mc fedora_38 .mc/rebuild.sh
#     mc ubuntu_22.04 .mc/rebuild.sh
set -e

sh autogen.sh
/opt/configure.sh
make clean
make
mkdir -p AppDir
echo "### AppDir ###"
find AppDir -type f 
echo "### ls ###"
ls
echo "###  ###"
/opt/package.sh

