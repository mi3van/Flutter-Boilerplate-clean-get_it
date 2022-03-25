import 'package:clean_boilerplate/data/api/osm_api.dart';
import 'package:clean_boilerplate/data/contract/geocode_api_mixin.dart';

abstract class ApiFactory {
  static GeocodeApiMixin get geocodeApi => OsmApi();
}
