#!/bin/bash

DEPS_zope_component_architecture=(setuptools zope_component zope_configuration zope_deferredimport zope_thread zope_testing zope_exceptions zope_deprecation zope_security zope_dottedname)
RECIPE_zope_component_architecture=$RECIPES_PATH/zope_component_architecture

function prebuild_zope_component_architecture() {
	true
}

function build_zope_component_architecture() {
    true
}

function postbuild_zope_component_architecture() {
	true
}
