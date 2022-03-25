import 'package:clean_boilerplate/domain/common/entity/alert.dart';
import 'package:flutter/widgets.dart';

mixin AlertEventHandlerMixin {
  void showSimpleAlert(BuildContext context, Alert alert);

  void hideCurrentAlert(BuildContext context);

  void showSnackBar(BuildContext context, String message);

  void hideCurrentSnackBar(BuildContext context);
}
