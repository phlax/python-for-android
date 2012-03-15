#!/bin/bash

VERSION_zope_i18nmessageid=3.6.1
URL_zope_i18nmessageid=http://pypi.python.org/packages/source/z/zope.i18nmessageid/zope.i18nmessageid-$VERSION_zope_i18nmessageid.tar.gz
DEPS_zope_i18nmessageid=(setuptools zope_interface)
MD5_zope_i18nmessageid=6716cd769c006b5e90af030f83592600
BUILD_zope_i18nmessageid=$BUILD_PATH/zope_i18nmessageid/$(get_directory $URL_zope_i18nmessageid)
RECIPE_zope_i18nmessageid=$RECIPES_PATH/zope_i18nmessageid

function prebuild_zope_i18nmessageid() {
	true
}

function build_zope_i18nmessageid() {

	if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/zope/i18nmessageid" ]; then
		return
	fi

	cd $BUILD_zope_i18nmessageid
	push_arm

	try $BUILD_PATH/python-install/bin/python.host setup.py build_ext -v
	try find build/lib.* -name "*.o" -exec $STRIP {} \;
	export PYTHONPATH=$BUILD_hostpython/Lib/site-packages

        try $BUILD_hostpython/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages
	pop_arm
}

function postbuild_zope_i18nmessageid() {
	true
}
