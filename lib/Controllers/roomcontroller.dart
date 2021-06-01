import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:test_getx/Models/room.dart';
import 'package:test_getx/Services/remoteservices.dart';

class RoomController extends GetxController {
  var roomList = <Datum>[].obs;
  var isLoading = true.obs;

  var page = 1;

  ScrollController scrollController = new ScrollController();

  @override
  void onInit() {
    fetchRooms();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getMoreRooms();
      }
    });
    super.onInit();
  }

  void getMoreRooms() async {
    try {
      isLoading(true);
      await Future.delayed(new Duration(seconds: 1));
      var rooms = await RemoteServices.fetchRooms(page: ++page);
      if (rooms != null) {
        roomList.addAll(rooms.data.data);
        //print(roomList.length);
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchRooms() async {
    try {
      print('vao fetchRooms');
      isLoading(true);
      var rooms = await RemoteServices.fetchRooms();

      if (rooms != null) {
        roomList.value = rooms.data.data;
      }
    } finally {
      isLoading(false);
    }
  }
}
