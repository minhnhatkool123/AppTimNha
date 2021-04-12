import 'package:get/state_manager.dart';
import 'package:test_getx/Models/room.dart';
import 'package:test_getx/Services/remoteservices.dart';

class RoomController extends GetxController {
  var roomList = <Room>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchRooms();
    super.onInit();
  }

  void fetchRooms() async {
    try {
      isLoading(true);
      var rooms = await RemoteServices.fetchRooms();
      if (rooms != null) {
        roomList.value = rooms;
      }
    } finally {
      isLoading(false);
    }
  }
}
