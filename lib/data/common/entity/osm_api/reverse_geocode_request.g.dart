// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reverse_geocode_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReverseGeocodeRequest _$ReverseGeocodeRequestFromJson(
        Map<String, dynamic> json) =>
    ReverseGeocodeRequest(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      format: json['format'] as String? ?? 'json',
    );

Map<String, dynamic> _$ReverseGeocodeRequestToJson(
        ReverseGeocodeRequest instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'format': instance.format,
    };
