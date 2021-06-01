import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:test_getx/Const/constance.dart';
import 'package:test_getx/Controllers/room_detail_controller.dart';
import 'package:test_getx/Controllers/roomcontroller.dart';
import 'package:test_getx/Views/detail_room.dart';
import 'package:test_getx/Views/share/roomitem.dart';

class AllFeatureRoom extends StatelessWidget {
  final RoomController roomController = Get.find();
  //StatelessWidget {
  //final RoomController roomController = Get.find();

  //const AllFeatureRoom({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.black,
        centerTitle: true,
        backgroundColor: backGroundColorHead,
        title: Text(
          'Phòng nổi bật',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        leading: IconButton(
          iconSize: 25,
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
          onPressed: () => Get.back(id: 1),
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: listViewNew(),
      ),
    );
  }

  Widget listViewNew() {
    return Obx(() {
      return Stack(
        children: [
          StaggeredGridView.countBuilder(
            controller: roomController.scrollController,
            physics: BouncingScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 15.0,
            itemCount: roomController.roomList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () => Get.to(
                      () => DetailRoom(roomController.roomList[index].id),
                      binding: BindingsBuilder(
                          () => Get.create(() => RoomDetailController()))),
                  child: RoomItem(room: roomController.roomList[index]));
            },
            staggeredTileBuilder: (index) => new StaggeredTile.fit(1),
          ),
          roomController.isLoading.value == true
              ? Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: CircularProgressIndicator(),
                    height: 20.0,
                    width: 20.0,
                  ),
                )
              : Container()
        ],
      );
    });
  }
}
