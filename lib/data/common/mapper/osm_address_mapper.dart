import 'package:clean_boilerplate/data/common/entity/osm_api/osm_address.dart';
import 'package:clean_boilerplate/domain/common/entity/address.dart';

extension OsmAddressMapper on OsmAddress {
  Address toModel() => Address(
        houseNumber: houseNumber,
        road: road,
        village: village,
        stateDistrict: stateDistrict,
        state: state,
        town: town,
        county: county,
        city: city,
        postcode: postcode,
        country: country,
        countryCode: countryCode,
      );
}
