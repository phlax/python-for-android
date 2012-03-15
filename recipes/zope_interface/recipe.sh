#!/bin/bash

VERSION_zope_interface=3.8.0
URL_zope_interface=http://pypi.python.org/packages/source/z/zope.interface/zope.interface-$VERSION_zope_interface.tar.gz
DEPS_zope_interface=(python)
MD5_zope_interface=8ab837320b4532774c9c89f030d2a389
BUILD_zope_interface=$BUILD_PATH/zope_interface/$(get_directory $URL_zope_interface)
RECIPE_zope_interface=$RECIPES_PATH/zope_interface

function prebuild_zope_interface() {
	true
}

function build_zope_interface() {

	if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/zope/interface" ]; then
		return
	fi

	cd $BUILD_zope_interface

	push_arm

	export LDFLAGS="$LDFLAGS -L$LIBS_PATH"
	export LDSHARED="$LIBLINK"
	export PYTHONPATH=$BUILD_hostpython/Lib/site-packages

	try $BUILD_PATH/python-install/bin/python.host setup.py build_ext -v
	try find build/lib.* -name "*.o" -exec $STRIP {} \;

        try $BUILD_hostpython/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages

	try rm -rf $BUILD_PATH/python-install/lib/python*/site-packages/zope/interface/interface/tests
	try rm -rf $BUILD_PATH/python-install/lib/python*/site-packages/zope/interface/interface/*.txt

	unset LDSHARED

	pop_arm
}

function postbuild_zope_interface() {
	true
}

