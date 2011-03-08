#!/bin/sh

set -x
glib-gettextize --copy --force
libtoolize --copy --automake
intltoolize --copy --force --automake

aclocal -Im4
autoconf
autoheader
automake --copy --add-missing --foreign
./configure "$@"
./autovapi.sh
