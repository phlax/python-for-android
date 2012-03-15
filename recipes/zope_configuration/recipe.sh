#!/bin/bash

VERSION_zope_configuration=3.8.0
URL_zope_configuration=http://pypi.python.org/packages/source/z/zope.configuration/zope.configuration-$VERSION_zope_configuration.tar.gz
DEPS_zope_configuration=(setuptools zope_interface zope_i18nmessageid zope_schema)
MD5_zope_configuration=4f8718661ef5c7a34a77f7701e878ce8
BUILD_zope_configuration=$BUILD_PATH/zope_configuration/$(get_directory $URL_zope_configuration)
RECIPE_zope_configuration=$RECIPES_PATH/zope_configuration

function prebuild_zope_configuration() {
	true
}

function build_zope_configuration() {

	if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/zope/configuration" ]; then
		return
	fi

	cd $BUILD_zope_configuration
	push_arm
	export PYTHONPATH=$BUILD_hostpython/Lib/site-packages
        try $BUILD_hostpython/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages
	pop_arm
}

function postbuild_zope_configuration() {
	true
}

