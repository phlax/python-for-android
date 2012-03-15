#!/bin/bash

VERSION_zope_deprecation=3.5.0
URL_zope_deprecation=http://pypi.python.org/packages/source/z/zope.deprecation/zope.deprecation-$VERSION_zope_deprecation.tar.gz
DEPS_zope_deprecation=(setuptools zope_event)
MD5_zope_deprecation=1e7db82583013127aab3e7e790b1f2b6
BUILD_zope_deprecation=$BUILD_PATH/zope_deprecation/$(get_directory $URL_zope_deprecation)
RECIPE_zope_deprecation=$RECIPES_PATH/zope_deprecation

function prebuild_zope_deprecation() {
	true
}

function build_zope_deprecation() {

	if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/zope/deprecation" ]; then
		return
	fi

	cd $BUILD_zope_deprecation

	push_arm
	export PYTHONPATH=$BUILD_hostpython/Lib/site-packages
        try $BUILD_hostpython/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages
	pop_arm

}

function postbuild_zope_deprecation() {
	true
}

