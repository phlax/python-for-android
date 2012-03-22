#!/bin/bash

#VERSION_bit_bot_xmpp=3.8.0
#URL_bit_bot_xmpp=xmpp://pypi.python.org/packages/source/z/zope.configuration/zope.configuration-$VERSION_bit_bot_xmpp.tar.gz
DEPS_bit_bot_xmpp=(openssl libxml2 hostpython python pyopenssl setuptools zope_component_architecture twisted kivy bit_core bit_bot_common bit_bot_base wokkel)
#MD5_bit_bot_xmpp=#8ab837320b4532774c9c89f030d2a389

BUILD_bit_bot_xmpp=$BUILD_PATH/bit_bot_xmpp
RECIPE_bit_bot_xmpp=$RECIPES_PATH/bit_bot_xmpp


function prebuild_bit_bot_xmpp() {
    if [ $BUILD_bit_bot_xmpp ]; then
	try rm -rf $BUILD_bit_bot_xmpp
    fi
    try cp -a $SRC_PATH/python/bit.bot.xmpp $BUILD_bit_bot_xmpp
}

function build_bit_bot_xmpp() {
    if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/bit/bot/xmppXXX" ]; then
	return
    fi
    cd $BUILD_bit_bot_xmpp
    push_arm
    export PYTHONPATH=$BUILD_PATH/hostpython/Python-2.7.2/Lib/site-packages
    try $BUILD_PATH/hostpython/Python-2.7.2/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages
    pop_arm
}

function postbuild_bit_bot_xmpp() {
	true
}
