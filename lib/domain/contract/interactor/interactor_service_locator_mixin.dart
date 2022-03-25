import 'package:clean_boilerplate/domain/contract/controller/app_alert_controller_mixin.dart';
import 'package:clean_boilerplate/domain/contract/controller/app_controller_mixin.dart';
import 'package:clean_boilerplate/domain/contract/controller/geocode_controller_mixin.dart';
import 'package:clean_boilerplate/domain/contract/repository/geocode_repository_mixin.dart';

mixin InteractorServiceLocatorMixin on _ControllerServiceLocator {
  bool get isDebugMode;

  GeocodeRepositoryMixin get geocodeRepository;
}

mixin _ControllerServiceLocator {
  AppControllerMixin get appController;
  AppAlertControllerMixin get appAlertController;

  GeocodeControllerMixin get geocodeController;
}
