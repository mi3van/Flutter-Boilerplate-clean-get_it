import 'dart:io';

import 'package:clean_boilerplate/domain/common/constant.dart';
import 'package:clean_boilerplate/presentation/config.dart';
import 'package:clean_boilerplate/presentation/contract/entity/pages.dart';
import 'package:clean_boilerplate/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class UiNavigationController {
  static String get defaultRoute => defaultPage.route;

  static Map<String, WidgetBuilder> get routes =>
      {for (var pages in Pages.values) pages.route: pages.widgetBuilder()};

  void popPage(BuildContext context) {
    if (ModalRoute.of(context)?.settings.name == defaultRoute) {
      _checkConfirmPressAndExit();
    } else {
      Navigator.pop(context);
    }
  }

  void popToPage(
    BuildContext context,
    Pages page,
  ) {
    Navigator.of(context).popUntil(ModalRoute.withName(page.route));
  }

  Future pushPage({
    required BuildContext context,
    required Pages page,
    Object? arguments,
  }) {
    return Navigator.of(context).pushNamed(
      page.route,
      arguments: arguments,
    );
  }

  Future replaceLastOnToPage({
    required BuildContext context,
    required Pages page,
    Object? arguments,
  }) {
    return Navigator.of(context).pushReplacementNamed(
      page.route,
      arguments: arguments,
    );
  }

  Future replaceLastOnToPageExitAnim({
    required BuildContext context,
    required Pages page,
    Object? arguments,
  }) {
    return Navigator.of(context).popAndPushNamed(
      page.route,
      arguments: arguments,
    );
  }

  Future replaceAllToPage({
    required BuildContext context,
    required Pages page,
    Object? arguments,
  }) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      page.route,
      (Route route) => false,
      arguments: arguments,
    );
  }

  Future replaceToPageUntil({
    required BuildContext context,
    required Pages newPage,
    required Pages untilPage,
    Object? arguments,
  }) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      newPage.route,
      ModalRoute.withName(untilPage.route),
      arguments: arguments,
    );
  }

  static int _previousPopTimeMsForExit = 0;

  void _checkConfirmPressAndExit() {
    if (kIsWeb) {
      return;
    }
    final nowTimeMs = DateTime.now().millisecondsSinceEpoch;
    final difference = nowTimeMs - _previousPopTimeMsForExit;
    if (difference > twoSecondsInMs) {
      cLocator.appAlertMC.showSnackBar('Press back again to leave');
      _previousPopTimeMsForExit = nowTimeMs;
    } else {
      if (Platform.isAndroid) {
        SystemNavigator.pop();
      } else {
        exit(0);
      }
    }
  }
}
