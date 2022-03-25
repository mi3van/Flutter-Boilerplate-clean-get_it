import 'package:clean_boilerplate/domain/contract/interactor/geocode_interactor_mixin.dart';
import 'package:clean_boilerplate/presentation/contract/reloadable_mixin.dart';
import 'package:clean_boilerplate/presentation/contract/service_locator/model_controller_holder_mixin.dart';
import 'package:clean_boilerplate/presentation/controller/ui_navigation_controller.dart';

mixin ControllerServiceLocatorMixin on ModelControllerHolderMixin {
  Set<ReloadableMixin> get reloadableControllerInScope;

  UiNavigationController get navigationController;

  GeocodeInteractorMixin get geocodeInteractor;
}
