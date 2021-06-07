import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_getx/Models/room.dart';
import 'package:test_getx/Models/room_count.dart';
import 'package:test_getx/Models/room_detail.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<Room> fetchRooms({int page = 1}) async {
    Map data = {
      'type': 1,
    };
    String body = json.encode(data);

    var url = Uri.parse(
        'http://10.0.2.2:8000/api/post/filter-posts/$page'); //'http://10.0.2.2:3000/test');
    var response = await client.post(url, body: body);
    if (response.statusCode == 200) {
      var jsonString = response.body;

      //print('Lấy API get Rooms thành công');

      return roomFromJson(jsonString);
    } else {
      print('Lỗi API get Rooms');
      return null;
    }
  }

  static Future<RoomDetail> fetchRoomDetail({String id = ''}) async {
    var url = Uri.parse(
        'http://10.0.2.2:8000/api/post/get-post/$id'); //'http://10.0.2.2:3000/test');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print('Lấy API get Rooms Detail thành công');
      return roomDetailFromJson(jsonString);
    } else {
      print('Lỗi API get Rooms Detail');
      return null;
    }
  }

  static Future<Room> filterRoom(
      String province, String district, int retail, int area,
      {int page = 1}) async {
    Map data = {
      "province": province,
      "district": district,
      "area": area,
      "retail": retail
    };
    print('vào filterRoom');
    print({province, district, retail, area});
    String body = json.encode(data);
    var url = Uri.parse(
        'http://10.0.2.2:8000/api/post/filter-posts/$page'); //'http://10.0.2.2:3000/test');
    var response = await client.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;

      //print('Lấy API get Rooms thành công');

      return roomFromJson(jsonString);
    } else {
      print('Lỗi API get Rooms');
      return null;
    }
  }

  static Future<RoomCount> countRoom(
      String province, String district, int retail, int area) async {
    Map data = {
      "province": province,
      "district": district,
      "area": area,
      "retail": retail
    };
    print('vào countRoom');
    print({province, district});
    String body = json.encode(data);
    var url = Uri.parse('http://10.0.2.2:8000/api/post/count-posts');
    var response = await client.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;

      return roomCountFromJson(jsonString);
    } else {
      print('Lỗi API get Rooms');
      return null;
    }
  }
}
