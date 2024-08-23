#!/bin/bash

set -e
INSTALL_DIR=$(readlink -f ./AppDir)
./configure					\
	--disable-debug				\
	--enable-dxf				\
	--disable-update-desktop-database	\
	--prefix="${INSTALL_DIR}" 	\
