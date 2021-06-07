import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:test_getx/Models/room.dart';
import 'package:test_getx/Models/room_count.dart' as count;
import 'package:test_getx/Services/remoteservices.dart';

class RoomFilterController extends GetxController {
  var roomCount = count.Data().obs;
  var roomList = <Datum>[].obs;
  var isLoading = true.obs;

  //ScrollController scrollController = new ScrollController();
  //var page = 1.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void countRoom(String province, String district,
      {int retail, int area}) async {
    try {
      print('vao count Rooms Filter');
      //isLoading(true);
      var rooms =
          await RemoteServices.countRoom(province, district, retail, area);

      if (rooms != null) {
        roomCount.value = rooms.data;
      }
    } finally {
      //isLoading(false);
    }
  }

  void fetchRooms(String province, String district,
      {int retail, int area, int page = 1}) async {
    try {
      print('vao Fetch Rooms Filter');
      isLoading(true);
      await Future.delayed(new Duration(seconds: 1));
      var rooms = await RemoteServices.filterRoom(
          province, district, retail, area,
          page: page);

      if (rooms != null) {
        roomList.addAll(rooms.data.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
