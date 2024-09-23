#!/bin/bash

set -ex

BASEDIR=$PWD/c_hdf5

mkdir -p $BASEDIR && cd $BASEDIR

# Set the HDF5 version
HDF5_MAJOR=1
HDF5_MINOR=8
HDF5_RELEASE=23
HDF5_VERSION=${HDF5_MAJOR}.${HDF5_MINOR}.${HDF5_RELEASE}
HDF5_URL="https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-${HDF5_MAJOR}.${HDF5_MINOR}/hdf5-$HDF5_VERSION/src/hdf5-$HDF5_VERSION.tar.gz"

mkdir -p build  && cd build

wget -q $HDF5_URL -O - | tar -xvzf - --strip-components 1

./configure --prefix=$BASEDIR --disable-shared
make -j4
make install