import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:test_getx/Const/constance.dart';
import 'package:test_getx/Views/ontap_image.dart';
import 'package:test_getx/Views/share/detail_image.dart';

class DetailRoom extends StatelessWidget {
  List<String> ids = ['1002', '1', '10', '100'];
  List<String> listImageTest = [
    'https://picsum.photos/id/1002/200/300',
    'https://picsum.photos/id/1/200/300',
    'https://picsum.photos/id/10/200/300',
    'https://picsum.photos/id/100/200/300'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 1,
        shadowColor: Colors.black,
        centerTitle: true,
        backgroundColor: backGroundColorHead,
        title: Text(
          'Chi tiết phòng',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        leading: IconButton(
          iconSize: 25,
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
          onPressed: () => Get.toNamed('/'),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _allDetailsAboutRoom(context),
      ),
    );
  }

  Widget _allDetailsAboutRoom(BuildContext context) {
    return Container(
      child: StaggeredGridView.countBuilder(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        itemCount: 4, //oomController.roomList.length,
        itemBuilder: (context, index) {
          return OntapImage(
            imageFile: 'https://picsum.photos/id/${ids[index]}/200/300',
            onImageTap: () => Navigator.push(
                context, _createGalleryDetaiRoute(listImageTest, index)),
          );
        },
        staggeredTileBuilder: (index) => new StaggeredTile.fit(1),
      ),
    );
  }

  MaterialPageRoute _createGalleryDetaiRoute(
      List<String> imagePaths, int index) {
    return MaterialPageRoute(
        builder: (context) =>
            DetailImage(listImageTest: imagePaths, index: index));
  }
}
