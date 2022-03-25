import 'dart:io';

import 'package:clean_boilerplate/presentation/contract/event_handler/alert_event_handler_mixin.dart';
import 'package:clean_boilerplate/presentation/event_handler/platform_alert_event_handler/material_alert_event_handler.dart';
import 'package:flutter/foundation.dart';

class AlertEventHandlerFactory {
  static AlertEventHandlerMixin getAlertEventHandler() {
    if (kIsWeb) {
      return MaterialAlertEventHandler();
    } else if (Platform.isAndroid) {
      return MaterialAlertEventHandler();
    } else {
      return MaterialAlertEventHandler();
    }
  }
}
