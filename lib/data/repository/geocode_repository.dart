import 'dart:io';

import 'package:clean_boilerplate/data/common/entity/osm_api/reverse_geocode_request.dart';
import 'package:clean_boilerplate/data/common/entity/osm_api/reverse_geocode_result.dart';
import 'package:clean_boilerplate/data/common/mapper/osm_address_mapper.dart';
import 'package:clean_boilerplate/data/contract/geocode_api_mixin.dart';
import 'package:clean_boilerplate/domain/common/entity/address.dart';
import 'package:clean_boilerplate/domain/common/exception/common_request_exception.dart';
import 'package:clean_boilerplate/domain/contract/repository/geocode_repository_mixin.dart';

class GeocodeRepository with GeocodeRepositoryMixin {
  final GeocodeApiMixin _geocodeApi;

  GeocodeRepository(this._geocodeApi);

  @override
  Future<Address> getAddress(
      {required double latitude, required double longitude}) async {
    final requestBody = ReverseGeocodeRequest(lat: latitude, lon: longitude);
    final response = await _geocodeApi.onReverseGeocodeRequest(requestBody);

    if (response.statusCode != HttpStatus.ok) {
      throw CommonRequestException(message: 'Get address request is failed');
    }

    final responseModel = ReverseGeocodeResult.fromJson(response.data);
    if (responseModel.error != null) {
      throw CommonRequestException(message: responseModel.error);
    }
    if (responseModel.address == null) {
      throw CommonRequestException();
    }

    return responseModel.address!.toModel();
  }
}
