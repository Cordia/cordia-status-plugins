class ClockStatusMenuItem : HD.StatusMenuItem
{
	private const string STATUSMENU_CLOCK_LIBOSSO_SERVICE_NAME = "clock_status_area_plugin";

	// Widgets
	Hildon.Button button;

	// GConf and Osso context
	Osso.Context osso;
	GConf.Client gconf;

	private void create_widgets () {
		// Status menu button
		button = new Hildon.Button.with_text (Hildon.SizeType.FINGER_HEIGHT,
		                                      Hildon.ButtonArrangement.VERTICAL,
		                                      _("Clock and Alarms"),
		                                      "day 01.01.0001");
		button.set_alignment (0.0f, 0.5f, 1.0f, 1.0f);
		button.set_style (Hildon.ButtonStyle.PICKER);
		//button.clicked.connect (button_clicked_cb);

		add (button);

		show_all ();
	}

	construct {
		// Gettext hook-up
		Intl.setlocale (LocaleCategory.ALL, "");
		Intl.bindtextdomain (Config.GETTEXT_PACKAGE, Config.LOCALEDIR);
		Intl.textdomain (Config.GETTEXT_PACKAGE);

		// GConf hook-up
		gconf = GConf.Client.get_default ();

		// Osso hook-up
		osso = new Osso.Context (STATUSMENU_CLOCK_LIBOSSO_SERVICE_NAME,
		                         Config.VERSION,
		                         true,
		                         null);

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
	((HD.PluginModule) plugin).add_type (typeof (ClockStatusMenuItem));
}

public void hd_plugin_module_unload (HD.PluginModule plugin) {
}