import 'package:clean_boilerplate/data/api/api_factory.dart';
import 'package:clean_boilerplate/data/contract/geocode_api_mixin.dart';
import 'package:clean_boilerplate/data/repository/geocode_repository.dart';
import 'package:clean_boilerplate/domain/contract/repository/geocode_repository_mixin.dart';

abstract class RepositoryFactory {
  static final GeocodeApiMixin _geocodeApi = ApiFactory.geocodeApi;

  static GeocodeRepositoryMixin get geocodeRepository =>
      GeocodeRepository(_geocodeApi);
}
