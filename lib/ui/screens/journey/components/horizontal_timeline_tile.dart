import 'package:flutter/material.dart';
import 'package:ui_scapia/data/models/journey_item.dart';
import 'package:ui_scapia/data/models/journey_type_enum.dart';
import 'package:ui_scapia/ui/screens/cancellation_window/components/timeline_containers.dart';
import 'package:ui_scapia/ui/theme_constants.dart';
import 'package:ui_scapia/utils.dart';

class HorizontalTimelineTile extends StatelessWidget {
  final Duration duration;
  final bool showNext;
  final FlightDetail? flight;
  final Widget nextLine;
  final Widget? nextContent;
  final Widget previousLine;
  final Widget title;
  final JourneyItem journeyItem;
  const HorizontalTimelineTile({
    Key? key,
    required this.duration,
    this.flight,
    required this.nextLine,
    required this.previousLine,
    required this.title,
    this.showNext = true,
    required this.journeyItem,
    this.nextContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kdoubleSmallMargin),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: false,
                  child: SizedBox(
                    height: 110 - 18 - 8,
                    width: 90,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: previousLine),
                    DotContainer(
                      isLastTile: false,
                      color: Colors.orange,
                      borderColor: Colors.orange.shade100,
                    ),
                    Expanded(child: nextLine),
                  ],
                ),
                kverticalMargin16,
                title,
              ],
            ),
          ),
          showNext
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        height: 80,
                        width: 90,
                        child: nextContent ?? Container()),
                    Container(
                      width: 90,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: journeyItem.type == JourneyType.layover
                              ? lightRed
                              : extraLightBlue,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: kdoubleXSmallMargin,
                          vertical: kdoubleXSmallMargin),
                      child: Text(
                        maxLines: 1,
                        durationToString(duration),
                        style: ktextStyle16W500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
