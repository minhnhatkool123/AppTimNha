import 'package:get/get.dart';

import 'package:test_getx/Models/room_detail.dart';
import 'package:test_getx/Services/remoteservices.dart';

class RoomDetailController extends GetxController {
  var showAll = false.obs;
  //var dataDetail = RoomDetailData().obs;
  var roomDetail = DataData().obs;
  //var accommodation = Accommodation().obs;
  var isLoading = true.obs;
  var listImage = <String>[].obs;

  void onInit() {
    //getRoomDetail('60ab69f283fabb0a4cecfb1a');
    super.onInit();
  }

  Future<void> getRoomDetail(String id) async {
    try {
      isLoading(true);
      print(id);
      var rooms = await RemoteServices.fetchRoomDetail(id: id);

      if (rooms != null) {
        print('vao getRoomDetail');
        roomDetail.value = rooms.data.data;
        //rooms.data.data.accommodation.images.map((e) => listImage.add(e.src));
        print(listImage);
        //dataDetail.value = rooms.data;
        //room.value = dataDetail.value.data;
        //accommodation.value = room.value.accommodation;
      }
    } finally {
      isLoading(false);
    }
  }

  void setShowAll() {
    showAll.value = !showAll.value;
  }
}
