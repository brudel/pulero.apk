import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pulero_apk/src/login/login_controller.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'sample_item.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: items.length + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return ListTile(
              title: Text('Bem vinde ${context.read<LoginController>().nickname}!!'),
            );
          }

          if (index == 1) {
            return SfCalendar(
              view: CalendarView.month,
              monthViewSettings: const MonthViewSettings(),
              dataSource: null,
            );
          }
          final item = items[index - 2];

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
    );
  }
}
