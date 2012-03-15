#!/bin/bash

VERSION_zope_location=3.9.1
URL_zope_location=http://pypi.python.org/packages/source/z/zope.location/zope.location-$VERSION_zope_location.tar.gz
DEPS_zope_location=(setuptools zope_interface)
MD5_zope_location=1684a8f986099d15296f670c58e713d8
BUILD_zope_location=$BUILD_PATH/zope_location/$(get_directory $URL_zope_location)
RECIPE_zope_location=$RECIPES_PATH/zope_location

function prebuild_zope_location() {
	true
}

function build_zope_location() {

	if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/zope/location" ]; then
		return
	fi

	cd $BUILD_zope_location

	push_arm
	export PYTHONPATH=$BUILD_hostpython/Lib/site-packages
        try $BUILD_hostpython/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages
	pop_arm

}

function postbuild_zope_location() {
	true
}

