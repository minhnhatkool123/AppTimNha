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
        child: Stack(
          children: [
            Column(
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
                  margin: EdgeInsets.only(top: 90),
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
                          pageBuilder: (BuildContext context,
                              Animation animation, Animation secondAnimation) {
                            return Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width - 30,
                                height:
                                    MediaQuery.of(context).size.height - 150,
                                child: CustomDialog(1),
                              ),
                            );
                          },
                        ), //showDialog(context: context, builder: builder),
                        child: District(
                          imageUrl: 'assets/images/binhthanh.jpg',
                          title: 'Hồ Chí Minh',
                        ),
                      )),
                      SizedBox(width: 16.0),
                      Expanded(
                          child: GestureDetector(
                        onTap: () => showGeneralDialog(
                          context: context,
                          barrierDismissible: false,
                          pageBuilder: (BuildContext context,
                              Animation animation, Animation secondAnimation) {
                            return Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width - 30,
                                height:
                                    MediaQuery.of(context).size.height - 150,
                                child: CustomDialog(2),
                              ),
                            );
                          },
                        ),
                        child: District(
                          imageUrl: 'assets/images/quan10.jpg',
                          title: 'Hà Nội',
                        ),
                      )),
                      SizedBox(width: 16.0),
                      Expanded(
                          child: GestureDetector(
                        onTap: () => showGeneralDialog(
                          context: context,
                          barrierDismissible: false,
                          pageBuilder: (BuildContext context,
                              Animation animation, Animation secondAnimation) {
                            return Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width - 30,
                                height:
                                    MediaQuery.of(context).size.height - 150,
                                child: CustomDialog(3),
                              ),
                            );
                          },
                        ),
                        child: District(
                          imageUrl: 'assets/images/quan7.jpg',
                          title: 'Đà Nẵng',
                        ),
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
                      onTap: () => Get.find<RootController>()
                          .openAllFeatureRoom(model
                              .navKey), //() => Get.toNamed('/all-feature-room'),
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
            Positioned(
              top: 180,
              right: 10,
              left: 10,
              child: Container(
                padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  //color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  color: backGroundColorHead,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 2,
                      blurRadius: 12,
                      offset: Offset(0.5, 1.5), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => showGeneralDialog(
                              context: context,
                              barrierDismissible: false,
                              pageBuilder: (BuildContext context,
                                  Animation animation,
                                  Animation secondAnimation) {
                                return Center(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 30,
                                    height:
                                        MediaQuery.of(context).size.height - 80,
                                    child: CustomDialog(4),
                                  ),
                                );
                              }),
                          child: Container(
                            height: 60.0,
                            width: 60,
                            decoration: BoxDecoration(
                              //color: Colors.transparent,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/thunder3.png',
                                ),
                                scale: 8,
                                colorFilter: ColorFilter.linearToSrgbGamma(),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.yellow[300],
                                  Colors.amberAccent,
                                  Colors.amber,
                                  Colors.yellow[800],
                                  Colors.orange,
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Tìm kiếm',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 60.0,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/earth.png',
                              ),
                              //scale: 8,
                              colorFilter: ColorFilter.linearToSrgbGamma(),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.tealAccent,
                                Colors.greenAccent,
                                Colors.greenAccent[400],
                                Colors.greenAccent[700],
                                //Colors.cyanAccent,
                                //Colors.cyan,
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Website',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 60.0,
                          width: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                //textPriceColor,
                                Colors.pink[200],
                                Colors.pink,
                                Colors.pink[700],
                              ],
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/adddoc.png'), //NetworkImage(imageUrl),
                              scale: 12,
                              colorFilter: ColorFilter.linearToSrgbGamma(),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Đăng phòng',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
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
