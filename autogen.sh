#!/bin/sh

set -x
glib-gettextize --copy --force
libtoolize --copy --automake
intltoolize --copy --force --automake

aclocal-1.10 -Im4
autoconf
autoheader
automake-1.10 --copy --add-missing --foreign
debian/rules config.status
./autovapi.sh
