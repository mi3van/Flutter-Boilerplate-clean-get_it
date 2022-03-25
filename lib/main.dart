import 'dart:async';
import 'dart:io';

import 'package:clean_boilerplate/presentation/flutter_ui/application.dart';
import 'package:clean_boilerplate/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(() async {
    initServiceLocator();
    runApp(const Application());
  }, (error, stack) {
    if (kDebugMode) {
      print(error);
    }
    // Add Error-catch logic or send analytics
    exit(1);
  });
}
