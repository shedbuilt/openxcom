#!/bin/bash
mkdir -pv build
cd build
cmake -DCMAKE_BUILD_TYPE=Release .. && \
make -j $SHED_NUMJOBS && \
make DESTDIR="$SHED_FAKEROOT" install