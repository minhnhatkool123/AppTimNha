import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/Const/constance.dart';
import 'package:test_getx/Views/login/login_page.dart';

class UserHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Yêu cầu đăng nhập',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Bạn cần đăng nhập để sử dụng tính năng này',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => LoginPage(), id: 2);
                },
                style: ElevatedButton.styleFrom(
                  primary: textColorForm,
                ),
                child: Text(
                  'ĐĂNG NHẬP',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
