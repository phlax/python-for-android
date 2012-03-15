#!/bin/bash

VERSION_zope_event=3.5.1
URL_zope_event=http://pypi.python.org/packages/source/z/zope.event/zope.event-$VERSION_zope_event.tar.gz
DEPS_zope_event=(setuptools zope_interface)
MD5_zope_event=f18363bf9926f1762fa580cc69bd97ec
BUILD_zope_event=$BUILD_PATH/zope_event/$(get_directory $URL_zope_event)
RECIPE_zope_event=$RECIPES_PATH/zope_event

function prebuild_zope_event() {
	true
}

function build_zope_event() {

	if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/zope/event" ]; then
		return
	fi

	cd $BUILD_zope_event

	push_arm
	export PYTHONPATH=$BUILD_hostpython/Lib/site-packages
        try $BUILD_hostpython/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages
	pop_arm

}

function postbuild_zope_event() {
	true
}

