import 'package:flutter/material.dart';
import 'package:ui_scapia/ui/screens/cancellation_window/components/timeline_containers.dart';
import 'package:ui_scapia/ui/theme_constants.dart';

class TimelineTile extends StatelessWidget {
  final Widget prevLine;
  final Widget nextLine;

  final bool isLastTile;
  final String time;
  final String charge;
  const TimelineTile({
    super.key,
    required this.prevLine,
    required this.nextLine,
    this.isLastTile = false,
    required this.time,
    required this.charge,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: prevLine),
                DotContainer(
                  isLastTile: isLastTile,
                  color: Colors.green,
                  borderColor: Colors.green.shade100,
                ),
                Expanded(child: nextLine),
              ],
            ),
            khorizontalMargin16,
            Expanded(
              flex: 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kdoubleMediumlMargin),
                child: Text(
                  time,
                  style: ktextStyle14W500.copyWith(color: Colors.grey),
                ),
              ),
            ),
            khorizontalMargin8,
            // Spacer(),
            Expanded(
                flex: 2,
                child: Text(
                  charge,
                  textAlign: TextAlign.end,
                )),
          ],
        ),
      ),
    );
  }
}
