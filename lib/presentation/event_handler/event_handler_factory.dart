import 'package:clean_boilerplate/presentation/contract/event_handler/alert_event_handler_mixin.dart';
import 'package:clean_boilerplate/presentation/event_handler/platform_alert_event_handler/alert_event_handler_factory.dart';

class EventHandlerFactory {
  static AlertEventHandlerMixin get alertEventHandler =>
      AlertEventHandlerFactory.getAlertEventHandler();
}
