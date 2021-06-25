import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/Const/constance.dart';
import 'package:test_getx/Controllers/main_controller.dart';
import 'package:test_getx/Controllers/root_controller.dart';
import 'package:test_getx/Root/map_root.dart';
import 'package:test_getx/Views/all_feature_room.dart';
import 'package:test_getx/Views/detail_room.dart';
import 'package:test_getx/Views/homepage.dart';
import 'package:test_getx/Views/login/login_page.dart';
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
        // primarySwatch: Colors.blue,

        primarySwatch: MaterialColor(
          // #4877F9
          0xff4877F9,
          const <int, Color>{
            50: const Color.fromRGBO(72, 119, 248, 1),
            100: const Color.fromRGBO(72, 119, 248, 1),
            200: const Color.fromRGBO(72, 119, 248, 1),
            300: const Color.fromRGBO(72, 119, 248, 1),
            400: const Color.fromRGBO(72, 119, 248, 1),
            500: const Color.fromRGBO(72, 119, 248, 1),
            600: const Color.fromRGBO(72, 119, 248, 1),
            700: const Color.fromRGBO(72, 119, 248, 1),
            800: const Color.fromRGBO(72, 119, 248, 1),
            900: const Color.fromRGBO(72, 119, 248, 1),
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
