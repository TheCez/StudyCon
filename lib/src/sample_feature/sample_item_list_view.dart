import 'dart:io';

import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    Key? key,
    this.items = const [SampleItem(1, 'Addition', 'mjlsSYLLOSE'), SampleItem(2, 'Subtraction', 'qM7B2nwpV1M'), SampleItem(3, 'Multiplication', 'fZFwHpiAVE0'), SampleItem(4, 'Division', 'wbkHv9zcGhI')],
  }) : super(key: key);

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Study Con'),
        title: Column(children: [
          const Text(
            "StudyCon",
            style: TextStyle(fontSize: 25),
          ),
          GestureDetector(
            child: const Text(
              'Future of Learning',
              style: TextStyle(fontSize: 10),
            ),
            // onTap: () {
            //   print("tapped subtitle");
            // },
          )
        ]),
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
        restorationId: 'Basic Maths',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              title: Text('Maths ${item.id} - ${item.text}'),
              leading: const CircleAvatar(
                // Display the Flutter Logo image asset.
                // foregroundImage: AssetImage('assets/images/flutter_logo.png'),
                foregroundImage: AssetImage('assets/images/maths_logo.png'),
              ),
              onTap: () {
                // Navigate to the details page. If the user leaves and returns to
                // the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(
                  context,
                  SampleItemDetailsView.routeName,
                  arguments: {'link': item.link, 'text': 'Maths ${item.id} - ${item.text}'},
                  
                );
              });
        },
      ),
    );
  }
}
