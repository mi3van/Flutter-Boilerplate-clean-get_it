import 'package:clean_boilerplate/presentation/controller/ui_navigation_controller.dart';
import 'package:clean_boilerplate/presentation/flutter_ui/common/theme.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean boilerplate',
      theme: appTheme,
      initialRoute: UiNavigationController.defaultRoute,
      routes: UiNavigationController.routes,
    );
  }
}
