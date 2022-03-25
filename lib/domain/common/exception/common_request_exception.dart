import 'package:clean_boilerplate/domain/common/exception/base_exception.dart';

class CommonRequestException extends BaseException {
  static const _defaultMessage = 'Request result exception';

  CommonRequestException({String? message}) : super(message ?? _defaultMessage);
}
