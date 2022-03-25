mixin AppControllerMixin<C> implements _AppControllerLoaderMixin {
  Future onAppInitRetry();

  Future onAppDispose();

  void onSuccessAppInit(C context);
}

mixin _AppControllerLoaderMixin {
  void showAppLoader();

  void hideAppLoader();
}
