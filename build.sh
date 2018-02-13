#!/bin/bash
./configure --prefix=/usr/local \
            --without-docs \
            --without-man \
            --with-gl=no && \
# Fix broken no-GL support
sed -i "/^DEFS = / s/\$/ -D__NO_OPENGL/" Makefile && \
make -j $SHED_NUMJOBS && \
make DESTDIR="$SHED_FAKEROOT" install