import 'package:clean_boilerplate/domain/common/entity/alert.dart';
import 'package:clean_boilerplate/domain/contract/controller/app_alert_controller_mixin.dart';
import 'package:flutter/foundation.dart';

mixin AppAlertModelControllerMixin
    on AppAlertControllerMixin, AppAlertModelMixin {}

mixin AppAlertModelMixin {
  ValueNotifier<Alert?> get currentAlert;
  ValueNotifier<String?> get currentSnackBar;
}
