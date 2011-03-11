class ClockStatusMenuItem : HD.StatusMenuItem
{
	private const string STATUSMENU_CLOCK_LIBOSSO_SERVICE_NAME = "clock_status_area_plugin";

	// Widgets
	Hildon.Button button;
	Gtk.Label time_label;

	uint timeout_id;

	// GConf and Osso context
	Osso.Context osso;
	GConf.Client gconf;

	private void create_widgets () {
		Gtk.HBox status_area_box;
		
		// Status menu button
		button = new Hildon.Button.with_text (Hildon.SizeType.FINGER_HEIGHT,
		                                      Hildon.ButtonArrangement.VERTICAL,
		                                      _("Clock and Alarms"),
		                                      "day 01.01.0001");
		button.set_alignment (0.0f, 0.5f, 1.0f, 1.0f);
		button.set_style (Hildon.ButtonStyle.PICKER);
		//button.clicked.connect (button_clicked_cb);
		add (button);

		// Status area widget
		status_area_box = new Gtk.HBox (false, 0);
		time_label = new Gtk.Label("xx:xx");
		status_area_box.pack_start (time_label, false, false, 0);
		status_area_box.show_all ();
		set_status_area_widget (status_area_box);

		timeout_cb ();
		timeout_id = heartbeat_signal_add (0, 60, timeout_cb, null);

		show_all ();
	}

	public ClockStatusMenuItem() {
		Object();
	}

	private bool timeout_cb() {
		Gdk.threads_enter ();

		var time = new DateTime.now_local ();
		this.button.value = time.format("%a, %x");
		this.time_label.set_markup (time.format("<span font_desc=\"24\">%H:%M</span>"));

		Gdk.threads_leave ();
		return true;
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
