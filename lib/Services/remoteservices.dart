import 'package:http/http.dart' as http;
import 'package:test_getx/Models/room.dart';

class RemoteServices {
  static var client = http.Client();
  static Future<List<Room>> fetchRooms() async {
    var url = Uri.parse('http://10.0.2.2:3000/test');
    var respone = await client.get(url);
    //print('vào hàm remotes');
    if (respone.statusCode == 200) {
      var jsonString = respone.body;
      print('Lấy API get Rooms thành công');
      return roomFromJson(jsonString);
    } else {
      print('Lỗi API get Rooms');
      return null;
    }
  }
}
