import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class BannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      //clipBehavior: Clip.antiAlias,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(10),
      //   ),
      // ),
      child: Carousel(
        //boxFit: BoxFit.fill,
        overlayShadow: true,
        overlayShadowSize: 0.2,
        //borderRadius: true,
        dotSize: 5.0,
        dotColor: Colors.white60,
        dotIncreasedColor: Colors.black.withOpacity(0.3),
        dotSpacing: 15.0,
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 30.0,
        images: [
          NetworkImage(
              'https://list.vn/wp-content/uploads/2020/12/mau-quang-cao-cho-thue-phong-tro-768x512.jpg'), //'https://www.dungplus.com/wp-content/uploads/2019/12/girl-xinh-2-480x600.jpg'),
          NetworkImage(
              'http://saigonvillages.com/wp-content/uploads/2016/07/cho-thue-nha-tro-3-kho-khan-thuong-gap-va-giai-phap-khac-phuc1.jpg'), //'https://www.dungplus.com/wp-content/uploads/2019/12/girl-xinh-11-800x600.jpg'),
          NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLoqMDImuDrFQqtSkamFD0pjaHZTvqgm_sNQ&usqp=CAU'), //'https://www.dungplus.com/wp-content/uploads/2019/12/girl-xinh-37-735x400.jpg'),
          NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAj6inRzZZ4q7adLLhJ5ikwl9VeCBgAqIW_Q&usqp=CAU') //'https://www.dungplus.com/wp-content/uploads/2019/12/girl-xinh-41.jpg'),
        ],
      ),
    );
  }
}
