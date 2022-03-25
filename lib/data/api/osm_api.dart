import 'package:clean_boilerplate/data/common/entity/osm_api/reverse_geocode_request.dart';
import 'package:clean_boilerplate/data/config.dart';
import 'package:clean_boilerplate/data/contract/geocode_api_mixin.dart';
import 'package:dio/dio.dart';

class OsmApi with GeocodeApiMixin {
  final _dio = Dio(
    BaseOptions(baseUrl: osmUrl),
  );

  @override
  Future<Response> onReverseGeocodeRequest(ReverseGeocodeRequest body) async {
    final response = await _dio.get(
      '/reverse',
      queryParameters: body.toJson(),
    );
    return response;
  }
}
