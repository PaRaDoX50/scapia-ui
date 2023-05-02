import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_scapia/data/models/journey_item.dart';
import 'package:ui_scapia/ui/theme_constants.dart';

class FlightDetailWidget extends StatelessWidget {
  final JourneyItem item;
  const FlightDetailWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              imageUrl: item.flight?.iconUrl ?? '',
              height: 20,
              width: 20,
              placeholder: (context, url) {
                return Container(
                  height: 20,
                  width: 20,
                  color: Colors.grey.shade300,
                );
              },
            ),
            khorizontalMargin4,
            Expanded(
              child: Text(
                item.flight?.serviceProvider ?? '',
                overflow: TextOverflow.ellipsis,
                style: ktextStyle12W600,
                textAlign: TextAlign.start,
                maxLines: 1,
              ),
            ),
          ],
        ),
        Flexible(
            child: Text(
          item.flight?.model ?? '',
          maxLines: 1,
          style: ktextStyle12W600,
          overflow: TextOverflow.ellipsis,
        )),
      ],
    );
  }
}
