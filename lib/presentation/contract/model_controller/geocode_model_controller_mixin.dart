import 'package:clean_boilerplate/domain/common/entity/address.dart';
import 'package:clean_boilerplate/domain/contract/controller/geocode_controller_mixin.dart';
import 'package:clean_boilerplate/presentation/contract/reloadable_mixin.dart';
import 'package:flutter/foundation.dart';

mixin GeocodeModelControllerMixin
    on GeocodeControllerMixin, GeocodeModelMixin, ReloadableMixin {}

mixin GeocodeModelMixin {
  ValueNotifier<Address?> get savedAddress;
  ValueNotifier<bool> get isShowAddressLoader;
}
