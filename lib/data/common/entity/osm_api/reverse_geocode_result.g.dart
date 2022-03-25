// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reverse_geocode_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReverseGeocodeResult _$ReverseGeocodeResultFromJson(
        Map<String, dynamic> json) =>
    ReverseGeocodeResult(
      address: json['address'] == null
          ? null
          : OsmAddress.fromJson(json['address'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$ReverseGeocodeResultToJson(
        ReverseGeocodeResult instance) =>
    <String, dynamic>{
      'address': instance.address,
      'error': instance.error,
    };
