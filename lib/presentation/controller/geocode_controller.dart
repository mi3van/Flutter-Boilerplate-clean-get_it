import 'dart:async';

import 'package:clean_boilerplate/domain/common/entity/address.dart';
import 'package:clean_boilerplate/presentation/contract/model_controller/geocode_model_controller_mixin.dart';
import 'package:clean_boilerplate/service_locator.dart';
import 'package:flutter/foundation.dart';

class GeocodeController implements GeocodeModelControllerMixin {
  late ValueNotifier<Address?> _savedAddress;
  late ValueNotifier<bool> _isShowAddressLoader;

  GeocodeController() {
    onInit();
  }

  @override
  void setAddress(Address address) {
    _savedAddress.value = address;
  }

  @override
  void showAddressLoader() {
    _setShowAddressLoader(true);
  }

  @override
  void hideAddressLoader() {
    _setShowAddressLoader(false);
  }

  void _setShowAddressLoader(bool isShow) {
    _isShowAddressLoader.value = isShow;
  }

  @override
  ValueNotifier<Address?> get savedAddress => _savedAddress;

  @override
  ValueNotifier<bool> get isShowAddressLoader => _isShowAddressLoader;

  @override
  FutureOr onInit() {
    _savedAddress = ValueNotifier<Address?>(null);
    _isShowAddressLoader = ValueNotifier(false);
  }

  @override
  FutureOr onDispose() {
    _savedAddress.dispose();
    _isShowAddressLoader.dispose();
  }

  @override
  Future updateCurrentAddress(
      {required double? latitude, required double? longitude}) {
    return cLocator.geocodeInteractor
        .updateCurrentAddress(latitude: latitude, longitude: longitude);
  }
}
