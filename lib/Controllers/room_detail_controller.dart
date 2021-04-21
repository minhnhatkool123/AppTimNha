import 'package:get/get.dart';

class RoomDetailController extends GetxController {
  var showAll = false.obs;
  void onInit() {
    //setShowAll();
    super.onInit();
  }

  void setShowAll() {
    showAll.value = !showAll.value;
  }
}
