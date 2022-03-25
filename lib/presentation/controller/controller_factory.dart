import 'package:clean_boilerplate/presentation/contract/model_controller/app_alert_model_controller_mixin.dart';
import 'package:clean_boilerplate/presentation/contract/model_controller/app_model_controller_mixin.dart';
import 'package:clean_boilerplate/presentation/contract/model_controller/geocode_model_controller_mixin.dart';
import 'package:clean_boilerplate/presentation/controller/app_alert_controller.dart';
import 'package:clean_boilerplate/presentation/controller/app_controller.dart';
import 'package:clean_boilerplate/presentation/controller/geocode_controller.dart';
import 'package:clean_boilerplate/presentation/controller/ui_navigation_controller.dart';

class ControllerFactory {
  static AppModelControllerMixin get appController => AppController();

  static AppAlertModelControllerMixin get appAlertController =>
      AppAlertController();

  static UiNavigationController get navigationController =>
      UiNavigationController();

  static GeocodeModelControllerMixin get geocodeController =>
      GeocodeController();
}
