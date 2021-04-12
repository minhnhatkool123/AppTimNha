import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/Views/all_feature_room.dart';
import 'package:test_getx/Views/detail_room.dart';
import 'package:test_getx/Views/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          // visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/featureall', page: () => AllFeatureRoom()),
        GetPage(name: '/detailroom', page: () => DetailRoom()),
      ],
      home: SafeArea(
        child: Scaffold(
          body: HomePage(),
        ),
      ),
    );
  }
}
