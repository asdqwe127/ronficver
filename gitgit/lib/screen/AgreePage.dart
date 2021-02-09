import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ronfic_ver2/model/style.dart';
import 'package:ronfic_ver2/screen/RegisterPage.dart';
import 'package:ronfic_ver2/screen/Register_Complete.dart';

class AgreePage extends StatefulWidget {
  @override
  _AgreePageState createState() => _AgreePageState();
}

class _AgreePageState extends State<AgreePage> {
  Icon Icon1() {
    return Icon(
      Icons.check_outlined,
      size: 25.0,
      color: Colors.grey,
    );
  }
  Icon Icon2() {
    return Icon(
      Icons.check,
      size: 25.0,
      color: Colors.blueAccent,
    );
  }
  agree(bool ischk, bool ischk2) {
    setState(() {
      if (ischk == false) _ischeckedall = false;
      if (ischk && ischk2) _ischeckedall = true;
    });
  }
  bool _ischeckedall = false;
  bool _ischecked1 = false;
  bool _ischecked2 = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 1.2;
    final pdingll = const EdgeInsets.all(15.0);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: RegAppBar(context,'회원가입'),
      body: ListView(
        children: [
          Center(
            child: Container(
              width: width,
              height: 220,
              // color: Colors.blueAccent,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('론픽 존 회원가입을\n         환영합니다!',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 28,
                            fontWeight: FontWeight.w600)),
                    // SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text('론픽 존 서비스 이용을 위해 아래 약관에 동의 해주세요',
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                    )
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                Container(
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey[200], width: 1)),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (_ischeckedall = !_ischeckedall) {
                          _ischecked1 = true;
                          _ischecked2 = true;
                        } else {
                          _ischecked1 = false;
                          _ischecked2 = false;
                        }
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: pdingll,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Row(
                            children: [
                              !_ischeckedall ? Icon1() : Icon2(),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '전체 항목에 동의합니다.',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey[200],
                    width: 1,
                  ))),

                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _ischecked1 = !_ischecked1;
                          agree(_ischecked1, _ischecked2);
                        },
                        child: Padding(
                          padding: pdingll,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Row(
                              children: [
                                !_ischecked1 ? Icon1() : Icon2(),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    '서비스 이용약관 동의(필수)',
                                    style: TextStyle(
                                        fontSize: 14.5,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(
                              '자세히',
                              style:
                                  TextStyle(decoration: TextDecoration.underline),
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey[200],
                    width: 1,
                  ))),
                  width: width,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _ischecked2  =  !_ischecked2;
                            agree(_ischecked2, _ischecked1);
                          });
                        },
                        child: Padding(
                          padding: pdingll,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Row(
                              children: [
                                !_ischecked2 ? Icon1() : Icon2(),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    '개인정보 처리방침(필수)',
                                    style: TextStyle(fontSize: 14.5),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(
                              '자세히',
                              style:
                                  TextStyle(decoration: TextDecoration.underline),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  width: width,
                  height: 50,
                  child: FlatButton(
                    textColor: Colors.white,
                    disabledColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    color: Colors.lightBlue,
                    child: Text('다음',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                     onPressed:  !_ischeckedall  ? null  : (){ if(_ischeckedall){
                       Navigator.push(
                           context, CupertinoPageRoute(builder: (context) => RegisterPage()));
                     }
                     },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
