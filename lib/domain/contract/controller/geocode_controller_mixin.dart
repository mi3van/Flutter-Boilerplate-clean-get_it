import 'package:clean_boilerplate/domain/common/entity/address.dart';
import 'package:clean_boilerplate/domain/contract/interactor/geocode_interactor_mixin.dart';

mixin GeocodeControllerMixin implements GeocodeInteractorMixin {
  void setAddress(Address address);

  void showAddressLoader();

  void hideAddressLoader();
}
