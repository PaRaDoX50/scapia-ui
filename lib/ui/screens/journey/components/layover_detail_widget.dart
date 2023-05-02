import 'package:flutter/material.dart';
import 'package:ui_scapia/data/models/journey_item.dart';
import 'package:ui_scapia/ui/theme_constants.dart';

class LayoverDetailWidget extends StatelessWidget {
  final JourneyItem item;
  const LayoverDetailWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Layover in ${item.origin?.city ?? ''}',
      style: ktextStyle12W600,
      textAlign: TextAlign.center,
    );
  }
}
