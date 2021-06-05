import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:test_getx/Const/constance.dart';
import 'package:test_getx/Controllers/room_detail_controller.dart';
import 'package:test_getx/Views/ontap_image.dart';
import 'package:test_getx/Views/share/detail_image.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailRoom extends GetWidget<RoomDetailController> {
  final List<String> ids = ['1002', '1', '10', '100', '1003', '1004', '1006'];
  final List<String> listImageTest = [
    'https://picsum.photos/id/1002/200/300',
    'https://picsum.photos/id/1/200/300',
    'https://picsum.photos/id/10/200/300',
    'https://picsum.photos/id/100/200/300',
    'https://picsum.photos/id/1003/200/300',
    'https://picsum.photos/id/1004/200/300',
    'https://picsum.photos/id/1006/200/300',
    'https://picsum.photos/id/1008/200/300',
  ];
  final String id; // = Get.arguments;

  DetailRoom(this.id);
  //final newFormat=DateFormat

  final String kool = '76576576,89';
  final String lorem =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum ";
  //final RoomDetailController roomDetailController = Get.find();
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      await controller
          .getRoomDetail(id); //roomDetailController.getRoomDetail(id);
    });
    String urlMap = '';
    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: 0,
        elevation: 1,
        shadowColor: Colors.black,
        centerTitle: true,
        backgroundColor: backGroundColorHead,
        title: Text(
          'Chi tiết phòng',
          style: TextStyle(fontSize: 20, color: textInfoColor),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => !controller.isLoading.value
                ? Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    child: _allDetailsAboutRoom(
                      context,
                      2,
                      2,
                      false,
                      listImages: controller
                          .roomDetail.value.accommodation.images
                          .map((e) => e.src)
                          .toList(),
                    ),
                  )
                : Container()),

            Obx(() {
              return !controller.isLoading.value
                  ? (controller.roomDetail.value.accommodation.images.length ==
                          4
                      ? Container(
                          padding: EdgeInsets.only(top: 2),
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width,
                          child: _allDetailsAboutRoom(context, 2, 2, false,
                              listImages: controller
                                  .roomDetail.value.accommodation.images
                                  .skip(2)
                                  .map((e) => e.src)
                                  .toList(),
                              skipLengthFour: 1),
                        )
                      : Container(
                          margin: EdgeInsets.only(top: 2),
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.width,
                          child: _allDetailsAboutRoom(context, 3, 3, true)))
                  : Container(
                      child: CircularProgressIndicator(),
                    );
            }),
            // Container(
            //   margin: EdgeInsets.only(top: 2),
            //   height: MediaQuery.of(context).size.height / 6,
            //   width: MediaQuery.of(context).size.width,
            //   child: _allDetailsAboutRoom(context, 3, 3, true),
            // ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
              alignment: Alignment.topLeft,
              child: Text(
                "PHÒNG TRỌ SATIVA",
                style: TextStyle(color: textInfoColor, fontSize: 12),
                textAlign: TextAlign.start,
              ),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 21,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  '${controller.roomDetail.value.accommodation.title}',
                            ),
                            WidgetSpan(
                              child: Container(
                                margin: EdgeInsets.only(left: 5, bottom: 2),
                                width: 18,
                                height: 18,
                                child:
                                    Image.asset('assets/images/tichxanh.png'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
            Obx(
              () => Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                //alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'GIÁ SATIVA: ',
                      ),
                      TextSpan(
                        text:
                            '${controller.roomDetail.value.accommodation?.retail} triệu VND/phòng',
                        //text: '${kool.substring(0, 4)} triệu VND/phòng',
                        style: TextStyle(
                          color: textPriceColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'ĐÃ Ở',
                        style: TextStyle(fontSize: 12, color: textInfoColor),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '0/6',
                        style: TextStyle(
                            fontSize: 18,
                            color: textPriceColor,
                            fontWeight: FontWeight.w600),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Container(
                      //   width: 20,
                      //   height: 20,
                      //   child: Image.asset('assets/images/electric.png'),
                      // ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      // Text(
                      //   '3.5k',
                      //   style: TextStyle(
                      //       fontSize: 12,
                      //       color: textInfoColor,
                      //       fontWeight: FontWeight.w600),
                      // ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'DIỆN TÍCH',
                        style: TextStyle(fontSize: 12, color: textInfoColor),
                      ),
                      SizedBox(height: 5),
                      Obx(
                        () => Text(
                          '${controller.roomDetail.value.accommodation?.area}m2',
                          //'99m2',
                          style: TextStyle(
                              fontSize: 18,
                              color: textPriceColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'ĐẶT CỌC',
                        style: TextStyle(fontSize: 12, color: textInfoColor),
                      ),
                      SizedBox(height: 5),
                      Obx(
                        () => Text(
                          '${controller.roomDetail.value.accommodation?.retail}tr',
                          //'9.97tr',
                          style: TextStyle(
                              fontSize: 18,
                              color: textPriceColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 10,
              color: backGroundColorHead,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 10),
              margin: EdgeInsets.only(left: 10),
              child: Text('Lưu ý', style: TextStyle(fontSize: 20)),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 15),
              margin: EdgeInsets.only(left: 10),
              child: Text(
                'SỨC CHỨA',
                style: TextStyle(fontSize: 15, color: textInfoColor),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '4 người +',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 171, 29, 1),
                    ),
                  ),
                  Text(
                    '3 người',
                    style: TextStyle(
                      color: Color.fromRGBO(30, 219, 75, 1),
                    ),
                  ),
                  Text(
                    '2 người',
                    style: TextStyle(
                      color: Color.fromRGBO(15, 137, 161, 1),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 10,
                    height: 13,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 171, 29, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 10,
                    height: 13,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(30, 219, 75, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3 - 10,
                    height: 13,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(15, 137, 161, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Chật'),
                  Text('Ổn'),
                  Text('Rộng'),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 10,
              color: backGroundColorHead,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              margin: EdgeInsets.only(left: 10),
              child: Text('Chi tiết', style: TextStyle(fontSize: 20)),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              //padding: EdgeInsets.only(bottom: 10),
              child: Obx(() {
                return RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 17),
                      children: controller.isLoading.value
                          ? []
                          : (controller.roomDetail.value.accommodation
                                          .description.length >
                                      2 &&
                                  !controller.showAll.value
                              ? [
                                  TextSpan(
                                      text: controller.roomDetail.value
                                              .accommodation.description[0] +
                                          '\n'),
                                  TextSpan(
                                      text: controller.roomDetail.value
                                              .accommodation.description[1] +
                                          '...\n')
                                ]
                              : controller
                                  .roomDetail.value.accommodation.description
                                  .map((des) => TextSpan(text: '$des\n'))
                                  .toList())
                      // : controller
                      //     .roomDetail.value.accommodation.description
                      //     .map((des) => TextSpan(text: '$des\n'))
                      //     .toList()
                      // text: (controller.roomDetail.value.accommodation.title
                      //                 .length >
                      //             150 &&
                      //         !controller.showAll.value)
                      //     ? controller.roomDetail.value.accommodation.title
                      //             .substring(0, 150) +
                      //         '...'
                      //     : controller
                      //         .roomDetail.value.accommodation.title.obs
                      //         .toString(),

                      ),
                );
              }),
            ),
            Obx(
              () => !controller.isLoading.value &&
                      controller.roomDetail.value.accommodation.description
                              .length >
                          2
                  ? Container(
                      height: 0.3,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                    )
                  : Container(),
            ),
            Obx(
              () => !controller.isLoading.value &&
                      controller.roomDetail.value.accommodation.description
                              .length >
                          2
                  ? Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () {
                            controller.setShowAll();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(() {
                                return Text(
                                  controller.showAll.value
                                      ? 'Thu gọn'
                                      : 'Xem thêm ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromRGBO(72, 119, 248, 1),
                                  ),
                                );
                              }),
                              SizedBox(width: 3),
                              Obx(() {
                                return Icon(
                                  controller.showAll.value
                                      ? Icons.keyboard_arrow_up_sharp
                                      : Icons.keyboard_arrow_down_sharp,
                                  color: Color.fromRGBO(72, 119, 248, 1),
                                  size: 17,
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 10,
              color: backGroundColorHead,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 10),
              margin: EdgeInsets.only(left: 10),
              child: Text('Địa chỉ', style: TextStyle(fontSize: 20)),
            ),
            GestureDetector(
              onTap: () async => {
                urlMap = 'https://www.google.com/maps/place/${controller.roomDetail.value.accommodation?.address?.street?.replaceAll(RegExp('\\s+'), '+')},+'
                    '${controller.roomDetail.value.accommodation?.address?.ward?.replaceAll(RegExp('\\s+'), '+')},+'
                    '${controller.roomDetail.value.accommodation?.address?.district?.replaceAll(RegExp('\\s+'), '+')},+'
                    '${controller.roomDetail.value.accommodation?.address?.province?.replaceAll(RegExp('\\s+'), '+')}',
                print(urlMap),
                if (await canLaunch(urlMap))
                  {
                    await launch(urlMap),
                  }
                else
                  {
                    throw 'Could not open map',
                  }
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Container(
                      //margin: EdgeInsets.only(bottom: 2),
                      width: 20,
                      height: 20,
                      child: Icon(
                        Icons.location_on,
                        size: 20,
                        color: textColorForm,
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Obx(
                        () => RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    '${controller.roomDetail.value.accommodation?.address?.street}, '
                                    '${controller.roomDetail.value.accommodation?.address?.ward}, '
                                    '${controller.roomDetail.value.accommodation?.address?.district}, '
                                    '${controller.roomDetail.value.accommodation?.address?.province}',

                                //'42/36/23 Hoàng hoa thám . Nguyễn gia Trí, Phường 25, Quận Bình Thạnh, Hồ Chí Minh',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () /*async*/ => {
                Get.defaultDialog(
                    title: 'Xác nhận',
                    content: Text('Bạn muốn gọi đến số 0926423678'),
                    textCancel: 'Hủy',
                    textConfirm: 'Gọi',
                    cancelTextColor: Colors.black,
                    confirmTextColor: Colors.white,
                    buttonColor: textColorForm,
                    //confirm: Text("Gọi", style: TextStyle(color: Colors.black)),
                    barrierDismissible: false,
                    //onConfirm: () => Navigator.pop(context),

                    onConfirm: () async => {
                          if (await canLaunch('tel:0926423678'))
                            {
                              await launch('tel:0926423678'),
                              Navigator.pop(context)
                            }
                          else
                            {throw 'Could not call', Navigator.pop(context)}
                        })
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                padding: EdgeInsets.only(bottom: 10),
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Container(
                      //margin: EdgeInsets.only(bottom: 10),
                      width: 20,
                      height: 20,
                      child: Icon(
                        Icons.phone,
                        size: 20,
                        color: textColorForm,
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Số điện thoại: 0926423678',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 10,
              color: backGroundColorHead,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 10),
              margin: EdgeInsets.only(left: 10),
              child: Text('Ngày đăng', style: TextStyle(fontSize: 20)),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              padding: EdgeInsets.only(bottom: 10),
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Container(
                    //margin: EdgeInsets.only(bottom: 10),
                    width: 20,
                    height: 20,
                    child: Icon(
                      Icons.calendar_today_sharp,
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Obx(
                      () => RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                                text: controller.isLoading.value
                                    ? ''
                                    : '${DateFormat('dd/MM/yyyy').format(controller.roomDetail.value.timeStart)}' //'Hôm nay -15/04/2021',
                                ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _allDetailsAboutRoom(
      BuildContext context, int itemCount, int cross, bool check,
      {List<String> listImages = const [''], int skipLengthFour = 0}) {
    return Container(
      child: StaggeredGridView.countBuilder(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: cross,
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,
        itemCount: itemCount, //oomController.roomList.length,
        itemBuilder: (context, index) {
          if (!check /*index != 3*/) {
            return OntapImage(
              imageFile: listImages[index],
              onImageTap: () => Navigator.push(
                context,
                _createGalleryDetaiRoute(
                    controller.roomDetail.value.accommodation.images
                        .map((e) => e.src)
                        .toList(),
                    skipLengthFour == 0 ? index : index + 2),
              ),
              // imageFile: controller.isLoading.value == false
              //     ? '${controller.roomDetail.value.accommodation.images[index].src}'
              //     : 'https://picsum.photos/id/${ids.skip(2).toList()[index]}/200/300',
              // onImageTap: () => Navigator.push(
              //     context,
              //     _createGalleryDetaiRoute(
              //         controller.roomDetail.value.accommodation.images
              //             .map((e) => e.src)
              //             .toList() /*listImageTest*/,
              //         index)),
            );
          } else {
            if (index != 2) {
              return Obx(
                () => Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width / 3,
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      _createGalleryDetaiRoute(
                          controller.roomDetail.value.accommodation.images
                              .map((e) => e.src)
                              .toList() /*listImageTest*/,
                          index + 2),
                    ),
                    child: Image.network(
                      controller.isLoading.value == false
                          ? controller.roomDetail.value.accommodation.images
                              .skip(2)
                              .toList()[index]
                              .src
                          : listImageTest.skip(2).toList()[index],
                      //listImageTest.skip(2).toList()[index],
                      //'https://picsum.photos/id/${ids.skip(2).toList()[index]}/200/300',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            } else {
              //return Container();
              return Obx(
                () => Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 3,
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          _createGalleryDetaiRoute(
                              controller.roomDetail.value.accommodation.images
                                  .map((e) => e.src)
                                  .toList() /*listImageTest*/,
                              index + 2),
                        ),
                        child: Image.network(
                          controller.isLoading.value == false
                              ? controller.roomDetail.value.accommodation.images
                                  .skip(2)
                                  .toList()[index]
                                  .src
                              : listImageTest.skip(2).toList()[index],
                          //listImageTest.skip(2).toList()[index],
                          //'https://picsum.photos/id/${ids.[index]}/200/300',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    if (controller.isLoading.value == false &&
                        controller
                                .roomDetail.value.accommodation.images.length >
                            5)
                      Container(
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width / 3,
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                        child: InkWell(
                          onTap: () => Navigator.push(
                            context,
                            _createGalleryDetaiRoute(
                                controller.isLoading.value == false
                                    ? controller
                                        .roomDetail.value.accommodation.images
                                        .map((e) => e.src)
                                        .toList()
                                    : listImageTest,
                                index + 2),
                          ),
                          child: Center(
                            child: Text(
                              controller.isLoading.value == false
                                  ? '+${controller.roomDetail.value.accommodation.images.length - 5}'
                                  : '+${listImageTest.length - 5}',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    //: Container(),
                  ],
                ),
              );
            }
          }
        },
        staggeredTileBuilder: (index) => new StaggeredTile.fit(1),
      ),
    );
  }

  MaterialPageRoute _createGalleryDetaiRoute(
      List<String> imagePaths, int index) {
    return MaterialPageRoute(
      builder: (context) =>
          DetailImage(listImageTest: imagePaths, index: index),
    );
  }
}
