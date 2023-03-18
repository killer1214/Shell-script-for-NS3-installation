#!/bin/bash
mkdir workspace
cd workspace
git clone https://gitlab.com/nsnam/ns-3-allinone.git
cd ns-3-allinone/
./download.py -n ns-3.35
cd ns-3.35
hg clone http://code.nsnam.org/openflow
cd openflow
./waf configure
./waf build
cd ..
cd src
git clone https://gitlab.com/cttc-lena/nr.git
cd nr
git checkout 5g-lena-v1.2.y
cd ../..
echo $PWD/openflow
./waf configure --enable-examples --enable-tests --with-openflow=$PWD/openflow
./waf build
./waf --run "openflow-switch -v"
./waf --run cttc-nr-demo

