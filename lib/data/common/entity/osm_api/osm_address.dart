import 'package:json_annotation/json_annotation.dart';

part 'osm_address.g.dart';

@JsonSerializable()
class OsmAddress {
  @JsonKey(name: 'house_number')
  final String? houseNumber;
  final String? road;
  final String? village;
  @JsonKey(name: 'state_district')
  final String? stateDistrict;
  final String? state;
  final String? town;
  final String? county;
  final String? city;
  final String? postcode;
  final String? country;
  @JsonKey(name: 'country_code')
  final String? countryCode;

  OsmAddress({
    this.houseNumber,
    this.road,
    this.village,
    this.stateDistrict,
    this.town,
    this.city,
    this.postcode,
    this.county,
    this.state,
    this.country,
    this.countryCode,
  });

  factory OsmAddress.fromJson(Map<String, dynamic> json) =>
      _$OsmAddressFromJson(json);
}
