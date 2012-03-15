#!/bin/bash

VERSION_zope_proxy=3.5.0
URL_zope_proxy=http://pypi.python.org/packages/source/z/zope.proxy/zope.proxy-$VERSION_zope_proxy.tar.gz
DEPS_zope_proxy=(setuptools zope_interface)
MD5_zope_proxy=ac5fc916b572bc3ff630b49cda52d94a
BUILD_zope_proxy=$BUILD_PATH/zope_proxy/$(get_directory $URL_zope_proxy)
RECIPE_zope_proxy=$RECIPES_PATH/zope_proxy

function prebuild_zope_proxy() {
	true
}

function build_zope_proxy() {

	if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/zope/proxy" ]; then
		return
	fi

	cd $BUILD_zope_proxy

	push_arm

	export LDFLAGS="$LDFLAGS -L$LIBS_PATH"
	export LDSHARED="$LIBLINK"
	export PYTHONPATH=$BUILD_hostpython/Lib/site-packages

	try $BUILD_PATH/python-install/bin/python.host setup.py build_ext -v
	try find build/lib.* -name "*.o" -exec $STRIP {} \;

        try $BUILD_hostpython/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages

	pop_arm

}

function postbuild_zope_proxy() {
	true
}

