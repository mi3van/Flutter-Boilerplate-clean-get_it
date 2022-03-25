import 'package:clean_boilerplate/domain/common/entity/address.dart';

mixin GeocodeRepositoryMixin {
  Future<Address> getAddress({
    required double latitude,
    required double longitude,
  });
}
