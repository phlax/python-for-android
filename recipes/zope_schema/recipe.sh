#!/bin/bash

VERSION_zope_schema=3.5.1
URL_zope_schema=http://pypi.python.org/packages/source/z/zope.schema/zope.schema-$VERSION_zope_schema.tar.gz
DEPS_zope_schema=(setuptools zope_interface zope_i18nmessageid zope_event)
MD5_zope_schema=91e5f6f977746dc692049658649d9e47
BUILD_zope_schema=$BUILD_PATH/zope_schema/$(get_directory $URL_zope_schema)
RECIPE_zope_schema=$RECIPES_PATH/zope_schema

function prebuild_zope_schema() {
	true
}

function build_zope_schema() {

	if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/zope/schema" ]; then
		return
	fi

	cd $BUILD_zope_schema

	push_arm
	export PYTHONPATH=$BUILD_hostpython/Lib/site-packages
        try $BUILD_hostpython/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages
	pop_arm

}

function postbuild_zope_schema() {
	true
}

