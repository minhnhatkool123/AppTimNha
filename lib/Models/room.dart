// import 'dart:convert';
//
// List<Room> roomFromJson(String str) =>
//     List<Room>.from(json.decode(str).map((x) => Room.fromJson(x)));
//
// String roomToJson(List<Room> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Room {
//   Room({
//     this.id,
//     this.name,
//     this.image,
//   });
//
//   int id;
//   String name;
//   String image;
//
//   factory Room.fromJson(Map<String, dynamic> json) => Room(
//         id: json["id"],
//         name: json["name"],
//         image: json["image"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "image": image,
//       };
// }

// To parse this JSON data, do
//
//     final room = roomFromJson(jsonString);

import 'dart:convert';

Room roomFromJson(String str) => Room.fromJson(json.decode(str));

String roomToJson(Room data) => json.encode(data.toJson());

class Room {
  Room({
    this.data,
  });

  Data data;
  factory Room.fromJson(Map<String, dynamic> json) => Room(
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
  List<Datum> data;
  dynamic error;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        result: json["result"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error,
      };
}

class Datum {
  Datum({
    this.timeStart,
    this.typePost,
    this.id,
    this.accommodation,
  });

  DateTime timeStart;
  int typePost;
  String id;
  Accommodation accommodation;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        timeStart: DateTime.parse(json["timeStart"]),
        typePost: json["typePost"],
        id: json["_id"],
        accommodation: Accommodation.fromJson(json["accommodation"]),
      );

  Map<String, dynamic> toJson() => {
        "timeStart": timeStart.toIso8601String(),
        "typePost": typePost,
        "_id": id,
        "accommodation": accommodation.toJson(),
      };
}

class Accommodation {
  Accommodation({
    this.area,
    this.title,
    this.retail,
    this.address,
    this.images,
  });

  double area;
  String title;
  double retail;
  Address address;
  List<Image> images;

  factory Accommodation.fromJson(Map<String, dynamic> json) => Accommodation(
        area: json["area"].toDouble(),
        title: json["title"],
        retail: json["retail"].toDouble(),
        address: Address.fromJson(json["address"]),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "area": area,
        "title": title,
        "retail": retail,
        "address": address.toJson(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Address {
  Address({
    this.street,
    this.ward,
    this.district,
    this.province,
  });

  String street;
  String ward;
  String district;
  Province province;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        ward: json["ward"],
        district: json["district"],
        province: provinceValues.map[json["province"]],
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "ward": ward,
        "district": district,
        "province": provinceValues.reverse[province],
      };
}

enum Province { H_CH_MINH }

final provinceValues = EnumValues({"Hồ Chí Minh": Province.H_CH_MINH});

class Image {
  Image({
    this.src,
    this.alt,
  });

  String src;
  String alt;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        src: json["src"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "src": src,
        "alt": alt,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
