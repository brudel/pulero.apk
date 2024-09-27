import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pulero_apk/src/login/login_controller.dart';
import 'package:pulero_apk/src/preferences_service.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';

void main() async {

	// Necessary to use SharedPreferences
	WidgetsFlutterBinding.ensureInitialized();

	await PreferencesService.init();

	runApp(MultiProvider(
		providers: [
			ChangeNotifierProvider(create: (context) => SettingsController()),
			ChangeNotifierProvider(create: (context) => LoginController()),
		],
		 child: const MyApp(),
	)
	);
}
