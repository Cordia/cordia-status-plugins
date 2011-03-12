# List extras to package
EXTRA_DIST = \
	autogen.sh \
	autovapi.sh

# Sub directories
SUBDIRS = po

# Binary
hildondesktoplib_LTLIBRARIES = \
	status-area-applet-clock.la \
	status-area-applet-battery.la

hildonstatusmenudesktopentry_DATA = \
	data/clock-plugin.desktop

icon48_DATA = \
	data/statusarea_clock.png

icon18_DATA = \
	data/statusarea_alarm.png

status_area_applet_clock_la_SOURCES = \
	src/status-area-applet-clock.vala
status_area_applet_clock_la_CFLAGS = ${HD_CFLAGS} ${GCONF_CFLAGS} \
        -DGETTEXT_PACKAGE=\"@GETTEXT_PACKAGE@\"
status_area_applet_clock_la_VALAFLAGS = \
	--vapidir=$(vapidir) --vapidir=$(top_srcdir)/vapi \
	--pkg=config --pkg=posix \
	--pkg=libhildondesktop-1 --pkg=hildon-1 \
	--pkg=gtk+-2.0 --pkg=gdk-2.0 --pkg=dbus-glib-1
status_area_applet_clock_la_LIBADD = ${HD_LIBS} ${GCONF_LIBS} ${OSSO_LIBS}
status_area_applet_clock_la_LDFLAGS = -module -avoid-version

status_area_applet_battery_la_SOURCES = \
	src/status-area-applet-battery.vala
status_area_applet_battery_la_CFLAGS = ${HD_CFLAGS} ${GCONF_CFLAGS} \
        -DGETTEXT_PACKAGE=\"@GETTEXT_PACKAGE@\" -DHILDON_ICON_DIR=\"$(icon18dir)\"
status_area_applet_battery_la_VALAFLAGS = \
	--vapidir=$(vapidir) --vapidir=$(top_srcdir)/vapi \
	--pkg=config --pkg=posix \
	--pkg=libhildondesktop-1 --pkg=hildon-1 \
	--pkg=gtk+-2.0 --pkg=gdk-2.0 --pkg=dbus-glib-1
status_area_applet_battery_la_LIBADD = ${HD_LIBS} ${GCONF_LIBS} ${OSSO_LIBS}
status_area_applet_battery_la_LDFLAGS = -module -avoid-version

ACLOCAL_AMFLAGS = -Im4
