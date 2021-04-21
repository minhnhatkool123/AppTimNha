import 'package:flutter/material.dart';
import 'package:test_getx/Models/screen_model.dart';
import 'package:get/get.dart';
import 'package:test_getx/Views/user_page.dart';

class TabNavigatorUser extends StatelessWidget {
  final ScreenModel model;
  const TabNavigatorUser({this.model});
  @override
  Widget build(BuildContext context) {
    //print('user');
    return Navigator(
      key: Get.nestedKey(model.navKey),
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (_) => UserPage(
          model: model,
        ),
      ),
    );
  }
}
