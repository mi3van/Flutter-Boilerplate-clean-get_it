import 'package:clean_boilerplate/presentation/contract/model_controller/app_alert_model_controller_mixin.dart';
import 'package:clean_boilerplate/presentation/contract/model_controller/app_model_controller_mixin.dart';
import 'package:clean_boilerplate/presentation/contract/model_controller/geocode_model_controller_mixin.dart';

mixin ModelControllerHolderMixin {
  AppModelControllerMixin get appMC;
  AppAlertModelControllerMixin get appAlertMC;
  GeocodeModelControllerMixin get geocodeMC;
}
