// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'osm_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OsmAddress _$OsmAddressFromJson(Map<String, dynamic> json) => OsmAddress(
      houseNumber: json['house_number'] as String?,
      road: json['road'] as String?,
      village: json['village'] as String?,
      stateDistrict: json['state_district'] as String?,
      town: json['town'] as String?,
      city: json['city'] as String?,
      postcode: json['postcode'] as String?,
      county: json['county'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      countryCode: json['country_code'] as String?,
    );

Map<String, dynamic> _$OsmAddressToJson(OsmAddress instance) =>
    <String, dynamic>{
      'house_number': instance.houseNumber,
      'road': instance.road,
      'village': instance.village,
      'state_district': instance.stateDistrict,
      'state': instance.state,
      'town': instance.town,
      'county': instance.county,
      'city': instance.city,
      'postcode': instance.postcode,
      'country': instance.country,
      'country_code': instance.countryCode,
    };
