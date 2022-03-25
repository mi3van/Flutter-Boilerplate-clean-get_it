import 'dart:async';

import 'package:clean_boilerplate/domain/common/constant.dart';
import 'package:clean_boilerplate/presentation/contract/entity/boot_status.dart';
import 'package:clean_boilerplate/presentation/contract/entity/pages.dart';
import 'package:clean_boilerplate/presentation/contract/model_controller/app_model_controller_mixin.dart';
import 'package:clean_boilerplate/presentation/contract/reloadable_mixin.dart';
import 'package:clean_boilerplate/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppController implements AppModelControllerMixin {
  @override
  late final bootStatus = ValueNotifier<BootStatus?>(null);
  @override
  late final isShowAppLoader = ValueNotifier(false);

  AppController() {
    // Mock for displaying a splash page.
    scheduleMicrotask(() async => {
          if (kDebugMode)
            {
              await Future.delayed(
                  const Duration(milliseconds: twoSecondsInMs)),
            },
          bootStatus.value = BootStatus.success,
        });
  }

  @override
  Future onAppInitRetry() async {
    await onAppDispose();
    await _onAppInitRetry();
  }

  @override
  Future onAppDispose() async {
    for (ReloadableMixin controller in cLocator.reloadableControllerInScope) {
      await controller.onDispose();
    }
    bootStatus.value = null;
  }

  @override
  void onSuccessAppInit(BuildContext context) async {
    scheduleMicrotask(
      () => cLocator.navigationController
          .replaceAllToPage(context: context, page: Pages.geocode),
    );
  }

  Future _onAppInitRetry() async {
    bootStatus.value = BootStatus.booting;

    try {
      for (ReloadableMixin controller in cLocator.reloadableControllerInScope) {
        await controller.onInit();
      }
      bootStatus.value = BootStatus.success;
    } on Exception catch (e) {
      cLocator.appAlertMC.showExceptionAlert(e);
      bootStatus.value = BootStatus.error;
    }
  }

  @override
  void showAppLoader() {
    _setShowAppLoader(true);
  }

  @override
  void hideAppLoader() {
    _setShowAppLoader(false);
  }

  void _setShowAppLoader(bool isShow) {
    isShowAppLoader.value = isShow;
  }
}
