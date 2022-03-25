import 'package:clean_boilerplate/domain/common/exception/base_exception.dart';

class CommonInputValueException extends BaseException {
  static const String _defaultMessage = 'Invalid input exception';

  CommonInputValueException({String? message})
      : super(message ?? _defaultMessage);
}
