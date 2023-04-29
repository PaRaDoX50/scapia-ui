import 'package:flutter/material.dart';
import 'package:ui_scapia/ui/common_widgets/common_app_bar.dart';
import 'package:ui_scapia/ui/screens/cancellation_window/cancellation_window.dart';
import 'package:ui_scapia/ui/screens/journey/journey_screen.dart';
import 'package:ui_scapia/ui/theme_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Scapia',
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor)),
                onPressed: () {
                  Navigator.pushNamed(
                      context, CancellationWindowScreen.routeName);
                },
                child: const Text('Cancellation Window Screen')),
            kverticalMargin8,
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor)),
                onPressed: () {
                  Navigator.pushNamed(context, JourneyScreen.routeName);
                },
                child: const Text('Journey Widget Screen')),
          ],
        ),
      ),
    );
  }
}
