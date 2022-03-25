import 'package:clean_boilerplate/domain/contract/controller/app_controller_mixin.dart';
import 'package:clean_boilerplate/presentation/contract/entity/boot_status.dart';
import 'package:flutter/widgets.dart';

mixin AppModelControllerMixin
    on AppControllerMixin<BuildContext>, AppModelMixin {}

mixin AppModelMixin {
  ValueNotifier<BootStatus?> get bootStatus;
  ValueNotifier<bool> get isShowAppLoader;
}
