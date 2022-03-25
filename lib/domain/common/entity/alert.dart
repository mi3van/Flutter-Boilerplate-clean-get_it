class Alert {
  late final String title;
  final String message;
  final String okBtnText;
  final AlertType type;

  Alert({
    required this.message,
    required this.type,
    String? title,
    this.okBtnText = "OK",
  }) {
    if (title != null) {
      return;
    }
    switch (type) {
      case AlertType.info:
        this.title = "Info";
        break;
      case AlertType.warning:
        this.title = "Warning";
        break;
      case AlertType.error:
        this.title = "Error";
        break;
    }
  }
}

enum AlertType { info, warning, error }
