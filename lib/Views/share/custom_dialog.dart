import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:test_getx/Const/constance.dart';
import 'package:test_getx/Models/district_model.dart';
import 'package:test_getx/Views/filter_room.dart';

class CustomDialog extends StatefulWidget {
  final int check;
  CustomDialog(this.check);
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  //RangeValues values = RangeValues(1000000, 15000000);
  var count = 0;
  double sliderValue = 8;
  double sliderValueArea = 10;
  String valueChoose;
  String valueDis; //= '';
  bool validation = false;
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
    if (widget.check == 1) valueDis = "Quận 4";
    if (widget.check == 2) valueDis = "Quận Hoàn Kiếm";
    if (widget.check == 3) valueDis = "Quận Thanh Khê";
    listName = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        elevation: 2.0,
        shadowColor: Colors.black,
        centerTitle: true,
        backgroundColor: backGroundColorHead,
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
            if (widget.check != 1 && widget.check != 2 && widget.check != 3)
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Text('Chọn tỉnh/thành phố')),
              ),
            if (widget.check != 1 && widget.check != 2 && widget.check != 3)
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Container(
                  height: 40,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: (validation == true) ? Colors.red : Colors.grey,
                        width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    hint: validation
                        ? Text(
                            "Chọn tỉnh/thành phố đi",
                            style: TextStyle(color: Colors.red),
                          )
                        : Text("Tỉnh/thành phố"),
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
                        validation = false;
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
                  border: Border.all(
                      color: Colors
                          .grey, //(validation == true) ? Colors.red : Colors.grey,
                      width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FutureBuilder(
                    future: getDistrictFormJSON(context),
                    builder: (context, data) {
                      if (data.hasData) {
                        listDis = data.data;
                        if (widget.check == 1 && count == 0) {
                          for (int i = 0; i < listDis.length; i++) {
                            if (listDis[i].provinceName == 'Hồ Chí Minh') {
                              listName.add(listDis[i].name);
                            }
                          }
                          count = 1;
                        }

                        if (widget.check == 2 && count == 0) {
                          for (int i = 0; i < listDis.length; i++) {
                            if (listDis[i].provinceName == 'Hà Nội') {
                              listName.add(listDis[i].name);
                            }
                          }
                          count = 1;
                        }

                        if (widget.check == 3 && count == 0) {
                          for (int i = 0; i < listDis.length; i++) {
                            if (listDis[i].provinceName == 'Đà Nẵng') {
                              listName.add(listDis[i].name);
                            }
                          }
                          count = 1;
                        }

                        return DropdownButton(
                          hint:
                              /*validation
                              ? Text(
                                  "Chọn quận/huyện đi",
                                  style: TextStyle(color: Colors.red),
                                )
                              :*/
                              Text("Quận/huyện"),
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
                              validation = false;
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
                    child: _statusTextMoney(sliderValue.toInt(),
                        true), //Text('${(values.start ~/ 1000000)}trVND')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                  child: Container(
                    child: _statusTextMoney(sliderValue.toInt(), false), //Text(
                    //'${(values.end ~/ 1000000) == 15 ? '${values.end ~/ 1000000}+' : '${values.end ~/ 1000000}'}trVND')),
                  ),
                ),
              ],
            ),
            Container(
              height: 30,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              child: Slider(
                value: sliderValue,
                onChanged: (values) {
                  setState(() => this.sliderValue = values);
                  print(values.toInt());
                },
                min: 1,
                max: 8,
                divisions: 7,
                inactiveColor: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Container(
                  alignment: Alignment.topLeft, child: Text('Diện tích')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                  child: Container(
                    child: _statusTextArea(sliderValueArea.toInt(), true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                  child: Container(
                    child: _statusTextArea(sliderValueArea.toInt(), false),
                  ),
                ),
              ],
            ),
            Container(
              height: 30,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              child: Slider(
                value: sliderValueArea,
                onChanged: (values) {
                  setState(() => this.sliderValueArea = values);
                  print(values);
                },
                min: 1,
                max: 10,
                divisions: 9,
                inactiveColor: Colors.grey,
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(left: 15, right: 15),
              child: ElevatedButton(
                onPressed: () {
                  print(valueChoose);
                  if (valueChoose != null ||
                      valueDis != null /*|| valueChoose == ''*/) {
                    var retail, area, province;
                    if (sliderValue == 8) {
                      retail = null;
                    } else {
                      retail = sliderValue.toInt();
                    }

                    if (sliderValueArea == 10) {
                      area = null;
                    } else {
                      area = sliderValueArea.toInt();
                    }

                    if (widget.check == 1) {
                      province = "Hồ Chí Minh";
                    } else if (widget.check == 2) {
                      province = "Hà Nội";
                    } else if (widget.check == 3) {
                      province = "Đà Nẵng";
                    } else {
                      province = valueChoose;
                    }

                    Navigator.pop(context);
                    Get.to(() => FilterRoom(province, valueDis, retail,
                            area) //FilterRoom(valueChoose, valueDis, retail, area),
                        );
                  } else {
                    setState(() {
                      validation = true;
                    });
                  }
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
                child: Text(
                  'Hủy',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statusTextMoney(int status, bool check) {
    if (check) {
      switch (status) {
        case 1:
          return Text('1trVND');
        case 2:
          return Text('2trVND');
        case 3:
          return Text('3trVND');
        case 4:
          return Text('5trVND');
        case 5:
          return Text('7trVND');
        case 6:
          return Text('10trVND');
        case 7:
          return Text('15trVND');
        case 8:
          return Text('1trVND');
        default:
          break;
      }
    } else {
      switch (status) {
        case 1:
          return Text('2trVND');
        case 2:
          return Text('3trVND');
        case 3:
          return Text('5trVND');
        case 4:
          return Text('7trVND');
        case 5:
          return Text('10trVND');
        case 6:
          return Text('15trVND');
        case 7:
          return Text('15+trVND');
        case 8:
          return Text('15+trVND');
        default:
          break;
      }
    }
  }

  Widget _statusTextArea(int status, bool check) {
    if (check) {
      switch (status) {
        case 1:
          return Text('0m²');
        case 2:
          return Text('20m²');
        case 3:
          return Text('30m²');
        case 4:
          return Text('50m²');
        case 5:
          return Text('60m²');
        case 6:
          return Text('70m²');
        case 7:
          return Text('80m²');
        case 8:
          return Text('90m²');
        case 9:
          return Text('100m²');
        case 10:
          return Text('0m²');
        default:
          break;
      }
    } else {
      switch (status) {
        case 1:
          return Text('20m²');
        case 2:
          return Text('30m²');
        case 3:
          return Text('50m²');
        case 4:
          return Text('60m²');
        case 5:
          return Text('70m²');
        case 6:
          return Text('80m²');
        case 7:
          return Text('90m²');
        case 8:
          return Text('100m²');
        case 9:
          return Text('100m²+');
        case 10:
          return Text('100m²+');
        default:
          break;
      }
    }
  }
}
