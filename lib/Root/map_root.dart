import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/Controllers/root_controller.dart';

class MapRoot extends StatelessWidget {
  final RootController rootController = Get.put(RootController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        int navKey = rootController.currentNavKey;
        Get.back(id: navKey);
        return false;
      },
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: rootController.navMenuIndex.value,
            children: [
              rootController.homPage,
              rootController.userPage,
            ],
          ),
        ),
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: rootController.navMenuIndex.value,
            onTap: (index) {
              rootController.navMenuIndex.value = index;
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Sativa',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline_sharp,
                ),
                label: 'Tài khoản',
              ),
            ],
          );
        }),
      ),
    );
  }
}
