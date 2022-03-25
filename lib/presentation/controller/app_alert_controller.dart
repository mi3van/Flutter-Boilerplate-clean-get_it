import 'dart:collection';

import 'package:clean_boilerplate/domain/common/entity/alert.dart';
import 'package:clean_boilerplate/presentation/contract/model_controller/app_alert_model_controller_mixin.dart';
import 'package:flutter/foundation.dart';

class AppAlertController implements AppAlertModelControllerMixin {
  late final _alertsQueue = Queue<Alert>();
  @override
  late final currentAlert = ValueNotifier<Alert?>(null);
  @override
  late final currentSnackBar = ValueNotifier<String?>(null);

  @override
  void showExceptionAlert(Exception exception) {
    _setAlertToShow(
      Alert(message: exception.toString(), type: AlertType.error),
    );
  }

  @override
  void showInfoAlert(String infoMessage) {
    _setAlertToShow(
      Alert(message: infoMessage, type: AlertType.info),
    );
  }

  @override
  void showWarningAlert(String warningMessage) {
    _setAlertToShow(
      Alert(message: warningMessage, type: AlertType.warning),
    );
  }

  @override
  void showSnackBar(String message) {
    currentSnackBar.value = message;
    currentSnackBar.value = null;
  }

  _setAlertToShow(Alert alert) {
    _alertsQueue.addFirst(alert);
    _updateCurrentAlert();
  }

  @override
  dismissLastAlert() {
    _alertsQueue.removeLast();
    _updateCurrentAlert();
  }

  _updateCurrentAlert() =>
      currentAlert.value = _alertsQueue.isEmpty ? null : _alertsQueue.last;
}
