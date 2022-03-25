import 'package:clean_boilerplate/domain/common/entity/alert.dart';
import 'package:clean_boilerplate/presentation/contract/event_handler/alert_event_handler_mixin.dart';
import 'package:clean_boilerplate/service_locator.dart';
import 'package:flutter/material.dart';

class MaterialAlertEventHandler implements AlertEventHandlerMixin {
  @override
  void showSimpleAlert(BuildContext context, Alert alert) {
    // set up the button
    Widget okButton = TextButton(
      child: Text(alert.okBtnText),
      onPressed: () => {hideCurrentAlert(context)},
    );

    // set up the AlertDialog
    AlertDialog alertDialog = AlertDialog(
      title: Text(alert.title),
      content: Text(alert.message),
      actions: [
        okButton,
      ],
    );

    showDialog(context: context, builder: (_) => alertDialog)
        .then((_) => cLocator.appAlertMC.dismissLastAlert());
  }

  @override
  void hideCurrentAlert(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).pop('dialog');

  @override
  void showSnackBar(BuildContext context, String message) {
    hideCurrentSnackBar(context);

    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void hideCurrentSnackBar(BuildContext context) =>
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
}
