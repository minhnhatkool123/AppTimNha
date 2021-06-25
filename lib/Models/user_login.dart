// To parse this JSON data, do
//
//     final userLogin = userLoginFromJson(jsonString);

import 'dart:convert';

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str));

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {
  UserLogin({
    this.data,
  });

  UserLoginData data;

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        data: UserLoginData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class UserLoginData {
  UserLoginData({
    this.result,
    this.data,
    this.error,
  });

  bool result;
  DataData data;
  dynamic error;

  factory UserLoginData.fromJson(Map<String, dynamic> json) => UserLoginData(
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
    this.userInformation,
    this.accessToken,
  });

  UserInformation userInformation;
  String accessToken;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        userInformation: UserInformation.fromJson(json["userInformation"]),
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "userInformation": userInformation.toJson(),
        "accessToken": accessToken,
      };
}

class UserInformation {
  UserInformation({
    this.id,
    this.name,
    this.phone,
    this.money,
    this.type,
    this.active,
  });

  String id;
  String name;
  String phone;
  int money;
  int type;
  bool active;

  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      UserInformation(
        id: json["_id"],
        name: json["name"],
        phone: json["phone"],
        money: json["money"],
        type: json["type"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "phone": phone,
        "money": money,
        "type": type,
        "active": active,
      };
}
