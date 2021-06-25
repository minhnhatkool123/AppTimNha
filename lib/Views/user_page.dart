import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_getx/Models/screen_model.dart';
import 'package:test_getx/Views/login/info_user_page.dart';
import 'package:test_getx/Views/login/login_page.dart';
import 'package:test_getx/Views/login/user_home_page.dart';

// class UserPage extends StatelessWidget {
//   final ScreenModel model;
//
//   const UserPage({Key key, this.model}) : super(key: key);
//   as() async {
//     final prefs = await SharedPreferences.getInstance();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     as();
//     return Container(
//       child: UserHomePage(), //LoginPage(),
//     );
//   }
// }

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String name;

  void getInfo() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString('nameUser') == null) {
      print('loi sai ten');
    } else {
      setState(() {
        name = prefs.getString('nameUser');
      });
    }
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Container(
        child: name != null ? InfoUserPage() : UserHomePage(),
      ),
    );
  }
}
