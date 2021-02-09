// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:http/http.dart' as http;
// import 'package:prefs/prefs.dart';
// import 'package:provider/provider.dart';
// import 'package:ronfic_ver2/controller/loginchk_info.dart';
// import 'package:ronfic_ver2/Ori_user_Page.dart';
//
// import 'package:ronfic_ver2/model/User_info.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../main.dart';
//
// // enum LoginStatus { notSignIn, signIn }
// // LoginStatus _loginStatus = LoginStatus.notSignIn;
//
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// // LoginStatus _loginStatus = LoginStatus.notSignIn;
// TextEditingController _IDController = TextEditingController();
// TextEditingController _passwordController = TextEditingController();
// final formKey = GlobalKey<FormState>();
//
//
//
// var UserId = '';
// var UserPw = '';
//
// class _LoginPageState extends State<LoginPage> {
//   // SharedPreferences _prefs;
//
//   // loadpref() async {
//   //   _prefs = await SharedPreferences.getInstance();
//   //   setState(() {
//   //
//   //     // _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
//   //   });
//   // }
//
//   @override
//   void initState() {
//
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // void check_if_already_login() async {
//     //   _pref = await SharedPreferences.getInstance();
//     //   newuser = (logindata.getInt('login') == 1);
//     //   print(newuser);
//     //   if (newuser == false) {
//     //     Navigator.pushReplacement(
//     //         context, new MaterialPageRoute(builder: (context) => MyDashboard()));
//     //   }
//     // }
//
//     // final UserLogin = Provider.of<Loginchk_info>(context);
//     // SharedPreferences _prefs;
//     // String _id = '';
//     // String _pw = '';
//     // switch (_loginStatus) {
//     //   case LoginStatus.notSignIn:
//     // LoginCode != 1 ? FirstPage() :
//     final postProvider = Provider.of<PostProvider>(context);
//     var postDatas = postProvider.getPostList();
//     return Scaffold(
//       body: ListView(children: [
//         Center(
//           child: Container(
//             width: MediaQuery.of(context).size.width / 1.3,
//             height: MediaQuery.of(context).size.height / 2.5,
//             // color: Colors.red,
//             child: Container(
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage("images/image1.png"),
//
//                       fit: BoxFit.contain)),
//             ),
//           ),
//         ),
//         Container(
//           width: MediaQuery.of(context).size.width / 1.2,
//           // height: MediaQuery.of(context).size.height/2,
//           padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 55),
//           child: Column(
//             children: [
//               Form(
//                 child: Column(
//                   children: [
//                     // Container(
//                     //   width: 270,
//                     //   height: 150,
//                     //   decoration: BoxDecoration(
//                     //       image: DecorationImage(
//                     //           image: AssetImage("images/image1.png"),
//                     //           fit: BoxFit.contain)),
//                     // ),
//                     LoginID(),
//                     SizedBox(height: 15,),
//                     LoginPW(),
//                     SizedBox(height: 15,),
//                     Material(
//                       child: Ink(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           gradient: LinearGradient(colors: [
//                             Colors.lightBlueAccent,
//                             Colors.lightBlue,
//                             Colors.blueAccent,
//                           ], begin: Alignment.topRight, end: Alignment.topLeft),
//                         ),
//                         child: InkWell(
//                           splashColor: Colors.lightBlueAccent,
//                           onTap: () async {
//                             UserId = _IDController.text;
//                             UserPw = _passwordController.text;
//                             await login();
//                             if (LoginCode == 1) {
//                               Navigator.popAndPushNamed(context, '/first');
//                             } else {
//                               print('로그인 실패');
//                             }
//                           },
//                           child: Container(
//                               width: MediaQuery.of(context).size.width,
//                               height: 50,
//                               child: Center(
//                                   child: Text('로그인 ', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),))),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         FlatButton(
//                           // color:Colors.teal,
//                           onPressed: () {},
//                           child: Text('회원가입', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),
//                         ),
//                         Row(
//                             children: [
//                               FlatButton(
//                             // color:Colors.teal,
//                             onPressed: () {},
//                             child: Text('비밀번호 찾기', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),
//                           ),
//                         ])
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ]),
//     );
//
//
//   }
// }
//
// Widget LoginID() {
//   return TextFormField(
//     controller: _IDController,
//     decoration: InputDecoration(
//       border: OutlineInputBorder(),
//       labelText: 'ID',
//       hintText: '',
//     ),
//     // validator: validateEmail,
//     // onSaved: (String value) {
//     //   loginId = value;
//     // },
//   );
// }
//
// TextFormField LoginPW() {
//   return TextFormField(
//     controller: _passwordController,
//     decoration: InputDecoration(
//       border: OutlineInputBorder(),
//       labelText: 'Password',
//       hintText: 'asdfasdfasdf',
//
//     ),
// // validator: validateEmail,
// // onSaved: (String value) {
// //   loginId = value;
// // },
//   );
// }
//
// login() async {
//
//   Map<String, String> headers = {
//     'Content-Type': 'application/json;charset=UTF-8',
//     'Charset': 'utf-8'
//   };
//   final response = await http.post(
//       "http://211.253.30.245/php/TEST/IDCHECK_TEST.php?userid=" +
//           UserId.trim() +
//           "&u_password=" +
//           UserPw.trim(),
//       headers: headers);
// print(UserId+UserPw);
//   if (response.statusCode == 200) {
//     final data = jsonDecode(response.body);
//     if (data["result"][0].toString() != "false") {
//       Map<String, dynamic> userMap = data['result'][0];
//       // var user = individualUser.fromJson(userMap);
//       var userinfo = data['result'][0];
//         // print(data['result'][0]);s
//       /// 이건 loginpage 있는변수
//       LoginCode = 1;
//
//       // print('inin');
//       Prefs.setInt('LoginCode', LoginCode);
//       print(LoginCode);
//     } else {
//
//       LoginCode = 0;
//       Prefs.setInt('LoginCode', LoginCode);
//
//       print(LoginCode);
//     }
//   } else {}
// }
