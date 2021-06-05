import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:test_getx/Const/constance.dart';
import 'package:test_getx/Controllers/room_detail_controller.dart';
import 'package:test_getx/Controllers/roomcontroller.dart';
import 'package:test_getx/Controllers/root_controller.dart';
import 'package:test_getx/Models/screen_model.dart';
import 'package:test_getx/Views/banner.dart';
import 'package:test_getx/Views/detail_room.dart';
import 'package:test_getx/Views/share/custom_dialog.dart';
import 'package:test_getx/Views/share/district.dart';
import 'package:test_getx/Views/share/roomitem.dart';

class HomePage extends StatelessWidget {
  final RoomController roomController = Get.put(RoomController());

  final ScreenModel model;
  HomePage({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200.0,
              //padding: EdgeInsets.all(10.0),
              color: backGroundColorHead,
              width: MediaQuery.of(context).size.width,
              child: BannerApp(),
            ),
            Container(
              height: 35.0,
              width: MediaQuery.of(context).size.width,
              color: backGroundColorHead,
              padding: EdgeInsets.only(left: 10.0, top: 5.0),
              child: Text(
                "Xu hướng tìm kiếm",
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
            ),
            Container(
              color: backGroundColorHead,
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () => showGeneralDialog(
                        context: context,
                        barrierDismissible: false,
                        pageBuilder: (BuildContext context, Animation animation,
                            Animation secondAnimation) {
                          return Center(
                            child: Container(
                              // decoration: BoxDecoration(
                              //   color: Colors.white,
                              //   borderRadius:
                              //       BorderRadius.all(Radius.circular(20)),
                              //   border:
                              //       Border.all(color: Colors.white, width: 10),
                              // ),
                              width: MediaQuery.of(context).size.width - 30,
                              height: MediaQuery.of(context).size.height - 100,
                              child: CustomDialog(),
                            ),
                          );
                        }), //showDialog(context: context, builder: builder),
                    child: District(
                      imageUrl: 'assets/images/binhthanh.jpg',
                      title: 'Hồ Chí Minh',
                    ),
                  )),
                  SizedBox(width: 16.0),
                  Expanded(
                      child: District(
                    imageUrl: 'assets/images/quan10.jpg',
                    title: 'Hà Nội',
                  )),
                  SizedBox(width: 16.0),
                  Expanded(
                      child: District(
                    imageUrl: 'assets/images/quan7.jpg',
                    title: 'Đà Nẵng',
                  )),
                ],
              ),
            ),
            // Container(
            //   color: backGroundColorHead,
            //   padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 15.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Expanded(
            //           child: District(
            //         imageUrl: 'assets/images/quan1.jpg',
            //         title: 'Quận 1',
            //       )),
            //       SizedBox(width: 16.0),
            //       Expanded(
            //           child: District(
            //         imageUrl: 'assets/images/thuduc.jpg',
            //         title: 'Thủ Đức',
            //       )),
            //       SizedBox(width: 16.0),
            //       Expanded(
            //           child: District(
            //         imageUrl: 'assets/images/quan3.jpg',
            //         title: 'Quận 3',
            //       )),
            //     ],
            //   ),
            // ),
            Container(
              height: 35.0,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 5.0),
              //color: Colors.red,
              padding: EdgeInsets.only(left: 10.0, top: 5.0),
              child: Row(
                children: [
                  Text(
                    "Phòng nổi bật",
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 25,
                    height: 25,
                    child: Image.asset('assets/images/tichxanh.png'),
                  ),
                ],
              ),
            ),
            Obx(
              () => Container(
                margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                height: roomController.roomList.length == 0 ? 50 : 720,
                width: double.infinity,
                child: listViewNew(),
              ),
            ),
            Container(
              height: 0.3,
              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () => Get.find<RootController>().openAllFeatureRoom(
                      model.navKey), //() => Get.toNamed('/all-feature-room'),
                  child: Text(
                    'Xem tất cả',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromRGBO(72, 119, 248, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listViewNew() {
    return Obx(
      () {
        if (roomController.isLoading.value ||
            roomController.roomList.length == 0)
          return Container(
            margin: EdgeInsets.only(top: 10.0),
            alignment: Alignment.topCenter,
            child: CircularProgressIndicator(),
          );
        else
          return StaggeredGridView.countBuilder(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 15.0,
            itemCount: 6, //oomController.roomList.length,
            itemBuilder: (context, index) {
              return InkWell(
                // onTap: () => Get.to(
                //   () => DetailRoom(roomController.roomList[index]),
                //   binding: BindingsBuilder(
                //     () => {
                //       Get.create(() => RoomDetailController()),
                //     },
                //   ),
                // ),
                // onTap: () => Get.toNamed(
                //   '/detail-room',
                //   arguments: roomController.roomList[index],
                // ),

                onTap: () => Get.to(
                    () => DetailRoom(roomController.roomList[index].id),
                    binding: BindingsBuilder(
                        () => Get.create(() => RoomDetailController()))),
                //() => Get.lazyPut(() => RoomDetailController()))),

                // onTap: () =>
                //     Get.to(() => DetailRoom(roomController.roomList[index].id),
                //         binding: BindingsBuilder(() => {
                //               Get.create(() => RoomDetailController()
                //                   .getRoomDetail(
                //                       roomController.roomList[index].id)),
                //             })),
                child: RoomItem(room: roomController.roomList[index]),
              );
            },
            staggeredTileBuilder: (index) => new StaggeredTile.fit(1),
          );
      },
    );
  }
}
