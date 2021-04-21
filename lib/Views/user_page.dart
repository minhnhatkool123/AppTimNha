import 'package:flutter/material.dart';
import 'package:test_getx/Models/screen_model.dart';

class UserPage extends StatelessWidget {
  final ScreenModel model;

  const UserPage({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('USER'),
      ),
    );
  }
}
