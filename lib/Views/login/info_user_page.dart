import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_getx/Const/constance.dart';
import 'package:test_getx/Views/homepage.dart';
import 'package:test_getx/Views/login/login_page.dart';
import 'package:test_getx/Views/user_page.dart';

class InfoUserPage extends StatefulWidget {
  @override
  _InfoUserPageState createState() => _InfoUserPageState();
}

class _InfoUserPageState extends State<InfoUserPage> {
  String name;
  var prefs;
  void getInfo() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('nameUser');
    });
    if (prefs.getString('nameUsersadas') == null) {
      print('loi sai ten');
    }
  }

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        Get.back(id: 1);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Thông tin tài khoản'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //Text('$name'),
              SizedBox(
                height: 60,
              ),
              Container(
                width: 100,
                height: 100,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://phongtro123.com/images/default-user.png"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                //padding: EdgeInsets.only(right: 50),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Họ và tên',
                      style: TextStyle(color: textColorForm, fontSize: 18),
                    ),
                    SizedBox(
                      width: 89,
                    ),
                    Text('Kool'),
                    SizedBox(
                      width: 103,
                    ),
                    Icon(Icons.supervised_user_circle)
                  ],
                ),
              ),
              Container(
                //padding: EdgeInsets.only(right: 50),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Số điện thoai',
                      style: TextStyle(color: textColorForm, fontSize: 18),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text('078665220'),
                    SizedBox(
                      width: 59,
                    ),
                    Icon(Icons.phone_android)
                  ],
                ),
              ),
              Container(
                //padding: EdgeInsets.only(right: 50),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Số dư:',
                      style: TextStyle(color: textColorForm, fontSize: 18),
                    ),
                    SizedBox(
                      width: 113,
                    ),
                    Text('10000đ'),
                    SizedBox(
                      width: 83,
                    ),
                    Icon(Icons.monetization_on)
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  prefs.remove('nameUser');
                  // Navigator.pushAndRemoveUntil(
                  //   context,
                  //   MaterialPageRoute(builder: (BuildContext context) => Screen1()),
                  //   ModalRoute.withName('/first'),
                  // );
                  // Get.to
                  Get.off(() => UserPage(), id: 2);
                },
                child: Container(
                  //padding: EdgeInsets.only(right: 50),
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Đăng xuất',
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                      Icon(Icons.chevron_right_outlined),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
