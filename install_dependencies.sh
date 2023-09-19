#!/bin/bash

set -ex
# Direct Package Dependencies
DEPENDENCIES="libproj-dev"
# Library Dependencies
LIBRARY_DEPENDENCIES="git-all"
apt-get update
apt-get install -y $DEPENDENCIES $LIBRARY_DEPENDENCIES
# TODO
