#!/bin/bash

#VERSION_bit_bot_common=3.8.0
#URL_bit_bot_common=http://pypi.python.org/packages/source/z/zope.configuration/zope.configuration-$VERSION_bit_bot_common.tar.gz
DEPS_bit_bot_common=(openssl libxml2 hostpython python pyopenssl setuptools zope_component_architecture twisted kivy bit_core)
#MD5_bit_bot_common=#8ab837320b4532774c9c89f030d2a389

BUILD_bit_bot_common=$BUILD_PATH/bit_bot_common
RECIPE_bit_bot_common=$RECIPES_PATH/bit_bot_common


function prebuild_bit_bot_common() {
    if [ $BUILD_bit_bot_common ]; then
	try rm -rf $BUILD_bit_bot_common
    fi
    try cp -a $SRC_PATH/python/bit.bot.common $BUILD_bit_bot_common
}

function build_bit_bot_common() {
    if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/bit/bot/commonXXX" ]; then
	return
    fi
    cd $BUILD_bit_bot_common
    push_arm
    export PYTHONPATH=$BUILD_PATH/hostpython/Python-2.7.2/Lib/site-packages
    try $BUILD_PATH/hostpython/Python-2.7.2/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages
    pop_arm
}

function postbuild_bit_bot_common() {
	true
}
