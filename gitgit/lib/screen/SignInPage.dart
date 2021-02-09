import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ronfic_ver2/controller/auth_page.dart';
import 'package:ronfic_ver2/controller/firebase_provider.dart';
import 'package:ronfic_ver2/controller/loginchk_info.dart';
import 'package:ronfic_ver2/screen/signedin_page.dart';
import 'package:ronfic_ver2/screen/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AgreePage.dart';

LoginPage pageState;
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

// LoginStatus _loginStatus = LoginStatus.notSignIn;
// TextEditingController _IDController = TextEditingController();
// TextEditingController _passwordController = TextEditingController();
class _LoginPageState extends State<LoginPage> {
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
                            Colors.lightBlueAccent,
                            Colors.lightBlue,
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
                            Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AgreePage()));
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
  bool result = await em.signInWithEmail(_mailCon.text, _pwCon.text);
  _scaffoldKey.currentState.hideCurrentSnackBar();
  if (result == false) showLastFBMessage();
  if(result) Navigator.of(context)
      .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  // if(result)Navigator.push(
  //   context,
  //   MaterialPageRoute(
  //     builder: (BuildContext context) => AuthPage(),
  //   ),
  // );

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
// class SignInPageState extends State<SignInPage> {
//   TextEditingController _mailCon = TextEditingController();
//   TextEditingController _pwCon = TextEditingController();
//   bool doRemember = false;
//
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   FirebaseProvider fp;
//
//   @override
//   void initState() {
//     super.initState();
//     getRememberInfo();
//   }
//
//   @override
//   void dispose() {
//     setRememberInfo();
//     _mailCon.dispose();
//     _pwCon.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     fp = Provider.of<FirebaseProvider>(context);
//
//     print(fp.getUser());
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(title: Text("Sign-In Page")),
//       body: ListView(
//         children: <Widget>[
//           Container(
//             margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
//             child: Column(
//               children: <Widget>[
//                 //Header
//                 Container(
//                   height: 50,
//                   decoration: BoxDecoration(color: Colors.amber),
//                   child: Center(
//                     child: Text(
//                       "Sign In to Your Account",
//                       style: TextStyle(
//                           color: Colors.blueGrey,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//
//                 // Input Area
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.amber, width: 1),
//                   ),
//                   child: Column(
//                     children: <Widget>[
//                       TextField(
//                         controller: _mailCon,
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.mail),
//                           hintText: "Email",
//                         ),
//                       ),
//                       TextField(
//                         controller: _pwCon,
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.lock),
//                           hintText: "Password",
//                         ),
//                         obscureText: true,
//                       ),
//                     ].map((c) {
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 10, horizontal: 10),
//                         child: c,
//                       );
//                     }).toList(),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           // Remember Me
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               children: <Widget>[
//                 Checkbox(
//                   value: doRemember,
//                   onChanged: (newValue) {
//                     setState(() {
//                       doRemember = newValue;
//                     });
//                   },
//                 ),
//                 Text("Remember Me")
//               ],
//             ),
//           ),
//
//           // Alert Box
//           (fp.getUser() != null && fp.getUser().isEmailVerified == false)
//               ? Container(
//             margin:
//             const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//             decoration: BoxDecoration(color: Colors.red[300]),
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Text(
//                     "Mail authentication did not complete."
//                         "\nPlease check your verification email.",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 RaisedButton(
//                   color: Colors.lightBlue[400],
//                   textColor: Colors.white,
//                   child: Text("Resend Verify Email"),
//                   onPressed: () {
//                     FocusScope.of(context)
//                         .requestFocus(new FocusNode()); // 키보드 감춤
//                     fp.getUser().sendEmailVerification();
//                   },
//                 )
//               ],
//             ),
//           )
//               : Container(),
//
//           // Sign In Button
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: RaisedButton(
//               color: Colors.indigo[300],
//               child: Text(
//                 "SIGN IN",
//                 style: TextStyle(color: Colors.white),
//               ),
//               onPressed: () {
//                 FocusScope.of(context).requestFocus(new FocusNode()); // 키보드 감춤
//                 _signIn();
//               },
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             padding: const EdgeInsets.only(top: 50),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text("Need an account?",
//                     style: TextStyle(color: Colors.blueGrey)),
//                 FlatButton(
//                   child: Text(
//                     "Sign Up",
//                     style: TextStyle(color: Colors.blue, fontSize: 16),
//                   ),
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => SignUpPage()));
//                   },
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   void _signIn() async {
//     _scaffoldKey.currentState
//       ..hideCurrentSnackBar()
//       ..showSnackBar(SnackBar(
//         duration: Duration(seconds: 10),
//         content: Row(
//           children: <Widget>[
//             CircularProgressIndicator(),
//             Text("   Signing-In...")
//           ],
//         ),
//       ));
//     bool result = await fp.signInWithEmail(_mailCon.text, _pwCon.text);
//     _scaffoldKey.currentState.hideCurrentSnackBar();
//     if (result == false) showLastFBMessage();
//   }
//
//   getRememberInfo() async {
//     print(doRemember);
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       doRemember = (prefs.getBool("doRemember") ?? false);
//     });
//     if (doRemember) {
//       setState(() {
//         _mailCon.text = (prefs.getString("userEmail") ?? "");
//         _pwCon.text = (prefs.getString("userPasswd") ?? "");
//       });
//     }
//   }
//
//   setRememberInfo() async {
//     print(doRemember);
//
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool("doRemember", doRemember);
//     if (doRemember) {
//       prefs.setString("userEmail", _mailCon.text);
//       prefs.setString("userPasswd", _pwCon.text);
//     }
//   }
//
//   showLastFBMessage() {
//     _scaffoldKey.currentState
//       ..hideCurrentSnackBar()
//       ..showSnackBar(SnackBar(
//         backgroundColor: Colors.red[400],
//         duration: Duration(seconds: 10),
//         content: Text(fp.getLastFBMessage()),
//         action: SnackBarAction(
//           label: "Done",
//           textColor: Colors.white,
//           onPressed: () {},
//         ),
//       ));
//   }
// }