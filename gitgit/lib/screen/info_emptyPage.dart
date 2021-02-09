import 'dart:convert';

import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:ronfic_ver2/controller/auth_page.dart';
import 'package:ronfic_ver2/controller/loginchk_info.dart';
import 'package:ronfic_ver2/model/Clubs_Info.dart';
import 'package:ronfic_ver2/model/User_info.dart';
import 'package:ronfic_ver2/screen/signedin_page.dart';
import 'package:transparent_image/transparent_image.dart';
// import 'datetime_picker_in_page.dart';

class InfoEmpty extends StatefulWidget {
  @override
  _InfoEmptyState createState() => _InfoEmptyState();
}

String gender;
int height1 = 175;
int weight = 70;
String birthday = '1990-01-01';
class _InfoEmptyState extends State<InfoEmpty> {
  bool _ischecked = false;
  bool _ischecked1 = false;
  bool _ischecked2 = false;
  bool _ischecked3 = false;
  bool _ischecked4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: FlatButton(
            onPressed: () {
              print('ddd');
            },
            child: Icon(
              Icons.arrow_back_outlined,
              color: Colors.blueGrey,
            )),
        title: ProgressBar(1),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.1,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    children: [
                      Textline(context, '자신의 신체조건을 입력해주세요.',
                          '론픽존을 이용하기 위한 사전 준비 입니다.'),
                      Container(
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _ischecked = true;
                                    _ischecked1 = false;
                                    if (_ischecked) gender = 'Female';
                                  });
                                },
                                child: Ink(
                                  height: 70,
                                  width: MediaQuery.of(context).size.width /
                                      1.1 /
                                      2,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      !_ischecked
                                          ? BoxShadow()
                                          : BoxShadow(
                                              color: Colors.grey[300],
                                              offset: Offset(0, 3),
                                              blurRadius: 4.0,
                                              spreadRadius: .5,
                                            ),
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(.0, 0),
                                        blurRadius: 0.0,
                                        spreadRadius: .0,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0),
                                    ),
                                    border: _ischecked
                                        ? Border.all(
                                            width: 1, color: Colors.pink[100])
                                        : Border.all(
                                            width: .5, color: Colors.grey[300]),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15, left: 15),
                                              child: Image.asset(
                                                'images/Female.png',
                                                height: 30,
                                                width: 30,
                                                color: _ischecked
                                                    ? Colors.pink[100]
                                                    : Colors.black54,
                                              ),
                                            ),
                                            Text(
                                              '여성',
                                              style: _ischecked
                                                  ? TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.pink[100])
                                                  : TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black54),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 25),
                                        child: _ischecked
                                            ? Icon(Icons.check_box,
                                                color: Colors.pink[100])
                                            : Icon(
                                                Icons.check_box_outline_blank,
                                                color: Colors.pink[100]),
                                      )
                                    ],
                                  ),
                                )),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _ischecked1 = true;
                                    _ischecked = false;
                                    if (_ischecked1) gender = 'Male';
                                  });
                                },
                                child: Ink(
                                  height: 70,
                                  width: MediaQuery.of(context).size.width /
                                      1.1 /
                                      2,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      !_ischecked1
                                          ? BoxShadow()
                                          : BoxShadow(
                                              color: Colors.grey[300],
                                              offset: Offset(0, 3),
                                              blurRadius: 4.0,
                                              spreadRadius: .5,
                                            ),
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(.0, 0),
                                        blurRadius: 0.0,
                                        spreadRadius: .0,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    ),
                                    border: _ischecked1
                                        ? Border.all(
                                            width: 1, color: Colors.blue)
                                        : Border.all(
                                            width: .5, color: Colors.grey[300]),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15, left: 15),
                                              child: Image.asset(
                                                'images/male.png',
                                                height: 30,
                                                width: 30,
                                                color: _ischecked1
                                                    ? Colors.blue
                                                    : Colors.black54,
                                              ),
                                            ),
                                            Text(
                                              '남성',
                                              style: _ischecked1
                                                  ? TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blue)
                                                  : TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black54),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 25),
                                        child: _ischecked1
                                            ? Icon(Icons.check_box,
                                                color: Colors.blue)
                                            : Icon(
                                                Icons.check_box_outline_blank,
                                                color: Colors.blue),
                                      )
                                    ],
                                  ),
                                )),
                            // InkWell(
                            //   onTap: () {
                            //     setState(() {
                            //       _ischecked = true;
                            //       _ischecked1 = false;
                            //       if (_ischecked) gender = 'Female';
                            //     });
                            //   },
                            //   child: Ink(
                            //     height: 70,
                            //     width: MediaQuery.of(context).size.width,
                            //     decoration: BoxDecoration(
                            //         boxShadow: [
                            //           !_ischecked
                            //               ? BoxShadow()
                            //               : BoxShadow(
                            //                   color: Colors.grey[300],
                            //                   offset: Offset(0, 3),
                            //                   blurRadius: 4.0,
                            //                   spreadRadius: .5,
                            //                 ),
                            //           BoxShadow(
                            //             color: Colors.white,
                            //             offset: Offset(.0, 0),
                            //             blurRadius: 0.0,
                            //             spreadRadius: .0,
                            //           ),
                            //         ],
                            //         borderRadius: BorderRadius.all(
                            //           Radius.circular(10),
                            //         ),
                            //         border: _ischecked
                            //             ? Border.all(
                            //                 width: 1, color: Colors.pink[100])
                            //             : Border.all(
                            //                 width: .5,
                            //                 color: Colors.grey[300])),
                            //     child: Row(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceBetween,
                            //       children: [
                            //         Container(
                            //           child: Row(
                            //             children: [
                            //               Padding(
                            //                 padding: const EdgeInsets.only(
                            //                     right: 15, left: 15),
                            //                 child: Image.asset(
                            //                   'images/Female.png',
                            //                   height: 30,
                            //                   width: 30,
                            //                   color: _ischecked
                            //                       ? Colors.pink[100]
                            //                       : Colors.black54,
                            //                 ),
                            //               ),
                            //               Text(
                            //                 '여성',
                            //                 style: _ischecked
                            //                     ? TextStyle(
                            //                         fontSize: 20,
                            //                         fontWeight: FontWeight.bold,
                            //                         color: Colors.pink[100])
                            //                     : TextStyle(
                            //                         fontSize: 18,
                            //                         color: Colors.black54),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.only(right: 25),
                            //           child: _ischecked
                            //               ? Icon(Icons.check_box,
                            //                   color: Colors.pink[100])
                            //               : Icon(Icons.check_box_outline_blank,
                            //                   color: Colors.pink[100]),
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 15),
                            //   child: InkWell(
                            //     onTap: () {
                            //       setState(() {
                            //         _ischecked1 = true;
                            //         _ischecked = false;
                            //         if (_ischecked1) gender = 'Male';
                            //       });
                            //     },
                            //     child: Ink(
                            //       height: 70,
                            //       width: MediaQuery.of(context).size.width,
                            //       // color: Colors.red,
                            //       decoration: BoxDecoration(
                            //           boxShadow: [
                            //             !_ischecked1
                            //                 ? BoxShadow()
                            //                 : BoxShadow(
                            //                     color: Colors.grey[300],
                            //                     offset: Offset(0, 3),
                            //                     blurRadius: 4.0,
                            //                     spreadRadius: .5,
                            //                   ),
                            //             BoxShadow(
                            //               color: Colors.white,
                            //               offset: Offset(.0, 0),
                            //               blurRadius: 0.0,
                            //               spreadRadius: .0,
                            //             ),
                            //           ],
                            //           borderRadius: BorderRadius.all(
                            //             Radius.circular(10),
                            //           ),
                            //           border: _ischecked1 != true
                            //               ? Border.all(
                            //                   width: .5,
                            //                   color: Colors.grey[200])
                            //               : Border.all(
                            //                   width: 1, color: Colors.blue)),
                            //       child: Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Container(
                            //             child: Row(
                            //               children: [
                            //                 Padding(
                            //                   padding: const EdgeInsets.only(
                            //                       right: 15, left: 15),
                            //                   child: Image.asset(
                            //                     'images/male.png',
                            //                     height: 30,
                            //                     width: 30,
                            //                     color: !_ischecked1
                            //                         ? Colors.black54
                            //                         : Colors.blue,
                            //                   ),
                            //                 ),
                            //                 Text(
                            //                   '남성',
                            //                   style: _ischecked1
                            //                       ? TextStyle(
                            //                           fontSize: 20,
                            //                           fontWeight:
                            //                               FontWeight.bold,
                            //                           color: Colors.blue)
                            //                       : TextStyle(
                            //                           fontSize: 18,
                            //                           color: Colors.black54),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //           Padding(
                            //             padding:
                            //                 const EdgeInsets.only(right: 25),
                            //             child: _ischecked1
                            //                 ? Icon(
                            //                     Icons.check_box,
                            //                     color: Colors.blue,
                            //                   )
                            //                 : Icon(
                            //                     Icons.check_box_outline_blank,
                            //                     color: Colors.blue,
                            //                   ),
                            //           )
                            //           // FaIcon(FontAwesomeIcons.fonticons),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          height: 70,
                          // width: MediaQuery.of(context).size.width / 1.1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              boxShadow: [
                                _ischecked2
                                    ? BoxShadow(
                                        color: Colors.grey[300],
                                        offset: Offset(0, 3),
                                        blurRadius: 4.0,
                                        spreadRadius: .5,
                                      )
                                    : BoxShadow(),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(.0, 0),
                                  blurRadius: 0.0,
                                  spreadRadius: .0,
                                ),
                              ],
                              border: _ischecked2
                                  ? Border.all(
                                      width: 1, color: Colors.blue)
                                  : Border.all(width: .5, color: Colors.grey[200])),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  '신장',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: _ischecked2
                                          ? Colors.blue
                                          : Colors.black54),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                children: [
                                  Text(
                                    height1.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: Colors.black87),
                                  ),
                                  Text(
                                    ' cm',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[400]),
                                  ),
                                ],
                              ),
                              Container(
                                // width: MediaQuery.of(context).size.width /1.8,
                                child: CupertinoSlider(
                                  value: height1.toDouble(),
                                  //형변환
                                  min: 100.0,
                                  max: 210.0,
                                  activeColor: Colors.blue,
                                  // inactiveColor: Colors.grey[400],
                                  onChanged: (double Value) {
                                      _ischecked2 = true;
                                    setState(() {
                                      height1 = Value.round();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Container(
                          height: 70,
                          // width: MediaQuery.of(context).size.width / 1.1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              boxShadow: [
                                _ischecked3
                                    ? BoxShadow(
                                        color: Colors.grey[300],
                                        offset: Offset(0, 3),
                                        blurRadius: 4.0,
                                        spreadRadius: .5,
                                      )
                                    : BoxShadow(),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(.0, 0),
                                  blurRadius: 0.0,
                                  spreadRadius: .0,
                                ),
                              ],
                              border: _ischecked3
                                  ? Border.all(
                                      width: 1, color: Colors.blue)
                                  : Border.all(width: .5, color: Colors.grey[200])),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Text(
                                  '몸무게',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: _ischecked3
                                          ? Colors.blue
                                          : Colors.black54),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                children: [
                                  Text(
                                    weight.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28,
                                        color: Colors.black87),
                                  ),
                                  Text(
                                    ' Kg',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[400]),
                                  ),
                                ],
                              ),
                              Container(
                                // width: MediaQuery.of(context).size.width,
                                child: CupertinoSlider(
                                  value: weight.toDouble(),
                                  //형변환
                                  min: 40.0,
                                  max: 120.0,

                                  activeColor: Colors.blue,
                                  // inactiveColor: Colors.grey[400],
                                  onChanged: (double Value) {
                                    _ischecked3 = true;
                                    setState(() {
                                      weight = Value
                                          .round(); //정수로 반올림하여 가장 가까운 정수로 바꿔줌 (더블 타입이었으니까)
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _ischecked4 = true;
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(1940, 1, 1),
                                maxTime: DateTime.now(), onChanged: (date) {
                              setState(() {
                                birthday = date.toString().substring(0, 10);
                              });
                            }, onConfirm: (date) {
                              print('confirm $date');
                              setState(() {
                                birthday = date.toString().substring(0, 10);
                              });
                            },
                                currentTime: DateTime(
                                    int.parse(birthday.substring(0, 4)),
                                    int.parse(birthday.substring(5, 7)),
                                    int.parse(birthday.substring(8, 10))),
                                locale: LocaleType.ko);
                          });
                        },
                        child: Ink(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          // color: Colors.red,
                          decoration: BoxDecoration(
                              boxShadow: [
                                !_ischecked4
                                    ? BoxShadow()
                                    : BoxShadow(
                                        color: Colors.grey[300],
                                        offset: Offset(0, 3),
                                        blurRadius: 4.0,
                                        spreadRadius: .5,
                                      ),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(.0, 0),
                                  blurRadius: 0.0,
                                  spreadRadius: .0,
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: _ischecked4 != true
                                  ? Border.all(width: .5, color: Colors.grey[200])
                                  : Border.all(
                                      width: 1, color: Colors.blue)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // Padding(
                                    //   padding: const EdgeInsets.only(
                                    //       right: 15, left: 15),
                                    //   child: Image.asset(
                                    //       'images/birthday.png',
                                    //       height: 30,
                                    //       width: 40,
                                    //       color: _ischecked4
                                    //           ? Colors.blue
                                    //           : Colors.black87),
                                    // ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,

                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 15,left: 20),
                                              child: Text(
                                                '생년월일',
                                                style: _ischecked4
                                                    ? TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.blue)
                                                    : TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black54),
                                              ),
                                            ),
                                            Text(
                                                birthday.substring(0, 4)+' 년 '+ birthday.substring(5, 7)+' 월 '+ birthday.substring(8, 10)+' 일',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87,
                                                  fontSize: 20),
                                            )
                                          ],
                                        ),
                                        // Text(
                                        //   '생년월일을 설정 해주세요.',
                                        //   style: TextStyle(
                                        //       fontSize: 14, color: Colors.grey),
                                        // )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(right: 25),
                              //   child: _ischecked4
                              //       ? Icon(
                              //           Icons.check_box,
                              //           color: Colors.blue,
                              //         )
                              //       : Icon(
                              //           Icons.check_box_outline_blank,
                              //           color: Colors.blue,
                              //         ),
                              // )
                              // FaIcon(FontAwesomeIcons.fonticons),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 50,
                  child: FlatButton(
                    textColor: Colors.white,
                    disabledColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.lightBlue,
                    child: Text(
                      '계속',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    onPressed: !_ischecked && !_ischecked1
                        ? null
                        : () {
                            if (gender.isNotEmpty)
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => InfoEmpty2()));
                          },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InfoEmpty2 extends StatefulWidget {
  @override
  _InfoEmpty2State createState() => _InfoEmpty2State();
}

  String workoutlevel;
class _InfoEmpty2State extends State<InfoEmpty2> {
  bool _ischecked = false;
  bool _ischecked1 = false;
  bool _ischecked2 = false;


  double _scale;
  AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_outlined,
              color: Colors.blueGrey,
            )),
        title: ProgressBar(2),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.1,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Textline(context, '자신의 운동 강도 를 선택해주세요.',
                              '운동능력에 기반해서 운동처방을 위한 항목입니다.'),
                          Container(
                            // height: 290,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _ischecked = true;
                                      if (_ischecked) workoutlevel = '1';
                                      _ischecked1 = false;
                                      _ischecked2 = false;
                                    });
                                  },
                                  child: Ink(
                                    height: 70,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          !_ischecked
                                              ? BoxShadow()
                                              : BoxShadow(
                                                  color: Colors.grey[300],
                                                  offset: Offset(0, 3),
                                                  blurRadius: 4.0,
                                                  spreadRadius: .5,
                                                ),
                                          BoxShadow(
                                            color: Colors.white,
                                            offset: Offset(.0, 0),
                                            blurRadius: 0.0,
                                            spreadRadius: .0,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        border: _ischecked
                                            ? Border.all(
                                                width: 1, color: Colors.blue)
                                            : Border.all(
                                                width: .1,
                                                color: Colors.grey[200])),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15, left: 15),
                                                child: Image.asset(
                                                    'images/low.png',
                                                    height: 40,
                                                    width: 40,
                                                    color: _ischecked
                                                        ? Colors.blue
                                                        : null),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '초보자',
                                                    style: _ischecked
                                                        ? TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.blue)
                                                        : TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.black87),
                                                  ),
                                                  Text(
                                                    '운동을 알아가는중',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 25),
                                          child: _ischecked
                                              ? Icon(
                                                  Icons.check_box,
                                                  color: Colors.blue,
                                                )
                                              : Icon(
                                                  Icons.check_box_outline_blank,
                                                  color: Colors.blue,
                                                ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _ischecked1 = true;
                                        if (_ischecked1) workoutlevel = '2';
                                        _ischecked = false;
                                        _ischecked2 = false;
                                      });
                                    },
                                    child: Ink(
                                      height: 70,
                                      width: MediaQuery.of(context).size.width,
                                      // color: Colors.red,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            !_ischecked1
                                                ? BoxShadow()
                                                : BoxShadow(
                                                    color: Colors.grey[300],
                                                    offset: Offset(0, 3),
                                                    blurRadius: 4.0,
                                                    spreadRadius: .5,
                                                  ),
                                            BoxShadow(
                                              color: Colors.white,
                                              offset: Offset(.0, 0),
                                              blurRadius: 0.0,
                                              spreadRadius: .0,
                                            ),
                                          ],
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          border: _ischecked1 != true
                                              ? Border.all(
                                                  width: .5, color: Colors.grey[200])
                                              : Border.all(
                                                  width: 1,
                                                  color:
                                                      Colors.lightBlueAccent)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 15, left: 15),
                                                  child: Image.asset(
                                                      'images/middle.png',
                                                      height: 40,
                                                      width: 40,
                                                      color: _ischecked1
                                                          ? Colors.blue
                                                          : Colors.black87),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '중급자',
                                                      style: _ischecked1
                                                          ? TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.blue)
                                                          : TextStyle(
                                                              fontSize: 18,
                                                              color: Colors
                                                                  .black87),
                                                    ),
                                                    Text(
                                                      '운동에 익숙한 하신분',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.grey),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 25),
                                            child: _ischecked1
                                                ? Icon(
                                                    Icons.check_box,
                                                    color: Colors.blue,
                                                  )
                                                : Icon(
                                                    Icons
                                                        .check_box_outline_blank,
                                                    color: Colors.blue,
                                                  ),
                                          )
                                          // FaIcon(FontAwesomeIcons.fonticons),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _ischecked2 = true;
                                      if (_ischecked2) workoutlevel = '3';
                                      _ischecked = false;
                                      _ischecked1 = false;
                                    });
                                  },
                                  child: Ink(
                                    height: 70,
                                    width: MediaQuery.of(context).size.width,
                                    // color: Colors.red,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          !_ischecked2
                                              ? BoxShadow()
                                              : BoxShadow(
                                                  color: Colors.grey[300],
                                                  offset: Offset(0, 3),
                                                  blurRadius: 4.0,
                                                  spreadRadius: .5,
                                                ),
                                          BoxShadow(
                                            color: Colors.white,
                                            offset: Offset(.0, 0),
                                            blurRadius: 0.0,
                                            spreadRadius: .0,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        border: _ischecked2 != true
                                            ? Border.all(
                                                width: .5,
                                                color: Colors.grey[200])
                                            : Border.all(
                                                width: 1,
                                                color: Colors.lightBlueAccent)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15, left: 15),
                                                child: Image.asset(
                                                  'images/high.png',
                                                  height: 40,
                                                  width: 40,
                                                  color: _ischecked2
                                                      ? Colors.blue
                                                      : Colors.black87,
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '상급자',
                                                    style: _ischecked2
                                                        ? TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.blue)
                                                        : TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.black87),
                                                  ),
                                                  Text(
                                                    '운동을 꾸준히 하신분',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 25),
                                          child: _ischecked2
                                              ? Icon(
                                                  Icons.check_box,
                                                  color: Colors.blue,
                                                )
                                              : Icon(
                                                  Icons.check_box_outline_blank,
                                                  color: Colors.blue,
                                                ),
                                        )
                                        // FaIcon(FontAwesomeIcons.fonticons),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: 50,
              child: FlatButton(
                textColor: Colors.white,
                disabledColor: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.lightBlue,
                child: Text(
                  '계속',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                onPressed: _ischecked == false &&_ischecked1 == false && _ischecked2 == false ? null : () {
              Navigator.push(
              context, CupertinoPageRoute(builder: (context) => InfoEmpty3()));
              },
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

class InfoEmpty3 extends StatefulWidget {
  @override
  _InfoEmpty3State createState() => _InfoEmpty3State();
}

  String workouttarget;
class _InfoEmpty3State extends State<InfoEmpty3> {
  bool _ischecked = false;
  bool _ischecked1 = false;
  bool _ischecked2 = false;
  bool _ischecked3 = false;


  double _scale;
  AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_outlined,
              color: Colors.blueGrey,
            )),
        title: ProgressBar(3),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.1,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Textline(context, '자신의 운동 목표를 선택해주세요.',
                              '운동 목표 달성을 위해 론픽존에서 도와드립니다.'),
                          Container(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _ischecked = true;
                                      if (_ischecked) workouttarget = '1';
                                      _ischecked1 = false;
                                      _ischecked2 = false;
                                      _ischecked3 = false;
                                    });
                                  },
                                  child: Ink(
                                    height: 70,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          !_ischecked
                                              ? BoxShadow()
                                              : BoxShadow(
                                                  color: Colors.grey[300],
                                                  offset: Offset(0, 3),
                                                  blurRadius: 4.0,
                                                  spreadRadius: .5,
                                                ),
                                          BoxShadow(
                                            color: Colors.white,
                                            offset: Offset(.0, 0),
                                            blurRadius: 0.0,
                                            spreadRadius: .0,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        border: _ischecked
                                            ? Border.all(
                                                width: 1, color: Colors.blue)
                                            : Border.all(
                                                width: .1,
                                                color: Colors.grey[200])),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15, left: 15),
                                                child: Image.asset(
                                                    'images/muscle.png',
                                                    height: 30,
                                                    width: 40,
                                                    color: _ischecked
                                                        ? Colors.blue
                                                        : null),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '근육 발달',
                                                    style: _ischecked
                                                        ? TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.blue)
                                                        : TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.black87),
                                                  ),
                                                  Text(
                                                    '근육량을 늘리고 싶은분',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 25),
                                          child: _ischecked
                                              ? Icon(
                                                  Icons.check_box,
                                                  color: Colors.blue,
                                                )
                                              : Icon(
                                                  Icons.check_box_outline_blank,
                                                  color: Colors.blue,
                                                ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _ischecked1 = true;
                                        if (_ischecked1) workouttarget = '2';
                                        _ischecked = false;
                                        _ischecked2 = false;
                                        _ischecked3 = false;
                                      });
                                    },
                                    child: Ink(
                                      height: 70,
                                      width: MediaQuery.of(context).size.width,
                                      // color: Colors.red,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            !_ischecked1
                                                ? BoxShadow()
                                                : BoxShadow(
                                                    color: Colors.grey[300],
                                                    offset: Offset(0, 3),
                                                    blurRadius: 4.0,
                                                    spreadRadius: .5,
                                                  ),
                                            BoxShadow(
                                              color: Colors.white,
                                              offset: Offset(.0, 0),
                                              blurRadius: 0.0,
                                              spreadRadius: .0,
                                            ),
                                          ],
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          border: _ischecked1 != true
                                              ? Border.all(
                                                  width: .5,
                                                  color: Colors.grey[200])
                                              : Border.all(
                                                  width: 1,
                                                  color:
                                                      Colors.lightBlueAccent)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 15, left: 15),
                                                  child: Image.asset(
                                                      'images/heart.png',
                                                      height: 30,
                                                      width: 40,
                                                      color: _ischecked1
                                                          ? Colors.blue
                                                          : Colors.black87),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '건강유지',
                                                      style: _ischecked1
                                                          ? TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.blue)
                                                          : TextStyle(
                                                              fontSize: 18,
                                                              color: Colors
                                                                  .black87),
                                                    ),
                                                    Text(
                                                      '건강한 라이프 스타일 ',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.grey),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 25),
                                            child: _ischecked1
                                                ? Icon(
                                                    Icons.check_box,
                                                    color: Colors.blue,
                                                  )
                                                : Icon(
                                                    Icons
                                                        .check_box_outline_blank,
                                                    color: Colors.blue,
                                                  ),
                                          )
                                          // FaIcon(FontAwesomeIcons.fonticons),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _ischecked2 = true;
                                        if (_ischecked2) workouttarget = '3';
                                        _ischecked = false;
                                        _ischecked1 = false;
                                        _ischecked3 = false;
                                      });
                                    },
                                    child: Ink(
                                      height: 70,
                                      width: MediaQuery.of(context).size.width,
                                      // color: Colors.red,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            !_ischecked2
                                                ? BoxShadow()
                                                : BoxShadow(
                                                    color: Colors.grey[300],
                                                    offset: Offset(0, 3),
                                                    blurRadius: 4.0,
                                                    spreadRadius: .5,
                                                  ),
                                            BoxShadow(
                                              color: Colors.white,
                                              offset: Offset(.0, 0),
                                              blurRadius: 0.0,
                                              spreadRadius: .0,
                                            ),
                                          ],
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          border: _ischecked2 != true
                                              ? Border.all(
                                                  width: .5,
                                                  color: Colors.grey[200])
                                              : Border.all(
                                                  width: 1,
                                                  color:
                                                      Colors.lightBlueAccent)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 15, left: 15),
                                                  child: Image.asset(
                                                    'images/diet.png',
                                                    height: 30,
                                                    width: 40,
                                                    color: _ischecked2
                                                        ? Colors.blue
                                                        : Colors.black87,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '체중감량',
                                                      style: _ischecked2
                                                          ? TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.blue)
                                                          : TextStyle(
                                                              fontSize: 18,
                                                              color: Colors
                                                                  .black87),
                                                    ),
                                                    Text(
                                                      '군살을 뺴고 가벼워지기',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.grey),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 25),
                                            child: _ischecked2
                                                ? Icon(
                                                    Icons.check_box,
                                                    color: Colors.blue,
                                                  )
                                                : Icon(
                                                    Icons
                                                        .check_box_outline_blank,
                                                    color: Colors.blue,
                                                  ),
                                          )
                                          // FaIcon(FontAwesomeIcons.fonticons),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _ischecked3 = true;
                                      if (_ischecked3) workouttarget = '4';
                                      _ischecked = false;
                                      _ischecked1 = false;
                                      _ischecked2 = false;
                                    });
                                  },
                                  child: Ink(
                                    height: 70,
                                    width: MediaQuery.of(context).size.width,
                                    // color: Colors.red,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          !_ischecked3
                                              ? BoxShadow()
                                              : BoxShadow(
                                                  color: Colors.grey[300],
                                                  offset: Offset(0, 3),
                                                  blurRadius: 4.0,
                                                  spreadRadius: .5,
                                                ),
                                          BoxShadow(
                                            color: Colors.white,
                                            offset: Offset(.0, 0),
                                            blurRadius: 0.0,
                                            spreadRadius: .0,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        border: _ischecked3 != true
                                            ? Border.all(
                                                width: .5,
                                                color: Colors.grey[200])
                                            : Border.all(
                                                width: 1,
                                                color: Colors.lightBlueAccent)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15, left: 15),
                                                child: Image.asset(
                                                  'images/bolt.png',
                                                  height: 30,
                                                  width: 40,
                                                  color: _ischecked3
                                                      ? Colors.blue
                                                      : Colors.black87,
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '체력 단련',
                                                    style: _ischecked3
                                                        ? TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.blue)
                                                        : TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.black87),
                                                  ),
                                                  Text(
                                                    '전반적인 체력을 향상',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 25),
                                          child: _ischecked3
                                              ? Icon(
                                                  Icons.check_box,
                                                  color: Colors.blue,
                                                )
                                              : Icon(
                                                  Icons.check_box_outline_blank,
                                                  color: Colors.blue,
                                                ),
                                        )
                                        // FaIcon(FontAwesomeIcons.fonticons),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 50,
                  child: FlatButton(
                    textColor: Colors.white,
                    disabledColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.lightBlue,
                    child: Text(
                      '계속',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    onPressed: !_ischecked && !_ischecked1 && _ischecked2 == false &&_ischecked3 == false ? null :

                        () {
                            if (gender.isNotEmpty)
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => InfoEmpty4()));
                          },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



class InfoEmpty4 extends StatefulWidget {
  @override
  _InfoEmpty4State createState() => _InfoEmpty4State();
}


  String clubsid ;
class _InfoEmpty4State extends State<InfoEmpty4> {
  List datatype;
  var data122;
  var clubs;
  List<clubsInfo> _searchResult = [];
  List<clubsInfo> _clubsAll = [];
  TextEditingController _controller = TextEditingController();

  Future<String> getData() async {
    _searchResult.clear();
    http.Response response = await http.get(
        Uri.encodeFull('http://211.253.30.245/php/TEST/SMARTGYM_CLUB.php'),
        headers: {"Accept": "application/json"});
    var data = jsonDecode(response.body);
    // List tempList = new List();
    this.setState(() {
      for (Map user in data['result']) {
        _clubsAll.add(clubsInfo.fromJson(user));
      }
      return "success";
    });
  }

  onSearchTextChanged(String text) async {
    // int num = 0;
    // List<String> index_list = new List();
    // index_list.add("ㄱ"); index_list.add("ㄴ"); index_list.add("ㄷ"); index_list.add("ㄹ"); index_list.add("ㅁ"); index_list.add("ㅂ");
    // index_list.add("ㅅ"); index_list.add("ㅇ"); index_list.add("ㅈ"); index_list.add("ㅊ"); index_list.add("ㅋ"); index_list.add("ㅌ");
    // index_list.add("ㅍ"); index_list.add("ㅎ");
    // Map<int, String> index_map= {
    //   0:'김',1:"나",2:"다",3:"라",4:"마",5:"박",6:"사",7:"이",8:"자",9:"차",10:"카",11:"타",12:"파",13:"하",14:"힣",
    // };
    // for(int i = 0; i<index_list.length; i++){
    //   if( text == index_list[i] ) {
    //     num = i;
    //     break;
    //   }
    // }
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _clubsAll.forEach((clubsInfo) {
      if (clubsInfo.name.contains(text)) _searchResult.add(clubsInfo);
      // print(index_map[num+1]);clubsInfo.name.contains(index_map[num])
    });

    setState(() {});
  }

  onChangedClubs(String text) async {
    _searchResult.clear();
    _controller.clear();
    _clubsAll.forEach((clubsInfo) {
      if (clubsInfo.placeType.contains(text)) _searchResult.add(clubsInfo);
    });
    setState(() {});
  }

  bool _ischecked = true;
  bool _ischecked1 = false;
  bool _ischecked2 = false;
  bool _ischecked3 = false;
  bool _ischecked4 = false;
  bool _ischecked5 = false;
  int checkFlag = 0;
  @override
  void initState() {
    super.initState();
    this.getData();
  }
  ExistingMebers em;
  @override
  Widget build(BuildContext context) {
    em = Provider.of<ExistingMebers>(context);
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        SliverAppBar(
          title: ProgressBar(5),
          leading: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_outlined,
                color: Colors.blueGrey,
              )),
          backgroundColor: Colors.white,
          pinned: true,
          floating: true,

        ),
      ];
    },
      body: Column(
        children: [
          Container(
            // color:Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Container(
                    height: 40,
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(

                          prefixIcon: Icon(Icons.search),
                          hintText: '검색...',
                          hintStyle: TextStyle(fontWeight: FontWeight.w300,fontSize: 18,textBaseline: TextBaseline.ideographic),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          )),
                      onChanged: onSearchTextChanged,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  // color: Colors.red,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ButtonTheme(
                              minWidth: 5.0,
                              child: OutlineButton(
                                borderSide: BorderSide(
                                    width: _ischecked ? 1 : .5,
                                    color:
                                        _ischecked ? Colors.blue : Colors.grey),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _ischecked = true;
                                    if (_ischecked) _ischecked1 = false;
                                    _ischecked2 = false;
                                    _ischecked3 = false;
                                    _ischecked4 = false;
                                    _ischecked5 = false;
                                    this.onChangedClubs('');
                                  });
                                },
                                child: Text(
                                  '전체',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: _ischecked ? Colors.blue : null),
                                ),
                              ),
                            ),
                            ButtonTheme(
                              minWidth: 5.0,
                              shape: RoundedRectangleBorder(

                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: OutlineButton(
                                borderSide: BorderSide(
                                    width: _ischecked1 ? 1 : .5,
                                    color: _ischecked1
                                        ? Colors.blue
                                        : Colors.grey),
                                onPressed: () {
                                  setState(() {
                                    _ischecked1 = true;
                                    if (_ischecked1) _ischecked = false;
                                    _ischecked2 = false;
                                    _ischecked3 = false;
                                    _ischecked4 = false;
                                    _ischecked5 = false;
                                    this.onChangedClubs('smartgym');
                                  });
                                },
                                child: Text(
                                  '스마트짐',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: _ischecked1 ? Colors.blue : null),
                                ),
                              ),
                            ),
                            ButtonTheme(
                              minWidth: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: OutlineButton(
                                borderSide: BorderSide(
                                    width: _ischecked2 ? 1 : .5,
                                    color: _ischecked2
                                        ? Colors.blue
                                        : Colors.grey),
                                onPressed: () {
                                  _ischecked2 = true;
                                  if (_ischecked2) _ischecked1 = false;
                                  _ischecked = false;
                                  _ischecked3 = false;
                                  _ischecked4 = false;
                                  _ischecked5 = false;
                                  this.onChangedClubs('gym');
                                },
                                child: Text(
                                  '일반센터',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: _ischecked2 ? Colors.blue : null),
                                ),
                              ),
                            ),
                            ButtonTheme(
                              minWidth: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: OutlineButton(
                                borderSide: BorderSide(
                                    width: _ischecked3 ? 1 : .5,
                                    color: _ischecked3
                                        ? Colors.blue
                                        : Colors.grey),
                                onPressed: () {
                                  _ischecked3 = true;
                                  if (_ischecked3) _ischecked = false;
                                  _ischecked1 = false;
                                  _ischecked2 = false;
                                  _ischecked4 = false;
                                  _ischecked5 = false;
                                  this.onChangedClubs('hospital');
                                },
                                child: Text(
                                  '병원',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: _ischecked3 ? Colors.blue : null),
                                ),
                              ),
                            ),
                            ButtonTheme(
                              minWidth: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: OutlineButton(
                                borderSide: BorderSide(
                                    width: _ischecked4 ? 1 : .5,
                                    color: _ischecked4
                                        ? Colors.blue
                                        : Colors.grey),
                                onPressed: () {
                                  _ischecked4 = true;
                                  if (_ischecked4) _ischecked = false;
                                  _ischecked1 = false;
                                  _ischecked2 = false;
                                  _ischecked3 = false;
                                  _ischecked5 = false;
                                  this.onChangedClubs('university');
                                },
                                child: Text(
                                  '학교',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: _ischecked4 ? Colors.blue : null),
                                ),
                              ),
                            ),
                            ButtonTheme(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              minWidth: 5.0,
                              child: OutlineButton(
                                borderSide: BorderSide(
                                    width: _ischecked5 ? 1 : .5,
                                    color: _ischecked5
                                        ? Colors.blue
                                        : Colors.grey),
                                onPressed: () {
                                  _ischecked5 = true;
                                  if (_ischecked5) _ischecked = false;
                                  _ischecked1 = false;
                                  _ischecked2 = false;
                                  _ischecked3 = false;
                                  _ischecked4 = false;
                                  this.onChangedClubs('sportsteam');
                                },
                                child: Text(
                                  '구단',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: _ischecked5 ? Colors.blue : null),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: _clubsAll == null
                ? Center(child: CircularProgressIndicator())
                : _searchResult.length != 0 || _controller.text.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount:
                            _searchResult.isEmpty ? 0 : _searchResult.length,
                        itemBuilder: (BuildContext context, i) {
                          var clubs = _searchResult[i];
                          return ListViewWidget(clubs);
                        },
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: _clubsAll.isEmpty ? 0 : _clubsAll.length,
                        itemBuilder: (BuildContext context, int index) {
                          var clubs = _clubsAll[index];
                          return ListViewWidget(clubs);
                        },
                      ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 20),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: 50,
              child: FlatButton(
                textColor: Colors.white,
                disabledColor: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.lightBlue,
                child: Text(
                  '완료',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                onPressed: () async{
                  if (gender.isNotEmpty&&height1!=null &&weight!=null &&birthday.isNotEmpty &&workoutlevel.isNotEmpty&&workouttarget.isNotEmpty){
                  bool result  = await UpdateEmpty(em.user.id.toString(),birthday,gender,height1.toString(),weight.toString(),clubsid,workouttarget,workoutlevel);
               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => AuthPage()), (route) => false);
                  }else{
                  }
                },
              ),
            ),
          )
        ],
      ),
      ),
      // ),
    );
  }

  Future<bool> UpdateEmpty(String userid, var birthday,var gender,var height,var weight,var clubid,var workouttarget,var workoutlevel) async {

    http.Response response = await http.get(
        Uri.encodeFull('http://211.253.30.245/php/TEST/Update_Empty_Info.php?'
          +'usersid='+userid+'&birthday='+birthday+'&gender='+gender+'&height='+height+'&weight='+weight+'&clubid='+clubid+'&workouttarget='+workouttarget+'&workoutlevel='+workoutlevel),
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      // is_success:1
      // individualUser iu = individualUser();
      final data = jsonDecode(response.body);
      var DataValue = data['result'][0];
      // await em.loginChk(userid);
      em.UserResume();
      print(DataValue);
      return true;
    }else{
      return false;
    }
  }

  Padding ListViewWidget(clubsInfo clubs) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: Center(
        child: Column(
          children: [
            checkFlag - 1 == clubs.idx ?
            ClayContainer(
              depth: 30,
              spread: 10,

          color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                color: checkFlag - 1 == clubs.idx
                    ? Colors.lightBlue.withOpacity(.02)
                    : null,
              ),
              width: MediaQuery.of(context).size.width / 1.07,
              // color:Colors.red,
              child: InkWell(
                onTap: () {
                  setState(() {
                    clubsid = clubs.clubId;
                    checkFlag = clubs.idx + 1;
                    print(clubsid);
                  });

                },
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          height: 115,
                          width: 115,
                          child: FadeInImage(
                            placeholder: MemoryImage(kTransparentImage),
                            image: NetworkImage(clubs.image),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        // color: Colors.red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 7),
                                child: Text(
                                  clubs.name,
                                  style: TextStyle(
                                    color: checkFlag - 1 == clubs.idx
                                        ? Colors.blue
                                        : Colors.black87,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Text(
                                clubs.address,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: checkFlag - 1 == clubs.idx
                                        ? Colors.blue
                                        : Colors.grey,fontWeight: FontWeight.w200),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),

        ) : Container(
              // color: checkFlag - 1 == clubs.idx ?  Colors.blue.withOpacity(0.05): null,
              decoration: BoxDecoration(
                // color: checkFlag - 1 == clubs.idx
                //     ? Colors.lightBlue.withOpacity(.02)
                //     : null,
                // boxShadow: [
                //   checkFlag - 1 == clubs.idx
                //       ? BoxShadow(
                //          color: Color(0xffEDEDED),
                //           offset: Offset(0, 7),
                //           blurRadius: 5.0,
                //           spreadRadius: .5,
                //         )
                //       : BoxShadow(),
                //   BoxShadow(
                //     color: Colors.white,
                //     offset: Offset(0, 0),
                //     blurRadius: 0.0,
                //     spreadRadius: 2,
                //   ),
                // ],
              ),
              width: MediaQuery.of(context).size.width / 1.07,
              // color:Colors.red,
              child: InkWell(
                onTap: () {
                  setState(() {
                    clubsid = clubs.clubId;
                    checkFlag = clubs.idx + 1;
                    print(clubsid);
                  });

                },
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          height: 115,
                          width: 115,
                          child: FadeInImage(
                       placeholder: MemoryImage(kTransparentImage),
                            image: NetworkImage(clubs.image),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          // color: Colors.red,
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 7),
                            child: Text(
                              clubs.name,
                              style: TextStyle(
                                  color: checkFlag - 1 == clubs.idx
                                      ? Colors.blue
                                      : Colors.black87,
                                  fontSize: 20,
                                  ),
                            ),
                          ),
                          Text(
                            clubs.address,
                            style: TextStyle(
                                fontSize: 14,
                                color: checkFlag - 1 == clubs.idx
                                    ? Colors.blue
                                    : Colors.grey,fontWeight: FontWeight.w200),
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            ),
            Divider(height: 30,)
          ],
        ),
      ),
    );
  }
}

ProgressBar(int int) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: Container(
      height: 14,
      child: LinearProgressIndicator(
        value: int / 4, // percent filledH
        valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
        backgroundColor: Colors.blueGrey[100],
      ),
    ),
  );
}

Padding Textline(context, var msg, var msg1) {
  return Padding(
    padding: const EdgeInsets.only(top: 25, bottom: 25),
    child: Container(
// color: Colors.red,
//     height: 80,
      width: MediaQuery.of(context).size.width / 1.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              msg,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            msg1,
            style: TextStyle(color: Colors.blueGrey, fontSize: 16),
          ),
        ],
      ),
    ),
  );
}

// Padding next(context) {
//   return
// }
