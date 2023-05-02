// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journey_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JourneyItemEntity _$JourneyItemEntityFromJson(Map<String, dynamic> json) =>
    JourneyItemEntity(
      type: json['type'] as String,
      origin: json['origin'] == null
          ? null
          : AirportDetailEntity.fromJson(
              json['origin'] as Map<String, dynamic>),
      destination: json['destination'] == null
          ? null
          : AirportDetailEntity.fromJson(
              json['destination'] as Map<String, dynamic>),
      destinationArrivalTime: json['destination_arrival_time'] as String,
      originTime: json['origin_time'] as String,
      duration: json['duration'] as int,
      flight: json['flight'] == null
          ? null
          : FlightDetailEntity.fromJson(json['flight'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JourneyItemEntityToJson(JourneyItemEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'origin': instance.origin,
      'destination': instance.destination,
      'destination_arrival_time': instance.destinationArrivalTime,
      'origin_time': instance.originTime,
      'duration': instance.duration,
      'flight': instance.flight,
    };

AirportDetailEntity _$AirportDetailEntityFromJson(Map<String, dynamic> json) =>
    AirportDetailEntity(
      city: json['city'] as String,
      terminal: json['terminal'] as String,
    );

Map<String, dynamic> _$AirportDetailEntityToJson(
        AirportDetailEntity instance) =>
    <String, dynamic>{
      'city': instance.city,
      'terminal': instance.terminal,
    };

FlightDetailEntity _$FlightDetailEntityFromJson(Map<String, dynamic> json) =>
    FlightDetailEntity(
      iconUrl: json['icon_url'] as String,
      serviceProvider: json['service_provider'] as String,
      model: json['model'] as String,
    );

Map<String, dynamic> _$FlightDetailEntityToJson(FlightDetailEntity instance) =>
    <String, dynamic>{
      'icon_url': instance.iconUrl,
      'service_provider': instance.serviceProvider,
      'model': instance.model,
    };
