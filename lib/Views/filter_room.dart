//import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:test_getx/Const/constance.dart';
import 'package:test_getx/Controllers/room_detail_controller.dart';
import 'package:test_getx/Controllers/room_filter_controller.dart';

import 'package:test_getx/Views/share/roomitem.dart';

import 'detail_room.dart';

class FilterRoom extends StatefulWidget {
  final String province, district;
  final int retail, area;
  FilterRoom(this.province, this.district, this.retail, this.area);
  @override
  _FilterRoomState createState() => _FilterRoomState();
}

class _FilterRoomState extends State<FilterRoom> {
  final RoomFilterController roomFilterController =
      Get.put(RoomFilterController());
  ScrollController scrollController = new ScrollController();
  int page = 1;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      roomFilterController.countRoom(widget.province, widget.district,
          retail: widget.retail, area: widget.area);
      roomFilterController.fetchRooms(widget.province, widget.district,
          retail: widget.retail, area: widget.area, page: 1);
    });

    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          roomFilterController.roomList.length <
              roomFilterController.roomCount.value.data) {
        roomFilterController.fetchRooms(widget.province, widget.district,
            retail: widget.retail, area: widget.area, page: ++page);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.black,
        centerTitle: true,
        backgroundColor: backGroundColorHead,
        title: Text(
          'Phòng tìm kiếm',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        leading: IconButton(
          iconSize: 25,
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: Container(
          child: Obx(
            () {
              if (roomFilterController.roomList.length == 0 &&
                  roomFilterController.isLoading.isFalse) {
                return Container(
                  margin: EdgeInsets.only(top: 10.0),
                  alignment: Alignment.center,
                  child: Center(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.sentiment_dissatisfied,
                          size: 50,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Không có kết quả tìm kiếm',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  )),
                );
              } else
                return Stack(
                  children: [
                    if (roomFilterController.isLoading.value == true)
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          child: CircularProgressIndicator(),
                          height: 20.0,
                          width: 20.0,
                        ),
                      ),
                    //Text('${roomFilterController.roomCount.value?.data}'),
                    StaggeredGridView.countBuilder(
                      physics: BouncingScrollPhysics(),
                      controller: scrollController,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 15.0,
                      itemCount: roomFilterController.roomList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Get.to(
                              () => DetailRoom(
                                  roomFilterController.roomList[index].id),
                              binding: BindingsBuilder(() =>
                                  Get.create(() => RoomDetailController()))),
                          child: RoomItem(
                              room: roomFilterController.roomList[index]),
                        );
                      },
                      staggeredTileBuilder: (index) => new StaggeredTile.fit(1),
                    ),

                    //: SizedBox(),
                  ],
                );
            },
          ),
        ),
      ),
    );
  }
}
