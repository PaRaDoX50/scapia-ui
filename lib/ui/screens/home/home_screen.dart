import 'package:flutter/material.dart';
import 'package:ui_scapia/ui/common_widgets/common_app_bar.dart';
import 'package:ui_scapia/ui/screens/cancellation_window/cancellation_window.dart';

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
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor)),
            onPressed: () {
              Navigator.pushNamed(context, CancellationWindowScreen.routeName);
            },
            child: const Text('Cancellation Window Screen')),
      ),
    );
  }
}
