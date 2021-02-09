import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ronfic_ver2/controller/auth_page.dart';
import 'package:ronfic_ver2/controller/firebase_provider.dart';
import 'package:ronfic_ver2/controller/loginchk_info.dart';
import 'package:ronfic_ver2/screen/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


SharedPreferences loginData;
LoginPage1 pageState;
class LoginPage1 extends StatefulWidget {
  @override
  _LoginPageState1 createState() => _LoginPageState1();
}

// LoginStatus _loginStatus = LoginStatus.notSignIn;
// TextEditingController _IDController = TextEditingController();
// TextEditingController _passwordController = TextEditingController();
class _LoginPageState1 extends State<LoginPage1> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _mailCon = TextEditingController();
  TextEditingController _pwCon = TextEditingController();
  bool doRemember = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ExistingMebers em;
  @override
  void initState() {
    // ignore: unnecessary_statements
    // fp.signInWithEmail;
    // getRememberInfo();
    super.initState();
  }
  @override
  void dispose() {
    // setRememberInfo();
    _mailCon.dispose();
    _pwCon.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    em = Provider.of<ExistingMebers>(context);
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: MediaQuery.of(context).size.height / 2.5,
                // color: Colors.red,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/image1.png"),
                          fit: BoxFit.contain)),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              // height: MediaQuery.of(context).size.height/2,
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 55),
              child: Column(
                children: [
                  Form(
                    child: Column(
                      children: [
                        LoginID(),
                        SizedBox(height: 15,),
                        LoginPW(),
                        SizedBox(height: 15,),
                        Material(
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                  colors: [
                                Colors.lightGreen,
                                Colors.greenAccent,
                                Colors.blueAccent,
                              ], begin: Alignment.topRight, end: Alignment.topLeft),
                            ),
                            child: InkWell(
                              splashColor: Colors.lightBlueAccent,
                              onTap: () async {
                                FocusScope.of(context).requestFocus(new FocusNode()); // 키보드 감춤
                                _signIn();
                              },
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: Center(
                                      child: Text('로그인 ', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),))),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton(
                              // color:Colors.teal,
                              onPressed: () {

                              },
                              child: Text('회원가입', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),
                            ),
                            Row(
                                children: [
                                  FlatButton(
                                    // color:Colors.teal,
                                    onPressed: () {},
                                    child: Text('비밀번호 찾기', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),
                                  ),
                                ])
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
  TextFormField LoginID() {
    return TextFormField(
      controller: _mailCon,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
        hintText: '',
      ),
      // validator: validateEmail,
      // onSaved: (String value) {
      //   loginId = value;
      // },
    );
  }

  TextFormField LoginPW() {
    return TextFormField(
      controller: _pwCon,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
        hintText: 'insert password',

      ),

    );
  }
  showLastFBMessage() {
    _scaffoldKey.currentState
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        backgroundColor: Colors.red[400],
        duration: Duration(seconds: 3),
        content: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(em.getLastFBMessage()),
        ),
        action: SnackBarAction(
          label: "확인",
          textColor: Colors.white,
          onPressed: () {},
        ),
      ));
  }
  void _signIn() async {
    _scaffoldKey.currentState
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        duration: Duration(seconds: 10),
        content: Row(
          children: <Widget>[
            CircularProgressIndicator(),
            Text("   로그인중 입니다...")
          ],
        ),
      ));
    bool result = await em.login(_mailCon.text.trim(), _pwCon.text.trim());
    _scaffoldKey.currentState.hideCurrentSnackBar();
    if(result) Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);



    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => AuthPage(),
    //   ),
    // );

  }
}
// getRememberInfo() async {
//
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   setState(() {
//     doRemember = (prefs.getBool("doRemember") ?? false);
//   });
//   if (doRemember) {
//     setState(() {
//       _mailCon.text = (prefs.getString("userEmail") ?? "");
//       _pwCon.text = (prefs.getString("userPasswd") ?? "");
//     });
//   }
// }
//
// setRememberInfo() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setBool("doRemember", doRemember);
//   if (doRemember) {
//     prefs.setString("userEmail", _mailCon.text);
//     prefs.setString("userPasswd", _pwCon.text);
//   }
// }
// }
// SignInPageState pageState;
// class SignInPage extends StatefulWidget {
//   @override
//   SignInPageState createState() {
//     pageState = SignInPageState();
//     return pageState;
//   }
// }
//
// }