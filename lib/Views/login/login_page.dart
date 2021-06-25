import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_getx/Const/constance.dart';
import 'package:test_getx/Services/remoteservices.dart';
import 'package:test_getx/Views/login/info_user_page.dart';
import 'package:test_getx/Views/login/register_page.dart';
import 'package:test_getx/Views/user_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Đăng nhập'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                ),
                Text(
                  'SATIVA ',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Hãy đăng nhập bằng số điện thoại và mật khẩu \nđể sử dụng dịch vụ cách tốt nhất',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                SignForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  bool _hidePass = true;
  bool _isLoading = false;
  final TextEditingController textControllerPhone = new TextEditingController();
  final TextEditingController textControllerPassword =
      new TextEditingController();
  final formKey = GlobalKey<FormState>();

  get page => null;

  void validateForm() {
    if (_isLoading) return;
    if (formKey.currentState.validate()) {
      //print('phone' + textControllerPhone.text);
      //print('pass' + textControllerPassword.text);
      setState(() {
        _isLoading = true;
      });
      login();
    } else {
      print('loi');
    }
  }

  void login() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await Future.delayed(new Duration(seconds: 2));
      var res = await RemoteServices.loginUser(
          textControllerPhone.text, textControllerPassword.text);
      if (res != null) {
        if (res.data.data != null) {
          print('thanh cong');
          print('res: ${res.data.data.userInformation.name}');
          sharedPreferences.setString(
              'nameUser', res.data.data.userInformation.name);

          // sharedPreferences.setString(
          //     'phoneUser', res.data.data.userInformation.phone);
          // sharedPreferences.setString('idUser', res.data.data.userInformation.id);
          // sharedPreferences.setInt(
          //     'moneyUser', res.data.data.userInformation.money);
          Get.snackbar(
            'Thông báo',
            'Đăng nhập thành công',
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(20),
            maxWidth: 300,
          );
          await Future.delayed(new Duration(seconds: 3));
          //Get.to(() => UserPage(), id: 2);
          Get.offAll(() => UserPage(), id: 2);
          //InfoUserPage()
        }
      } else {
        Get.snackbar(
          'Thông báo',
          'Sai tài khoản hoặc mật khẩu',
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(20),
          maxWidth: 300,
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: textControllerPhone,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              decoration: InputDecoration(
                labelText: "Số điện thoại",
                hintText: 'Nhập số điện thoại',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 0,
                ),
                border: OutlineInputBorder(),
                //enabledBorder:
                //focusedBorder: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.phone,
                  size: 18,
                ),
              ),
              validator: (input) {
                if (input.isEmpty)
                  return "Hãy nhập số điện thoại";
                else if (input.length < 10) return "Số điện thoại quá ngắn";
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: textControllerPassword,
              decoration: InputDecoration(
                labelText: "Mật khẩu",
                hintText: 'Nhập mật khẩu',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 0,
                ),
                border: OutlineInputBorder(),
                // enabledBorder: OutlineInputBorder(),
                // focusedBorder: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _hidePass ? Icons.remove_red_eye : Icons.security_outlined,
                    size: 18,
                  ),
                  onPressed: () => {
                    setState(() {
                      _hidePass = !_hidePass;
                    })
                  },
                ),
              ),
              validator: (input) {
                if (input.isEmpty)
                  return "Hãy nhập mật khẩu";
                else if (input.length < 7) return "Mật khẩu quá ngắn";
                return null;
              },
              obscureText: _hidePass,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isLoading ? () {} : validateForm,
                style: ElevatedButton.styleFrom(
                  primary: textColorForm,
                ),
                child: _isLoading
                    ? Container(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text(
                        'ĐĂNG NHẬP',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => {
                Get.to(() => RegisterPage()),
              },
              child: Text(
                'Chưa có tài khoản? Đăng ký tại đây',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ));
  }
}
