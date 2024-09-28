import 'package:flutter/material.dart';
import 'package:pulero_apk/src/republica/republica.dart';
import 'package:pulero_apk/src/homepage/homepage.dart';
import 'package:pulero_apk/src/settings/settings_view.dart';

/// Displays a list of SampleItems.
class RootPage extends StatefulWidget {
  const RootPage({
    super.key,
  });

  static const routeName = '/';

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
	int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pulero'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

			body: <Widget>[
				const HomePage(),
				const RepublicaPage(),
				const Text('PLACEHOLDER'),
			][currentPageIndex],

      bottomNavigationBar: NavigationBar(
				onDestinationSelected: (int index) {
					setState(() {
						currentPageIndex = index;
					});
				},

				selectedIndex: 0,

				destinations: const <Widget>[
					NavigationDestination(
						selectedIcon: Icon(Icons.home),
						icon: Icon(Icons.home_outlined),
						label: 'Home',
					),

					NavigationDestination(
						icon: Icon(Icons.house),
						label: 'República',
					),

					NavigationDestination(
						icon: Icon(Icons.admin_panel_settings),
						label: 'Adiministração',
					),
				],
			),
    );
  }
}
