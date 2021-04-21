import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/Controllers/room_detail_controller.dart';
import 'package:test_getx/Models/room.dart';
import 'package:test_getx/Models/screen_model.dart';
import 'package:test_getx/Root/tabnavigator_home.dart';
import 'package:test_getx/Root/tabnavigator_user.dart';
import 'package:test_getx/Views/all_feature_room.dart';
import 'package:test_getx/Views/detail_room.dart';

final screenData = <ScreenModel>[
  ScreenModel(name: 'Home', navKey: 1),
  ScreenModel(name: 'User', navKey: 2),
];

class RootController extends GetxController {
  var navMenuIndex = 0.obs;

  Widget _homePage;
  Widget _userPage;
  Widget get homPage => TabNavigatorHome(model: screenData[0]);
  Widget get userPage => TabNavigatorUser(model: screenData[1]);

  ScreenModel get currentScreenModel => screenData[navMenuIndex()];
  int get currentNavKey => currentScreenModel.navKey;

  // Widget createDetailRoom(Room room) {
  //   print('create_detail_room');
  //   return Navigator(
  //     key: Get.nestedKey(3),
  //     onGenerateRoute: (settings) => MaterialPageRoute(
  //       builder: (_) => DetailRoom(room),
  //     ),
  //   );
  // }

  //Widget get detailRoom => createDetailRoom(null);

  void openAllFeatureRoom(int id) {
    Get.to(() => AllFeatureRoom(), id: id);
  }

  void openDetailRoom(
    Room room,
  ) {
    Get.to(
      () => DetailRoom(room),
      //id: 1,
      binding: BindingsBuilder(
        () => {
          Get.create(() => RoomDetailController()),
        },
      ),
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
