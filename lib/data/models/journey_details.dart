import 'package:json_annotation/json_annotation.dart';
import 'package:ui_scapia/data/models/journey_item.dart';

part 'journey_details.g.dart';

class JourneyDetails {
  List<JourneyItem> journey;

  JourneyDetails({required this.journey});

  factory JourneyDetails.fromEntity(JourneyDetailsEntity entity) {
    return JourneyDetails(
        journey: entity.journey.map((e) => JourneyItem.fromEntity(e)).toList());
  }
}

@JsonSerializable(explicitToJson: true)
class JourneyDetailsEntity {
  List<JourneyItemEntity> journey;

  JourneyDetailsEntity({required this.journey});

  factory JourneyDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$JourneyDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$JourneyDetailsEntityToJson(this);
}
