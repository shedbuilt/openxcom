#!/bin/bash
./autogen.sh &&
./configure --prefix=/usr/local \
            --without-docs \
            --without-man \
            --with-gl=no &&
# Fix broken no-GL support
sed -i "/^DEFS = / s/\$/ -D__NO_OPENGL/" Makefile &&
patch -Np1 -i "${SHED_PKG_PATCH_DIR}/remove_duplicate_SDL_opengl_include.patch" &&
make -j $SHED_NUM_JOBS &&
make DESTDIR="$SHED_FAKE_ROOT" install