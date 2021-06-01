import 'package:flutter/material.dart';
import 'package:test_getx/Const/constance.dart';
import 'package:test_getx/Models/room.dart' as imr;

class RoomItem extends StatelessWidget {
  final imr.Datum room;
  const RoomItem({this.room});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // image: DecorationImage(
        //   image:
        // ),
        //color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      //width: MediaQuery.of(context).size.width / 2,
      height: 230,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${room.accommodation.images[0].src}'
                        //'https://bayleaf.s3.amazonaws.com/property-images%2F1617934581284_IMG_20201004_104927.jpg',
                        ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              Container(
                width: 22,
                height: 22,
                //padding: EdgeInsets.only(top: 10.0),
                margin: EdgeInsets.only(left: 5.0, bottom: 10.0),
                child: Image.asset('assets/images/tichxanh.png'),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            alignment: Alignment.topLeft,
            child: Text(
              "${room.accommodation.title}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              //"Phòng cho thuê Định Bộ Lĩnh,Quận Bình Thành",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            alignment: Alignment.topLeft,
            child: Text(
              "${room.accommodation.retail} triệu VND/phòng",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: textPriceColor,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            alignment: Alignment.topLeft,
            child: Text(
              "${room.accommodation.address.street}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: textInfoColor,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            alignment: Alignment.topLeft,
            child: Text(
              "${room.accommodation.address.district}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: textInfoColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
