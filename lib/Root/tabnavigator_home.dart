import 'package:flutter/material.dart';
import 'package:test_getx/Models/screen_model.dart';
import 'package:get/get.dart';
import 'package:test_getx/Views/homepage.dart';

class TabNavigatorHome extends StatelessWidget {
  final ScreenModel model;
  const TabNavigatorHome({this.model});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(model.navKey),
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (_) => HomePage(
          model: model,
        ),
      ),
    );
  }
}
