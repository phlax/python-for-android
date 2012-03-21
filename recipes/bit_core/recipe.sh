#!/bin/bash

#VERSION_bit_core=3.8.0
#URL_bit_core=http://pypi.python.org/packages/source/z/zope.configuration/zope.configuration-$VERSION_bit_core.tar.gz
DEPS_bit_core=(openssl libxml2 hostpython python pyopenssl setuptools zope_component_architecture twisted)
#MD5_bit_core=#8ab837320b4532774c9c89f030d2a389

BUILD_bit_core=$BUILD_PATH/bit_core
RECIPE_bit_core=$RECIPES_PATH/bit_core


function prebuild_bit_core() {
    if [ $BUILD_bit_core ]; then
	try rm -rf $BUILD_bit_core
    fi
    try cp -a $SRC_PATH/python/bit.core $BUILD_bit_core
}

function build_bit_core() {
    if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/bit/coreXXX" ]; then
	return
    fi
    cd $BUILD_bit_core
    push_arm
    export PYTHONPATH=$BUILD_PATH/hostpython/Python-2.7.2/Lib/site-packages
    try $BUILD_PATH/hostpython/Python-2.7.2/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages
    pop_arm
}

function postbuild_bit_core() {
	true
}
