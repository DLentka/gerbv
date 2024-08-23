#!/bin/bash

set -e
make install
# .mc/package-linux.sh 'Debian 12'

# get linuxdeploy and linuxdeploy-plugin-gtk
wget -c "https://raw.githubusercontent.com/linuxdeploy/linuxdeploy-plugin-gtk/master/linuxdeploy-plugin-gtk.sh"
wget -c "https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage"
# make them executable so that we can call them (and also, plugins called from linuxdeploy are called like binaries)
chmod +x linuxdeploy-x86_64.AppImage linuxdeploy-plugin-gtk.sh

# get list of variables
# ./linuxdeploy-plugin-gtk.sh --help 


# call through linuxdeploy
export APPIMAGE_EXTRACT_AND_RUN=1
export DEPLOY_GTK_VERSION=2
./linuxdeploy-x86_64.AppImage --appdir AppDir --plugin gtk --output appimage --icon-file desktop/gerbv.png --desktop-file desktop/gerbv.desktop

rm linuxdeploy-x86_64.AppImage
mv *.AppImage continous_gerbv