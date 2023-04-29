// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancellation_window_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancellationWindowDetailsEntity _$CancellationWindowDetailsEntityFromJson(
        Map<String, dynamic> json) =>
    CancellationWindowDetailsEntity(
      timeToCharge: (json['time_to_charge'] as List<dynamic>)
          .map((e) => TimeToChargeEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CancellationWindowDetailsEntityToJson(
        CancellationWindowDetailsEntity instance) =>
    <String, dynamic>{
      'time_to_charge': instance.timeToCharge.map((e) => e.toJson()).toList(),
    };

TimeToChargeEntity _$TimeToChargeEntityFromJson(Map<String, dynamic> json) =>
    TimeToChargeEntity(
      time: json['time'] as String,
      charge: json['charge'] as String,
    );

Map<String, dynamic> _$TimeToChargeEntityToJson(TimeToChargeEntity instance) =>
    <String, dynamic>{
      'time': instance.time,
      'charge': instance.charge,
    };
