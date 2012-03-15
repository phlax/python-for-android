#!/bin/bash

VERSION_zope_testing=3.10.3
URL_zope_testing=http://pypi.python.org/packages/source/z/zope.testing/zope.testing-$VERSION_zope_testing.tar.gz
DEPS_zope_testing=(setuptools zope_interface)
MD5_zope_testing=d9d6055c0a017271bcc3938c18ea23e8
BUILD_zope_testing=$BUILD_PATH/zope_testing/$(get_directory $URL_zope_testing)
RECIPE_zope_testing=$RECIPES_PATH/zope_testing

function prebuild_zope_testing() {
	true
}

function build_zope_testing() {

	if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/zope/testing" ]; then
		return
	fi

	cd $BUILD_zope_testing

	push_arm
	export PYTHONPATH=$BUILD_hostpython/Lib/site-packages
        try $BUILD_hostpython/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages
	pop_arm

}

function postbuild_zope_testing() {
	true
}

