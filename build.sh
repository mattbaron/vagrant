#!/bin/bash

INSTALL_ROOT=/opt/mbaron-foobar

echo "`date` Starting build"
cd /vagrant/build

tar xf ruby-2.7.5.tar.gz
cd ruby-2.7.5

./configure --prefix $INSTALL_ROOT \
    --with-out-ext=dbm,readline \
    --enable-shared
    --disable-install-doc
    --without-gmp \
    --without-gdbm \
    --without-tk \
    --disable-dtrace \
    --disable-jit-support

/bin/rm -rf $INSTALL_ROOT

make
make install

cd $INSTALL_ROOT
bin/ruby --version