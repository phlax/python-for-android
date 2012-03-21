#!/bin/bash

#VERSION_bit_bot_platform=3.8.0
#URL_bit_bot_platform=http://pypi.python.org/packages/source/z/zope.configuration/zope.configuration-$VERSION_bit_bot_platform.tar.gz
DEPS_bit_bot_common=(openssl libxml2 hostpython python pyopenssl setuptools zope_component_architecture twisted kivy bit_core bit_bot_common bit_bot_base)
#MD5_bit_bot_platform=#8ab837320b4532774c9c89f030d2a389

BUILD_bit_bot_platform=$BUILD_PATH/bit_bot_platform
RECIPE_bit_bot_platform=$RECIPES_PATH/bit_bot_platform


function prebuild_bit_bot_platform() {
    if [ $BUILD_bit_bot_platform ]; then
	try rm -rf $BUILD_bit_bot_platform
    fi
    try cp -a $SRC_PATH/python/bit.bot.platform $BUILD_bit_bot_platform
}

function build_bit_bot_platform() {
    if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/bit/bot/platformXXX" ]; then
	return
    fi
    cd $BUILD_bit_bot_platform
    push_arm
    export PYTHONPATH=$BUILD_PATH/hostpython/Python-2.7.2/Lib/site-packages
    try $BUILD_PATH/hostpython/Python-2.7.2/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages
    pop_arm
}

function postbuild_bit_bot_platform() {
	true
}
