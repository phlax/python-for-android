#!/bin/bash

#VERSION_bit_aiml_base=3.8.0
#URL_bit_aiml_base=http://pypi.python.org/packages/source/z/zope.configuration/zope.configuration-$VERSION_bit_aiml_async.tar.gz
DEPS_bit_aiml_async=(bit_core)
#MD5_bit_aiml_async=#8ab837320b4532774c9c89f030d2a389

BUILD_bit_aiml_async=$BUILD_PATH/bit_aiml_async
RECIPE_bit_aiml_async=$RECIPES_PATH/bit_aiml_async


function prebuild_bit_aiml_async() {
    if [ $BUILD_bit_aiml_async ]; then
	try rm -rf $BUILD_bit_aiml_async
    fi
    try cp -a $SRC_PATH/python/bit.aiml.async $BUILD_bit_aiml_async
}

function build_bit_aiml_async() {
    if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/bit/aiml/asyncXXX" ]; then
	return
    fi
    cd $BUILD_bit_aiml_async
    push_arm
    export PYTHONPATH=$BUILD_PATH/hostpython/Python-2.7.2/Lib/site-packages
    try $BUILD_PATH/hostpython/Python-2.7.2/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages
    pop_arm
}

function postbuild_bit_aiml_async() {
	true
}
