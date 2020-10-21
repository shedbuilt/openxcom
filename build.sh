#!/bin/bash
declare -A SHED_PKG_LOCAL_OPTIONS=${SHED_PKG_OPTIONS_ASSOC}
# Configure
if [ -z "${SHED_PKG_LOCAL_OPTIONS[gl]}" ]; then
    # Fix broken no-GL support
    patch -Np1 -i "${SHED_PKG_PATCH_DIR}/remove_duplicate_SDL_opengl_include.patch" &&
    patch -Np1 -i "${SHED_PKG_PATCH_DIR}/openxcom-allow-no-opengl-config.patch" || exit 1
fi
./autogen.sh &&
./configure --prefix=/usr/local \
            --without-docs \
            --without-man \
            --disable-werror &&
make -j $SHED_NUM_JOBS &&
make DESTDIR="$SHED_FAKE_ROOT" install
