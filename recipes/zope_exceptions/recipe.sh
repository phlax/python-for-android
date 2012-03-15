#!/bin/bash

VERSION_zope_exceptions=3.6.0
URL_zope_exceptions=http://pypi.python.org/packages/source/z/zope.exceptions/zope.exceptions-$VERSION_zope_exceptions.tar.gz
DEPS_zope_exceptions=(setuptools zope_interface)
MD5_zope_exceptions=491779b577a49f547982ff39b3903b1a
BUILD_zope_exceptions=$BUILD_PATH/zope_exceptions/$(get_directory $URL_zope_exceptions)
RECIPE_zope_exceptions=$RECIPES_PATH/zope_exceptions

function prebuild_zope_exceptions() {
	true
}

function build_zope_exceptions() {

	if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/zope/exceptions" ]; then
		return
	fi

	cd $BUILD_zope_exceptions

	push_arm
	export PYTHONPATH=$BUILD_hostpython/Lib/site-packages
        try $BUILD_hostpython/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages
	pop_arm

}

function postbuild_zope_exceptions() {
	true
}

