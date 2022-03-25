import 'package:clean_boilerplate/presentation/flutter_ui/pages/geocode_page.dart';
import 'package:clean_boilerplate/presentation/flutter_ui/pages/splash_page.dart';
import 'package:flutter/widgets.dart';

enum Pages { geocode, splash }

extension PagesRouteExtension on Pages {
  String get route => '/$name';
}

extension PagesBuilderExtension on Pages {
  WidgetBuilder widgetBuilder() {
    switch (this) {
      case Pages.splash:
        return (context) => SplashPage();
      case Pages.geocode:
      default:
        return (context) => GeocodePage();
    }
  }
}
