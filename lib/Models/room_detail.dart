import 'dart:convert';

RoomDetail roomDetailFromJson(String str) =>
    RoomDetail.fromJson(json.decode(str));

String roomDetailToJson(RoomDetail data) => json.encode(data.toJson());

class RoomDetail {
  RoomDetail({
    this.data,
  });

  RoomDetailData data;

  factory RoomDetail.fromJson(Map<String, dynamic> json) => RoomDetail(
        data: RoomDetailData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class RoomDetailData {
  RoomDetailData({
    this.result,
    this.data,
    this.error,
  });

  bool result;
  DataData data;
  dynamic error;

  factory RoomDetailData.fromJson(Map<String, dynamic> json) => RoomDetailData(
        result: json["result"],
        data: DataData.fromJson(json["data"]),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "data": data.toJson(),
        "error": error,
      };
}

class DataData {
  DataData({
    this.accommodation,
    this.id,
    this.timeStart,
    this.timeEnd,
    this.typePost,
    this.userId,
    this.v,
  });

  Accommodation accommodation;
  String id;
  DateTime timeStart;
  DateTime timeEnd;
  int typePost;
  String userId;
  int v;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        accommodation: Accommodation.fromJson(json["accommodation"]),
        id: json["_id"],
        timeStart: DateTime.parse(json["timeStart"]),
        timeEnd: DateTime.parse(json["timeEnd"]),
        typePost: json["typePost"],
        userId: json["user_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "accommodation": accommodation.toJson(),
        "_id": id,
        "timeStart": timeStart.toIso8601String(),
        "timeEnd": timeEnd.toIso8601String(),
        "typePost": typePost,
        "user_id": userId,
        "__v": v,
      };
}

class Accommodation {
  Accommodation({
    this.address,
    this.description,
    this.images,
    this.title,
    this.area,
    this.retail,
    this.typeAccommdation,
  });

  Address address;
  List<String> description;
  List<Image> images;
  String title;
  double area;
  double retail;
  double typeAccommdation;

  factory Accommodation.fromJson(Map<String, dynamic> json) => Accommodation(
        address: Address.fromJson(json["address"]),
        description: List<String>.from(json["description"].map((x) => x)),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        title: json["title"],
        area: json["area"].toDouble(),
        retail: json["retail"].toDouble(),
        typeAccommdation: json["typeAccommdation"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "description": List<dynamic>.from(description.map((x) => x)),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "title": title,
        "area": area,
        "retail": retail,
        "typeAccommdation": typeAccommdation,
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
  String province;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        ward: json["ward"],
        district: json["district"],
        province: json["province"],
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "ward": ward,
        "district": district,
        "province": province,
      };
}

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
