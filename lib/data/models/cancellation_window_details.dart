import 'package:json_annotation/json_annotation.dart';
part 'cancellation_window_details.g.dart';

class CancellationWindowDetails {
  final List<TimeToCharge> timeToCharge;

  CancellationWindowDetails({required this.timeToCharge});

  factory CancellationWindowDetails.fromEntity(
      CancellationWindowDetailsEntity entity) {
    return CancellationWindowDetails(
      timeToCharge:
          entity.timeToCharge.map((e) => TimeToCharge.fromEntity(e)).toList(),
    );
  }
}

@JsonSerializable(explicitToJson: true)
class CancellationWindowDetailsEntity {
  @JsonKey(name: 'time_to_charge')
  List<TimeToChargeEntity> timeToCharge;

  CancellationWindowDetailsEntity({required this.timeToCharge});

  factory CancellationWindowDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$CancellationWindowDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CancellationWindowDetailsEntityToJson(this);
}

class TimeToCharge {
  final String time;
  final String charge;

  TimeToCharge({required this.time, required this.charge});

  factory TimeToCharge.fromEntity(TimeToChargeEntity entity) {
    return TimeToCharge(
      time: entity.time,
      charge: entity.charge,
    );
  }
}

@JsonSerializable()
class TimeToChargeEntity {
  final String time;
  final String charge;

  TimeToChargeEntity({required this.time, required this.charge});

  factory TimeToChargeEntity.fromJson(Map<String, dynamic> json) =>
      _$TimeToChargeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TimeToChargeEntityToJson(this);
}
