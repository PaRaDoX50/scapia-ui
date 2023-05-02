import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_scapia/blocs/journey_detail/journey_detail_bloc.dart';
import 'package:ui_scapia/data/models/journey_item.dart';
import 'package:ui_scapia/data/models/journey_type_enum.dart';
import 'package:ui_scapia/ui/common_widgets/common_app_bar.dart';
import 'package:ui_scapia/ui/common_widgets/loading_indicator.dart';
import 'package:ui_scapia/ui/screens/journey/components/dashed_line.dart';
import 'package:ui_scapia/ui/screens/journey/components/flight_detail_widget.dart';
import 'package:ui_scapia/ui/screens/journey/components/horizontal_timeline_tile.dart';
import 'package:ui_scapia/ui/screens/journey/components/intrinsic_horizontal_timeline_tile.dart';
import 'package:ui_scapia/ui/screens/journey/components/layover_detail_widget.dart';
import 'package:ui_scapia/ui/screens/journey/components/timeline_scrollview.dart';
import 'package:ui_scapia/ui/screens/journey/components/timeline_title.dart';
import 'package:ui_scapia/ui/theme_constants.dart';

class JourneyScreen extends StatefulWidget {
  static const String routeName = '/journey';
  const JourneyScreen({super.key});

  @override
  State<JourneyScreen> createState() => _JourneyScreenState();
}

class _JourneyScreenState extends State<JourneyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Scapia',
        centerTitle: true,
      ),
      body: BlocBuilder<JourneyDetailBloc, JourneyDetailState>(
        builder: (context, state) {
          if (state is JourneyDetailLoaded) {
            final journeyItems = state.journeyDetails.journey;
            int len = journeyItems.length;
            List<IntrinsicHorizontalTimelineTile> intrinsicTimelines = [];
            List<HorizontalTimelineTile> timelines = [];
            for (int i = 0; i <= len; i++) {
              bool isFirst = false;
              bool isLast = false;
              JourneyItem? prevItem;
              JourneyItem? currItem;
              if (i == 0) {
                isFirst = true;
                currItem = journeyItems[i];
              } else if (i == len) {
                isLast = true;
                prevItem = journeyItems[i - 1];
              } else {
                prevItem = journeyItems[i - 1];
                currItem = journeyItems[i];
              }

              _addTimelineToList(
                  isFirst: isFirst,
                  isLast: isLast,
                  timelines: timelines,
                  intrinsicTimelines: intrinsicTimelines,
                  currItem: currItem,
                  prevItem: prevItem);
            }
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TimelineScrollview(
                      timelines: intrinsicTimelines,
                      title: 'Implemented using IntrinsicWidth',
                      backgroundColor: lightSkin),
                  kverticalMargin16,
                  TimelineScrollview(
                      timelines: timelines,
                      title: 'Implemented using fixed SizedBox',
                      backgroundColor: lightSkin),
                ],
              ),
            );
          }
          if (state is JourneyDetailError) {
            return const Center(child: Text('Something went wrong'));
          }
          return const Center(
            child: LoadingIndicator(),
          );
        },
      ),
    );
  }

  _getContentWidget(JourneyItem item) {
    if (item.type == JourneyType.flight) {
      return FlightDetailWidget(item: item);
    } else if (item.type == JourneyType.layover) {
      return LayoverDetailWidget(item: item);
    }
  }

  _addTimelineToList(
      {JourneyItem? currItem,
      JourneyItem? prevItem,
      required bool isFirst,
      required bool isLast,
      required List<HorizontalTimelineTile> timelines,
      required List<IntrinsicHorizontalTimelineTile> intrinsicTimelines}) {
    if (isFirst) {
      timelines.add(HorizontalTimelineTile(
        nextContent: _getContentWidget(currItem!),
        duration: currItem.duration,
        nextLine: currItem.type == JourneyType.layover
            ? const DashedLine(
                color: Colors.red,
              )
            : Container(
                height: 2,
                color: lightBlue,
              ),
        previousLine: Container(),
        title: TimelineTitle(
          city: currItem.origin?.city ?? '',
          terminal: currItem.origin?.terminal ?? '',
          time: currItem.originTime,
          isIntrinsic: false,
        ),
        journeyItem: currItem,
        flight: currItem.flight,
      ));
      intrinsicTimelines.add(IntrinsicHorizontalTimelineTile(
        nextContent: _getContentWidget(currItem),
        duration: currItem.duration,
        nextLine: currItem.type == JourneyType.layover
            ? const DashedLine(
                color: Colors.red,
              )
            : Container(
                height: 2,
                color: lightBlue,
              ),
        previousLine: Container(),
        title: TimelineTitle(
            isIntrinsic: true,
            city: currItem.origin?.city ?? '',
            terminal: currItem.origin?.terminal ?? '',
            time: currItem.originTime),
        journeyItem: currItem,
        flight: currItem.flight,
      ));
    } else if (isLast) {
      timelines.add(HorizontalTimelineTile(
          showNext: false,
          duration: currItem?.duration ?? const Duration(),
          previousLine: prevItem?.type == JourneyType.layover
              ? const DashedLine(
                  color: Colors.red,
                )
              : Container(
                  height: 2,
                  color: lightBlue,
                ),
          nextLine: Container(),
          flight: currItem?.flight,
          title: TimelineTitle(
              isIntrinsic: false,
              city: prevItem?.destination?.city ?? 'City',
              terminal: prevItem?.destination?.terminal ?? 'Terminal',
              time: prevItem?.destinationArrivalTime ?? DateTime.now()),
          journeyItem: prevItem!));
      intrinsicTimelines.add(IntrinsicHorizontalTimelineTile(
          showNext: false,
          duration: currItem?.duration ?? const Duration(),
          previousLine: prevItem.type == JourneyType.layover
              ? const DashedLine(
                  color: Colors.red,
                )
              : Container(
                  height: 2,
                  color: lightBlue,
                ),
          nextLine: Container(),
          flight: currItem?.flight,
          title: TimelineTitle(
              isIntrinsic: true,
              city: prevItem.destination?.city ?? 'City',
              terminal: prevItem.destination?.terminal ?? 'Terminal',
              time: prevItem.destinationArrivalTime),
          journeyItem: prevItem));
    } else {
      timelines.add(HorizontalTimelineTile(
        nextContent: _getContentWidget(currItem!),
        duration: currItem.duration,
        previousLine: prevItem?.type == JourneyType.layover
            ? const DashedLine(
                color: Colors.red,
              )
            : Container(
                height: 2,
                color: lightBlue,
              ),
        nextLine: currItem.type == JourneyType.layover
            ? const DashedLine(
                color: Colors.red,
              )
            : Container(
                height: 2,
                color: lightBlue,
              ),
        title: TimelineTitle(
          city: prevItem?.destination?.city ?? 'City',
          terminal: prevItem?.destination?.terminal ?? 'Terminal',
          time: prevItem?.destinationArrivalTime ?? DateTime.now(),
          isIntrinsic: false,
        ),
        journeyItem: currItem,
        flight: currItem.flight,
      ));
      intrinsicTimelines.add(IntrinsicHorizontalTimelineTile(
        nextContent: _getContentWidget(currItem),
        duration: currItem.duration,
        previousLine: prevItem?.type == JourneyType.layover
            ? const DashedLine(
                color: Colors.red,
              )
            : Container(
                height: 2,
                color: lightBlue,
              ),
        nextLine: currItem.type == JourneyType.layover
            ? const DashedLine(
                color: Colors.red,
              )
            : Container(
                height: 2,
                color: lightBlue,
              ),
        title: TimelineTitle(
          city: prevItem?.type == JourneyType.flight
              ? prevItem?.destination?.city ?? 'City'
              : prevItem?.origin?.city ?? 'City',
          terminal: prevItem?.destination?.terminal ?? 'Terminal',
          time: prevItem?.destinationArrivalTime ?? DateTime.now(),
          isIntrinsic: true,
        ),
        journeyItem: currItem,
        flight: currItem.flight,
      ));
    }
  }
}
