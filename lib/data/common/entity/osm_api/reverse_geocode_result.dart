import 'package:clean_boilerplate/data/common/entity/osm_api/osm_address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reverse_geocode_result.g.dart';

@JsonSerializable()
class ReverseGeocodeResult {
  final OsmAddress? address;
  final String? error;

  ReverseGeocodeResult({this.address, this.error});

  factory ReverseGeocodeResult.fromJson(Map<String, dynamic> json) =>
      _$ReverseGeocodeResultFromJson(json);
}
