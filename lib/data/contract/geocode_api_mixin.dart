import 'package:clean_boilerplate/data/common/entity/osm_api/reverse_geocode_request.dart';
import 'package:dio/dio.dart';

mixin GeocodeApiMixin {
  Future<Response> onReverseGeocodeRequest(ReverseGeocodeRequest body);
}
