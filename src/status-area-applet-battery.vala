class BatteryStatusMenuItem : HD.StatusMenuItem
{
	[CCode(cname="HILDON_ICON_DIR")]
	extern const string HILDON_ICON_DIR;

	
	Gdk.Pixbuf icon;

	private void create_widgets () {
		try {
			icon = new Gdk.Pixbuf.from_file(HILDON_ICON_DIR+"/statusarea_battery.png");
		} catch (GLib.Error e)
		{
			GLib.error(e.message);
		}
		set_status_area_icon (icon);
		show_all ();
	}

	public BatteryStatusMenuItem() {
		Object();
	}

	construct {
		// Gettext hook-up
		Intl.setlocale (LocaleCategory.ALL, "");
		Intl.bindtextdomain (Config.GETTEXT_PACKAGE, Config.LOCALEDIR);
		Intl.textdomain (Config.GETTEXT_PACKAGE);

		create_widgets ();
	}
}

/**
 * Vala code can't use the HD_DEFINE_PLUGIN_MODULE macro, but it handles
 * most of the class registration issues itself. Only this code from
 * HD_PLUGIN_MODULE_SYMBOLS_CODE has to be included manually
 * to register with hildon-desktop:
 */
[ModuleInit]
public void hd_plugin_module_load (TypeModule plugin) {
	// [ModuleInit] registers types automatically
	((HD.PluginModule) plugin).add_type (typeof (BatteryStatusMenuItem));
}

public void hd_plugin_module_unload (HD.PluginModule plugin) {
}
