#!/bin/bash

#VERSION_bit_bot_http=3.8.0
#URL_bit_bot_http=http://pypi.python.org/packages/source/z/zope.configuration/zope.configuration-$VERSION_bit_bot_http.tar.gz
DEPS_bit_bot_http=(openssl libxml2 hostpython python pyopenssl setuptools zope_component_architecture twisted kivy bit_core bit_bot_common bit_bot_base bit_bot_http)
#MD5_bit_bot_jplates=#8ab837320b4532774c9c89f030d2a389

BUILD_bit_bot_jplates=$BUILD_PATH/bit_bot_jplates
RECIPE_bit_bot_jplates=$RECIPES_PATH/bit_bot_jplates


function prebuild_bit_bot_jplates() {
    if [ $BUILD_bit_bot_jplates ]; then
	try rm -rf $BUILD_bit_bot_jplates
    fi
    try cp -a $SRC_PATH/python/bit.bot.jplates $BUILD_bit_bot_jplates
}

function build_bit_bot_jplates() {
    if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/bit/bot/jplatesXXX" ]; then
	return
    fi
    cd $BUILD_bit_bot_jplates
    push_arm
    export PYTHONPATH=$BUILD_PATH/hostpython/Python-2.7.2/Lib/site-packages
    try $BUILD_PATH/hostpython/Python-2.7.2/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages
    pop_arm
}

function postbuild_bit_bot_jplates() {
	true
}
