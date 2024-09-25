import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
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

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: items.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return SfCalendar(
              view: CalendarView.month,
              monthViewSettings: MonthViewSettings(),
            );
          }
          final item = items[index - 1];

          return ListTile(
            title: Text('Event number ${item.id}'),
            leading: const CircleAvatar(
              // Display the Flutter Logo image asset.z
              foregroundImage: AssetImage('assets/images/flutter_logo.png'),
            ),
            onTap: () {
              // Navigate to the details page. If the user leaves and returns to
              // the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(
                context,
                SampleItemDetailsView.routeName,
              );
            }
          );
        },
      ),

      bottomNavigationBar: NavigationBar(
				onDestinationSelected: (int index) {
				},

				selectedIndex: 0,

				destinations: const <Widget>[
					NavigationDestination(
						selectedIcon: Icon(Icons.home),
						icon: Icon(Icons.home_outlined),
						label: 'Home',
					),

					NavigationDestination(
						icon: Icon(Icons.diamond),
						label: 'República',
					),

					NavigationDestination(
						icon: Icon(Icons.align_vertical_bottom),
						label: 'Adiministração',
					),
				],
			),
    );
  }
}
