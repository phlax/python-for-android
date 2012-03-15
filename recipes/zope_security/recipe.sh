#!/bin/bash

VERSION_zope_security=3.8.3
URL_zope_security=http://pypi.python.org/packages/source/z/zope.security/zope.security-$VERSION_zope_security.tar.gz
DEPS_zope_security=(setuptools zope_interface)
MD5_zope_security=0b4f0bec812ddd84e9e4ef427dadb889
BUILD_zope_security=$BUILD_PATH/zope_security/$(get_directory $URL_zope_security)
RECIPE_zope_security=$RECIPES_PATH/zope_security

function prebuild_zope_security() {
	true
}

function build_zope_security() {

	if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/zope/security" ]; then
		return
	fi

	cd $BUILD_zope_security

	push_arm

	export LDFLAGS="$LDFLAGS -L$LIBS_PATH"
	export LDSHARED="$LIBLINK"
	export PYTHONPATH=$BUILD_hostpython/Lib/site-packages

	try $BUILD_PATH/python-install/bin/python.host setup.py build_ext -v
	try find build/lib.* -name "*.o" -exec $STRIP {} \;

        try $BUILD_hostpython/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages

	unset LDSHARED

	pop_arm

}

function postbuild_zope_security() {
	true
}

