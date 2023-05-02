import 'package:flutter/material.dart';
import 'package:ui_scapia/ui/theme_constants.dart';

class TimelineScrollview extends StatelessWidget {
  final List<Widget> timelines;
  final String title;
  final Color backgroundColor;
  const TimelineScrollview(
      {super.key,
      required this.timelines,
      required this.title,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(kdoubleSmallMargin),
            child: Text(
              title,
              style: ktextStyle16W500,
            ),
          ),
          kverticalMargin8,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kdoubleMediumlMargin,
                  vertical: kdoubleSmallMargin),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: timelines,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
