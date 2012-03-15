#!/bin/bash

VERSION_zope_thread=3.4
URL_zope_thread=http://pypi.python.org/packages/source/z/zope.thread/zope.thread-$VERSION_zope_thread.tar.gz
DEPS_zope_thread=(setuptools zope_interface)
MD5_zope_thread=3567037865b746c933d4af86e5aefa35
BUILD_zope_thread=$BUILD_PATH/zope_thread/$(get_directory $URL_zope_thread)
RECIPE_zope_thread=$RECIPES_PATH/zope_thread

function prebuild_zope_thread() {
	true
}

function build_zope_thread() {

	if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/zope/thread" ]; then
		return
	fi

	cd $BUILD_zope_thread

	push_arm
	export PYTHONPATH=$BUILD_hostpython/Lib/site-packages
        try $BUILD_hostpython/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages
	pop_arm

}

function postbuild_zope_thread() {
	true
}

