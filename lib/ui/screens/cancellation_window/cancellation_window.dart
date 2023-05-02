import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_scapia/blocs/cancellation_detail_bloc/cancellation_detail_bloc.dart';
import 'package:ui_scapia/ui/common_widgets/common_app_bar.dart';
import 'package:ui_scapia/ui/common_widgets/loading_indicator.dart';
import 'package:ui_scapia/ui/screens/cancellation_window/components/timeline_containers.dart';
import 'package:ui_scapia/ui/screens/cancellation_window/components/timeline_tile.dart';
import 'package:ui_scapia/ui/theme_constants.dart';

class CancellationWindowScreen extends StatefulWidget {
  static const String routeName = '/cancellation_window_screen';
  const CancellationWindowScreen({super.key});

  @override
  State<CancellationWindowScreen> createState() =>
      _CancellationWindowScreenState();
}

class _CancellationWindowScreenState extends State<CancellationWindowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Scapia',
        centerTitle: true,
      ),
      body: BlocBuilder<CancellationDetailBloc, CancellationDetailState>(
        builder: (ctx, state) {
          if (state is CancellationDetailLoaded) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: kdoubleLargeMargin,
                    vertical: kdoubleMediumlMargin),
                decoration: BoxDecoration(color: Colors.blue.withOpacity(.1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Cancellation Window',
                          style: ktextStyle14Bold,
                        ),
                        const Spacer(),
                        const Text(
                          'Charges',
                          style: ktextStyle14Bold,
                        ),
                      ],
                    ),
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        children: state.cancellationDetails.timeToCharge
                            .asMap()
                            .entries
                            .map((innerEntry) {
                          final index = innerEntry.key;
                          final value = innerEntry.value;

                          bool isLast = index ==
                              state.cancellationDetails.timeToCharge.length - 1;
                          bool isFirst = index == 0;
                          return TimelineTile(
                            prevLine: isFirst
                                ? Container()
                                : const GreenLineContainer(),
                            nextLine: isLast
                                ? Container()
                                : const GreenLineContainer(),
                            time: value.time,
                            charge: value.charge,
                            isLastTile: isLast,
                          );
                        }).toList()),
                    kverticalMargin16,
                    Text(
                      "As per local time at the property",
                      style: ktextStyle14.copyWith(color: Colors.grey),
                    )
                  ],
                ),
              ),
            );
          }
          return const Center(child: LoadingIndicator());
        },
      ),
    );
  }
}
