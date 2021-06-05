import 'dart:convert';

List<DistrictModel> districtModelFromJson(String str) =>
    List<DistrictModel>.from(
        json.decode(str).map((x) => DistrictModel.fromJson(x)));

String districtModelToJson(List<DistrictModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DistrictModel {
  DistrictModel({
    this.name,
    this.provinceName,
  });

  String name;
  String provinceName;

  factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
        name: json["name"],
        provinceName: json["provinceName"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "provinceName": provinceName,
      };
}
