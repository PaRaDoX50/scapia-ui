import 'package:json_annotation/json_annotation.dart';
import 'package:ui_scapia/data/models/journey_type_enum.dart';

part 'journey_item.g.dart';

class JourneyItem {
  final JourneyType type;
  final AirportDetail? origin;
  final AirportDetail? destination;
  final DateTime? destinationArrivalTime;
  final DateTime? originTime;
  final Duration duration;
  final FlightDetail? flight;

  JourneyItem({
    required this.type,
    this.origin,
    this.destination,
    this.destinationArrivalTime,
    this.originTime,
    required this.duration,
    this.flight,
  });

  factory JourneyItem.fromEntity(JourneyItemEntity entity) {
    return JourneyItem(
      type: JourneyType.fromString(entity.type),
      duration: Duration(seconds: entity.duration),
      destination: entity.destination != null
          ? AirportDetail.fromEntity(entity.destination!)
          : null,
      origin: entity.origin != null
          ? AirportDetail.fromEntity(entity.origin!)
          : null,
      destinationArrivalTime: entity.destinationArrivalTime != null
          ? DateTime.parse(entity.destinationArrivalTime!)
          : null,
      originTime:
          entity.originTime != null ? DateTime.parse(entity.originTime!) : null,
      flight: entity.flight != null
          ? FlightDetail.fromEntity(entity.flight!)
          : null,
    );
  }
}

@JsonSerializable()
class JourneyItemEntity {
  final String type;
  final AirportDetailEntity? origin;
  final AirportDetailEntity? destination;
  @JsonKey(name: 'destination_arrival_time')
  final String? destinationArrivalTime;
  @JsonKey(name: 'origin_time')
  final String? originTime;
  final int duration;
  final FlightDetailEntity? flight;

  JourneyItemEntity(
      {required this.type,
      this.origin,
      this.destination,
      this.destinationArrivalTime,
      this.originTime,
      required this.duration,
      this.flight});

  factory JourneyItemEntity.fromJson(Map<String, dynamic> json) =>
      _$JourneyItemEntityFromJson(json);

  Map<String, dynamic> toJson() => _$JourneyItemEntityToJson(this);
}

class AirportDetail {
  final String city;
  final String terminal;

  AirportDetail({
    required this.city,
    required this.terminal,
  });

  factory AirportDetail.fromEntity(AirportDetailEntity entity) {
    return AirportDetail(
      city: entity.city,
      terminal: entity.terminal,
    );
  }
}

@JsonSerializable()
class AirportDetailEntity {
  final String city;
  final String terminal;

  AirportDetailEntity({
    required this.city,
    required this.terminal,
  });

  factory AirportDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$AirportDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AirportDetailEntityToJson(this);
}

class FlightDetail {
  final String iconUrl;
  final String serviceProvider;
  final String model;

  FlightDetail({
    required this.iconUrl,
    required this.serviceProvider,
    required this.model,
  });

  factory FlightDetail.fromEntity(FlightDetailEntity entity) {
    return FlightDetail(
      iconUrl: entity.iconUrl,
      serviceProvider: entity.serviceProvider,
      model: entity.model,
    );
  }
}

@JsonSerializable()
class FlightDetailEntity {
  @JsonKey(name: 'icon_url')
  final String iconUrl;
  @JsonKey(name: 'service_provider')
  final String serviceProvider;
  final String model;

  FlightDetailEntity({
    required this.iconUrl,
    required this.serviceProvider,
    required this.model,
  });

  factory FlightDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$FlightDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FlightDetailEntityToJson(this);
}
//  "type": "flight",
//       "origin": "Bangalore",
//       "destination": "Delhi",
//       "departureTime": "2023-05-01T10:00:00Z",
//       "arrivalTime": "2023-05-01T12:00:00Z",
//       "duration": "02:00"