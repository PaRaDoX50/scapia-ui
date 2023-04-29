// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journey_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JourneyDetailsEntity _$JourneyDetailsEntityFromJson(
        Map<String, dynamic> json) =>
    JourneyDetailsEntity(
      journey: (json['journey'] as List<dynamic>)
          .map((e) => JourneyItemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$JourneyDetailsEntityToJson(
        JourneyDetailsEntity instance) =>
    <String, dynamic>{
      'journey': instance.journey.map((e) => e.toJson()).toList(),
    };
