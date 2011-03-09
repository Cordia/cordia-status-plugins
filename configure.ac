dnl Process this file with autoconf to produce a configure script.

AC_INIT(src/status-area-applet-clock.vala)
AC_CONFIG_HEADERS([config.h])

PACKAGE=cordia-clock-plugin
VERSION=0.0.1

AM_INIT_AUTOMAKE($PACKAGE, $VERSION)

AC_PROG_CC
AM_PROG_VALAC([0.8.0])
AC_STDC_HEADERS
AC_PROG_INSTALL
AC_PROG_LIBTOOL

CFLAGS="$CFLAGS -Wall -Wmissing-prototypes -Wmissing-declarations"

PKG_CHECK_MODULES(GCONF, gconf-2.0 >= 2.16.0)
AC_SUBST(GCONF_LIBS)
AC_SUBST(GCONF_CFLAGS)

PKG_CHECK_MODULES(HD, libhildondesktop-1 >= 2.1.31)
AC_SUBST(HD_LIBS)
AC_SUBST(HD_CFLAGS)

PKG_CHECK_MODULES(OSSO, libosso >= 2.20)
AC_SUBST(OSSO_LIBS)
AC_SUBST(OSSO_CFLAGS)

PKG_CHECK_MODULES(DBUS, dbus-glib-1 >= 0.78)
AC_SUBST(DBUS_LIBS)
AC_SUBST(DBUS_CFLAGS)

PKG_CHECK_MODULES(OSSOSETTINGS, osso-af-settings >= 0.9.2)

localedir=`$PKG_CONFIG osso-af-settings --variable=localedir`
icon48dir=`$PKG_CONFIG libhildondesktop-1 --variable=prefix`/share/icons/hicolor/48x48/hildon
icon18dir=`$PKG_CONFIG libhildondesktop-1 --variable=prefix`/share/icons/hicolor/18x18/hildon
hildondesktoplibdir=`$PKG_CONFIG libhildondesktop-1 --variable=hildondesktoplibdir`
hildonstatusmenudesktopentrydir=`$PKG_CONFIG libhildondesktop-1 --variable=hildonstatusmenudesktopentrydir`

vapidir=`$PKG_CONFIG vala-0.10 --variable=vapidir`

# Localization-related
AC_PROG_INTLTOOL([0.40.5])
GETTEXT_PACKAGE=status-area-clock
AC_SUBST(GETTEXT_PACKAGE)
AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE, "$GETTEXT_PACKAGE", [Name of gettext package])
ALL_LINGUAS="pl"
AM_GLIB_GNU_GETTEXT
AC_SUBST(ALL_LINGUAS)
AC_SUBST(localedir)
AC_DEFINE_UNQUOTED(LOCALEDIR, "$localedir", [localedir])

AC_SUBST(icon48dir)
AC_SUBST(icon18dir)
AC_SUBST(hildondesktoplibdir)
AC_SUBST(hildonstatusmenudesktopentrydir)

AC_SUBST(vapidir)

AC_OUTPUT([
	Makefile
	po/Makefile.in
	po/Makefile
])
