import 'package:flutter/material.dart';
import 'package:ui_scapia/ui/theme_constants.dart';
import 'package:ui_scapia/utils.dart';

class TimelineTitle extends StatelessWidget {
  final String city;
  final String terminal;
  final DateTime time;
  final bool isIntrinsic;
  const TimelineTitle(
      {super.key,
      required this.city,
      required this.terminal,
      required this.time,
      this.isIntrinsic = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          dateTimeToTimeString(time),
          style: ktextStyle20Bold,
          overflow: TextOverflow.ellipsis,
          maxLines: !isIntrinsic ? 1 : null,
        ),
        kverticalMargin4,
        Text(
          dateTimeToDateString(time),
          style: ktextStyle14W500,
          overflow: TextOverflow.ellipsis,
          maxLines: !isIntrinsic ? 1 : null,
        ),
        kverticalMargin4,
        Text(
          city,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          overflow: TextOverflow.ellipsis,
          maxLines: !isIntrinsic ? 1 : null,
        ),
        Text(
          terminal,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          overflow: TextOverflow.ellipsis,
          maxLines: !isIntrinsic ? 1 : null,
        )
      ],
    );
  }
}
