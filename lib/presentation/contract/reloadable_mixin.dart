import 'dart:async';

import 'package:get_it/get_it.dart';

mixin ReloadableMixin on Disposable {
  FutureOr onInit();
}
