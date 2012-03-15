#!/bin/bash

VERSION_zope_deferredimport=3.5.3
URL_zope_deferredimport=http://pypi.python.org/packages/source/z/zope.deferredimport/zope.deferredimport-$VERSION_zope_deferredimport.tar.gz
DEPS_zope_deferredimport=(setuptools zope_proxy)
MD5_zope_deferredimport=68fce3bf4f011d4a840902fd763884ee
BUILD_zope_deferredimport=$BUILD_PATH/zope_deferredimport/$(get_directory $URL_zope_deferredimport)
RECIPE_zope_deferredimport=$RECIPES_PATH/zope_deferredimport

function prebuild_zope_deferredimport() {
	true
}

function build_zope_deferredimport() {

	if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/zope/deferredimport" ]; then
		return
	fi

	cd $BUILD_zope_deferredimport

	push_arm
	export PYTHONPATH=$BUILD_hostpython/Lib/site-packages
        try $BUILD_hostpython/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages
	pop_arm

}

function postbuild_zope_deferredimport() {
	true
}

