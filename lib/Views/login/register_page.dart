import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/Const/constance.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Đăng ký'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'SATIVA ',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Hãy đăng ký để sử dụng dịch vụ cách tốt nhất',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                SignForm(),
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
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: "Số điện thoại",
            hintText: 'Nhập số điện thoại',
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 0,
            ),
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
            suffixIcon: Icon(
              Icons.phone,
              size: 18,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Mật khẩu",
            hintText: 'Nhập mật khẩu',
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 0,
            ),
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
            suffixIcon: Icon(
              Icons.security_outlined,
              size: 18,
            ),
          ),
          obscureText: true,
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Mật khẩu",
            hintText: 'Nhập mật khẩu',
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 0,
            ),
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
            suffixIcon: Icon(
              Icons.security_outlined,
              size: 18,
            ),
          ),
          obscureText: true,
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Mật khẩu",
            hintText: 'Nhập mật khẩu',
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 0,
            ),
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
            suffixIcon: Icon(
              Icons.security_outlined,
              size: 18,
            ),
          ),
          obscureText: true,
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Mật khẩu",
            hintText: 'Nhập mật khẩu',
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 0,
            ),
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
            suffixIcon: Icon(
              Icons.security_outlined,
              size: 18,
            ),
          ),
          obscureText: true,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: textColorForm,
            ),
            child: Text(
              'TẠO TÀI KHOẢN',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    ));
  }
}
