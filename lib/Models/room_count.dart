// To parse this JSON data, do
//
//     final roomCount = roomCountFromJson(jsonString);

import 'dart:convert';

RoomCount roomCountFromJson(String str) => RoomCount.fromJson(json.decode(str));

String roomCountToJson(RoomCount data) => json.encode(data.toJson());

class RoomCount {
  RoomCount({
    this.data,
  });

  Data data;

  factory RoomCount.fromJson(Map<String, dynamic> json) => RoomCount(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.result,
    this.data,
    this.error,
  });

  bool result;
  int data;
  bool error;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        result: json["result"],
        data: json["data"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "data": data,
        "error": error,
      };
}
