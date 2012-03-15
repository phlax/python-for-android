#!/bin/bash

VERSION_zope_dottedname=3.4.6
URL_zope_dottedname=http://pypi.python.org/packages/source/z/zope.dottedname/zope.dottedname-$VERSION_zope_dottedname.tar.gz
DEPS_zope_dottedname=(setuptools zope_interface)
MD5_zope_dottedname=62d639f75b31d2d864fe5982cb23959c
BUILD_zope_dottedname=$BUILD_PATH/zope_dottedname/$(get_directory $URL_zope_dottedname)
RECIPE_zope_dottedname=$RECIPES_PATH/zope_dottedname

function prebuild_zope_dottedname() {
	true
}

function build_zope_dottedname() {

	if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/zope/dottedname" ]; then
		return
	fi

	cd $BUILD_zope_dottedname

	push_arm
	export PYTHONPATH=$BUILD_hostpython/Lib/site-packages
        try $BUILD_hostpython/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages
	pop_arm

}

function postbuild_zope_dottedname() {
	true
}

