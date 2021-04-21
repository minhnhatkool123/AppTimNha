import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/Controllers/main_controller.dart';
import 'package:test_getx/Controllers/root_controller.dart';
import 'package:test_getx/Root/map_root.dart';
import 'package:test_getx/Views/all_feature_room.dart';
import 'package:test_getx/Views/detail_room.dart';
import 'package:test_getx/Views/homepage.dart';
import 'package:test_getx/Views/user_page.dart';

import 'Controllers/room_detail_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(
          0xfff73470,
          const <int, Color>{
            50: const Color(0xfff73470),
            100: const Color(0xfff73470),
            200: const Color(0xfff73470),
            300: const Color(0xfff73470),
            400: const Color(0xfff73470),
            500: const Color(0xfff73470),
            600: const Color(0xfff73470),
            700: const Color(0xfff73470),
            800: const Color(0xfff73470),
            900: const Color(0xfff73470),
          },
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      getPages: [
        //GetPage(name: '/', page: () => HomePage()),
        //GetPage(name: '/all-feature-room', page: () => AllFeatureRoom()),
        // GetPage(
        //   name: '/detail-room',
        //   page: () => DetailRoom(),
        //   binding: BindingsBuilder(
        //     () => {
        //       Get.create(() => RoomDetailController()),
        //     },
        //   ),
        // ),
        //GetPage(name: '/user-page', page: () => UserPage()),
      ],
      home: SafeArea(
        child: MapRoot(),
      ),
    );
  }
}
