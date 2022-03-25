import 'package:json_annotation/json_annotation.dart';

part 'reverse_geocode_request.g.dart';

@JsonSerializable()
class ReverseGeocodeRequest {
  final double lat;
  final double lon;
  final String format;

  ReverseGeocodeRequest({
    required this.lat,
    required this.lon,
    this.format = 'json',
  });

  Map<String, dynamic> toJson() => _$ReverseGeocodeRequestToJson(this);
}
