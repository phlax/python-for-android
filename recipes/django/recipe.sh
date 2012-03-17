#!/bin/bash

VERSION_django=1.3.1
URL_django=http://pypi.python.org/packages/source/D/Django/Django-$VERSION_django.tar.gz
DEPS_django=(sqlite3 python)
MD5_django=62d8642fd06b9a0bf8544178f8500767
BUILD_django=$BUILD_PATH/django/$(get_directory $URL_django)
RECIPE_django=$RECIPES_PATH/django

function prebuild_django() {
	cd $BUILD_django

	# check marker in our source build
	if [ -f .patched ]; then
		# no patch needed
		return
	fi

	try patch -p1 < $RECIPE_django/patches/pyo-commands.patch

	# everything done, touch the marker !
	touch .patched

}

function build_django() {

	if [ -d "$BUILD_PATH/python-install/lib/python2.7/site-packages/django" ]; then
		return
	fi

	cd $BUILD_django

	push_arm
	# build django for android
        try $BUILD_hostpython/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages
	pop_arm
}

function postbuild_django() {
	true
}
