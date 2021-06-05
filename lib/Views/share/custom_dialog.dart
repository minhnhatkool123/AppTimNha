import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:test_getx/Const/constance.dart';
import 'package:test_getx/Models/district_model.dart';
import 'package:test_getx/Views/filter_room.dart';

class CustomDialog extends StatefulWidget {
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  RangeValues values = RangeValues(1000000, 15000000);
  String valueChoose;
  String valueDis = '';
  List<DistrictModel> listDis = [];
  List<String> listName;
  List<String> listItems = provinces;
  Future<List<DistrictModel>> getDistrictFormJSON(BuildContext context) async {
    String string = await DefaultAssetBundle.of(context)
        .loadString('assets/json/data.json');
    List<dynamic> raw = jsonDecode(string);
    return raw.map((e) => DistrictModel.fromJson(e)).toList();
  }

  @override
  void initState() {
    listName = [];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        elevation: 2.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.only(bottom: 15),
          child: Text(
            'Tìm kiếm mở rộng',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Container(
                  alignment: Alignment.topLeft,
                  child: Text('Chọn tỉnh/thành phố')),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Container(
                height: 40,
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton(
                  hint: Text("Tỉnh/thành phố"),
                  icon: Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                  dropdownColor: Colors.white,
                  underline: SizedBox(),
                  value: valueChoose,
                  iconSize: 30,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  onChanged: (newValue) {
                    setState(() {
                      valueChoose = newValue;
                      listName.clear();

                      // if (valueDis != null) {
                      //   listName.add(valueDis);
                      //   valueDis = valueDis;
                      // }

                      for (int i = 0; i < listDis.length; i++) {
                        if (valueChoose != '' &&
                            listDis[i].provinceName == valueChoose) {
                          listName.add(listDis[i].name);
                        }
                      }
                      if (valueDis != null || valueDis == '') {
                        //listName.add(valueDis);
                        valueDis = listName[0];
                      }
                    });
                  },
                  items: listItems.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Container(
                  alignment: Alignment.topLeft, child: Text('Chọn quận/huyện')),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Container(
                height: 40,
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FutureBuilder(
                    future: getDistrictFormJSON(context),
                    builder: (context, data) {
                      if (data.hasData) {
                        listDis = data.data;

                        return DropdownButton(
                          hint: Text("Quận/huyện"),
                          icon: Icon(Icons.arrow_drop_down),
                          isExpanded: true,
                          dropdownColor: Colors.white,
                          underline: SizedBox(),
                          value: valueDis,
                          iconSize: 30,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          onChanged: (newValue) {
                            setState(() {
                              valueDis = newValue;
                            });
                          },
                          items: listName.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        );
                      } else {
                        return Container();
                      }
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Container(
                  alignment: Alignment.topLeft, child: Text('Khoảng giá')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                  child: Container(
                      child: Text('${(values.start ~/ 1000000)}trVND')),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                  child: Container(
                      child: Text(
                          '${(values.end ~/ 1000000) == 15 ? '${values.end ~/ 1000000}+' : '${values.end ~/ 1000000}'}trVND')),
                ),
              ],
            ),
            Container(
              height: 30,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              child: RangeSlider(
                values: values,
                onChanged: (values) => setState(() => this.values = values),
                min: 1000000,
                max: 15000000,
                inactiveColor: Colors.grey,
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.only(left: 15, right: 15),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => FilterRoom(),
                  //   ),
                  // );

                  Get.to(() => FilterRoom());
                },
                style: ElevatedButton.styleFrom(
                  primary: textColorForm,
                ),
                child: Text('Tìm phòng'),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 15, right: 15),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white54,
                ),
                child: Text('Hủy'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
