import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:test_getx/Models/room.dart';
import 'package:test_getx/Services/remoteservices.dart';
import 'package:test_getx/Views/share/roomitem.dart';

class FilterRoom extends StatefulWidget {
  @override
  _FilterRoomState createState() => _FilterRoomState();
}

class _FilterRoomState extends State<FilterRoom> {
  Future<Room> filterRoom;
  @override
  void initState() {
    filterRoom = RemoteServices.filterRoom("Hà Nội", "Quận Thanh Xuân");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      body: Container(
        child: FutureBuilder<Room>(
          future: filterRoom,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                height: 720,
                width: double.infinity,
                //child: listViewNew(snapshot.data.data.data[index]),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget listViewNew(Datum room) {
    return StaggeredGridView.countBuilder(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 15.0,
      itemCount: 6, //oomController.roomList.length,
      itemBuilder: (context, index) {
        return InkWell(
          //
          // onTap: () => Get.to(
          //         () => DetailRoom(roomController.roomList[index].id),
          //     binding: BindingsBuilder(
          //             () => Get.create(() => RoomDetailController()))),

          child: RoomItem(room: room), //roomController.roomList[index]),
        );
      },
      staggeredTileBuilder: (index) => new StaggeredTile.fit(1),
    );
  }
}
