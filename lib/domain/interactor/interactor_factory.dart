import 'package:clean_boilerplate/domain/contract/interactor/geocode_interactor_mixin.dart';
import 'package:clean_boilerplate/domain/interactor/geocode_interactor.dart';

abstract class InteractorFactory {
  static GeocodeInteractorMixin get geocodeInteractor => GeocodeInteractor();
}
