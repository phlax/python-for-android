#!/bin/bash

#VERSION_bit_bot_base=3.8.0
#URL_bit_bot_base=http://pypi.python.org/packages/source/z/zope.configuration/zope.configuration-$VERSION_bit_bot_aiml.tar.gz
DEPS_bit_bot_aiml=(openssl libxml2 hostpython python pyopenssl setuptools zope_component_architecture twisted kivy bit_core bit_bot_common bit_bot_base bit_bot_platform bit_aiml_async)
#MD5_bit_bot_aiml=#8ab837320b4532774c9c89f030d2a389

BUILD_bit_bot_aiml=$BUILD_PATH/bit_bot_aiml
RECIPE_bit_bot_aiml=$RECIPES_PATH/bit_bot_aiml


function prebuild_bit_bot_aiml() {
    if [ $BUILD_bit_bot_aiml ]; then
	try rm -rf $BUILD_bit_bot_aiml
    fi
    try cp -a $SRC_PATH/python/bit.bot.aiml $BUILD_bit_bot_aiml
}

function build_bit_bot_aiml() {
    if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/bit/bot/aimlXXX" ]; then
	return
    fi
    cd $BUILD_bit_bot_aiml
    push_arm
    export PYTHONPATH=$BUILD_PATH/hostpython/Python-2.7.2/Lib/site-packages
    try $BUILD_PATH/hostpython/Python-2.7.2/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages
    pop_arm
}

function postbuild_bit_bot_aiml() {
	true
}
