import 'package:clean_boilerplate/presentation/contract/event_handler/alert_event_handler_mixin.dart';
import 'package:clean_boilerplate/presentation/contract/service_locator/model_controller_holder_mixin.dart';

mixin UiServiceLocatorMixin on ModelControllerHolderMixin {
  AlertEventHandlerMixin get alertEventHandler;
}
