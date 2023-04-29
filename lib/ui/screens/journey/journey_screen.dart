import 'package:flutter/material.dart';

import 'package:ui_scapia/ui/common_widgets/common_app_bar.dart';

class JourneyScreen extends StatelessWidget {
  static const String routeName = '/journey';
  const JourneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(
        title: 'Scapia',
        centerTitle: true,
      ),
      body: Center(
        child: Text('Work in progress'),
      ),
    );
  }
}
