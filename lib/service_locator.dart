import 'package:clean_boilerplate/data/repository/repository_factory.dart';
import 'package:clean_boilerplate/domain/contract/controller/app_alert_controller_mixin.dart';
import 'package:clean_boilerplate/domain/contract/controller/app_controller_mixin.dart';
import 'package:clean_boilerplate/domain/contract/controller/geocode_controller_mixin.dart';
import 'package:clean_boilerplate/domain/contract/interactor/geocode_interactor_mixin.dart';
import 'package:clean_boilerplate/domain/contract/interactor/interactor_service_locator_mixin.dart';
import 'package:clean_boilerplate/domain/contract/repository/geocode_repository_mixin.dart';
import 'package:clean_boilerplate/domain/interactor/interactor_factory.dart';
import 'package:clean_boilerplate/presentation/contract/event_handler/alert_event_handler_mixin.dart';
import 'package:clean_boilerplate/presentation/contract/model_controller/app_alert_model_controller_mixin.dart';
import 'package:clean_boilerplate/presentation/contract/model_controller/app_model_controller_mixin.dart';
import 'package:clean_boilerplate/presentation/contract/model_controller/geocode_model_controller_mixin.dart';
import 'package:clean_boilerplate/presentation/contract/reloadable_mixin.dart';
import 'package:clean_boilerplate/presentation/contract/service_locator/controller_service_locator_mixin.dart';
import 'package:clean_boilerplate/presentation/contract/service_locator/model_controller_holder_mixin.dart';
import 'package:clean_boilerplate/presentation/contract/service_locator/ui_service_locator_mixin.dart';
import 'package:clean_boilerplate/presentation/controller/controller_factory.dart';
import 'package:clean_boilerplate/presentation/controller/ui_navigation_controller.dart';
import 'package:clean_boilerplate/presentation/event_handler/event_handler_factory.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

GetIt _sl = GetIt.instance;

/// Layers-oriented service locators
final InteractorServiceLocatorMixin iLocator = InteractorLocator();
final ControllerServiceLocatorMixin cLocator = ControllerLocator();
final UiServiceLocatorMixin uiLocator = UiLocator();

void initServiceLocator() {
  /// Register app-controllers for basic model-control.
  _sl.registerLazySingleton(() => ControllerFactory.appController);
  _sl.registerLazySingleton(() => ControllerFactory.appAlertController);
  _sl.registerLazySingleton(() => ControllerFactory.navigationController);

  /// Register event-handler to let control specific
  /// flutter commands with context: show alert, snackbar, etc.
  _sl.registerLazySingleton(() => EventHandlerFactory.alertEventHandler);

  _initLayers();
}

/// Controller is designed to manipulate UI (update binded models),
/// Repository for sending queries to data (API or DB),
/// Interactor is for to be able to send requests to domain logic.
void _initLayers() {
  /// Geocode part
  _sl.registerLazySingleton(() => ControllerFactory.geocodeController);
  _sl.registerLazySingleton(() => RepositoryFactory.geocodeRepository);
  _sl.registerLazySingleton(() => InteractorFactory.geocodeInteractor);
}

class InteractorLocator implements InteractorServiceLocatorMixin {
  @override
  AppControllerMixin get appController => _sl<AppModelControllerMixin>();
  @override
  AppAlertControllerMixin get appAlertController =>
      _sl<AppAlertModelControllerMixin>();
  @override
  GeocodeControllerMixin get geocodeController =>
      _sl<GeocodeModelControllerMixin>();

  @override
  GeocodeRepositoryMixin get geocodeRepository => _sl();

  @override
  bool get isDebugMode => kDebugMode;
}

class UiLocator extends ModelControllerHolder implements UiServiceLocatorMixin {
  @override
  AlertEventHandlerMixin get alertEventHandler => _sl();
}

class ControllerLocator extends ModelControllerHolder
    implements ControllerServiceLocatorMixin {
  @override
  UiNavigationController get navigationController => _sl();

  @override
  GeocodeInteractorMixin get geocodeInteractor => _sl();

  /// Reloadable controllers that are required to initialize or dismiss
  @override
  Set<ReloadableMixin> get reloadableControllerInScope => {
        geocodeMC,
      };
}

abstract class ModelControllerHolder implements ModelControllerHolderMixin {
  @override
  AppModelControllerMixin get appMC => _sl();
  @override
  AppAlertModelControllerMixin get appAlertMC => _sl();
  @override
  GeocodeModelControllerMixin get geocodeMC => _sl();
}
