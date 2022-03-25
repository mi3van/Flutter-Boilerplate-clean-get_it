import 'package:clean_boilerplate/domain/common/entity/alert.dart';
import 'package:clean_boilerplate/presentation/contract/model_controller/app_alert_model_controller_mixin.dart';
import 'package:clean_boilerplate/service_locator.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

abstract class BottomPage extends StatelessWidget with GetItMixin {
  BottomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _initBottomPageHandlers(this);

    return getBuild(context);
  }

  Widget getBuild(BuildContext context);

  void _initBottomPageHandlers(GetItMixin getItMixin) {
    // Register observe-handlers for showing alerts
    getItMixin.registerHandler(
        (AppAlertModelControllerMixin alertModel) => alertModel.currentAlert,
        (context, alert, _) {
      if (alert != null) {
        uiLocator.alertEventHandler.showSimpleAlert(context, alert as Alert);
      }
    });

    getItMixin.registerHandler(
        (AppAlertModelControllerMixin alertModel) =>
            (alertModel).currentSnackBar, (context, message, _) {
      if (message != null) {
        uiLocator.alertEventHandler.showSnackBar(context, message as String);
      }
    });
  }
}
