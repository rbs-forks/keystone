#!/bin/bash

mkdir build
cd build
../make-share.sh
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -G "Unix Makefiles" ..
make -j40
make install
echo "include /usr/local/lib" >> /etc/ld.so.conf
# Newer branches seem to add x86_64-linux-gnu. cp for backwards compatibility
cp -r /usr/local/lib/x86_64-linux-gnu/* /usr/local/lib/
ldconfig
cd ../bindings/python
make install
make install3
