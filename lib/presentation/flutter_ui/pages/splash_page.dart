import 'package:clean_boilerplate/presentation/contract/entity/boot_status.dart';
import 'package:clean_boilerplate/presentation/contract/model_controller/app_model_controller_mixin.dart';
import 'package:clean_boilerplate/presentation/flutter_ui/pages/abstract_bottom_page.dart';
import 'package:clean_boilerplate/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class SplashPage extends BottomPage {
  SplashPage({Key? key}) : super(key: key);

  @override
  Widget getBuild(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 20,
              height: 20,
              child: _SplashStatus(),
            ),
          ),
        ),
      ),
    );
  }
}

class _SplashStatus extends StatelessWidget with GetItMixin {
  _SplashStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = watchX((AppModelControllerMixin model) => model.bootStatus);

    if (status == BootStatus.success) {
      uiLocator.appMC.onSuccessAppInit(context);
    } else if (status == BootStatus.error) {
      return GestureDetector(
        onTap: uiLocator.appMC.onAppInitRetry,
        child: const Icon(Icons.sync),
      );
    }
    return const CircularProgressIndicator(
      strokeWidth: 2,
    );
  }
}
