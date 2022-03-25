mixin AppAlertControllerMixin {
  void showExceptionAlert(Exception exception);

  void showInfoAlert(String infoMessage);

  void showWarningAlert(String warningMessage);

  void showSnackBar(String message);

  void dismissLastAlert();
}
