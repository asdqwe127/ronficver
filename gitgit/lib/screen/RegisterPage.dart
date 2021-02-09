import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ronfic_ver2/controller/insert_users.dart';
import 'package:ronfic_ver2/controller/loginchk_info.dart';
import 'package:ronfic_ver2/model/style.dart';
import 'package:ronfic_ver2/screen/Register_Complete.dart';


class RegisterPage extends StatefulWidget  {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

// List<Widget> _SelectedTab = <Widget>[home(), likes(), search(), profile()];
    ExistingMebers em;
class _RegisterPageState extends State<RegisterPage> {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _emailController = new TextEditingController();
    TextEditingController _nameController  = new TextEditingController();
    TextEditingController _phoneController   = new TextEditingController();
    TextEditingController _passwordController   = new TextEditingController();
    @override
    void dispose() {
      _emailController.dispose();
      _passwordController.dispose();
      _nameController.dispose();
      super.dispose();
    }
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
    @override
  Widget build(BuildContext context) {

      em = Provider.of<ExistingMebers>(context);
    final width = MediaQuery.of(context).size.width / 1.1;
    return Scaffold(
      key:_scaffoldKey,
      appBar: RegAppBar(context,'회원가입'),
     body:ListView(
       children: [
         SafeArea(
           child: Center(
             child: Container(
               // color: Colors.grey,
               width: width,
               child: Column(
                 // mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget> [
                   Padding(
                     padding: const EdgeInsets.only(top: 30),
                     child: Text('간편 회원가입',style: TextStyle(color: Colors.lightBlue,fontSize: 24,fontWeight: FontWeight.bold),),
                   ),
                   Text('간단한 정보만으로 론픽존을 이용하실수 있습니다.',style: TextStyle(color: Colors.grey,fontSize: 14),),
                   Divider(color: Colors.grey[300], height: 50, thickness: 1.5,),
                   Form(
                      key: _formKey,
                     child: Column(
                       children: <Widget>[
                         em.userFB  != null ? Text(em.userFB.photoUrl) : TextFormField(
                           autofocus: true,

                           keyboardType: TextInputType.name,
                           controller: _nameController,
                           textInputAction: TextInputAction.next,
                           decoration: InputDecoration(
                               icon: Icon(Icons.person_outline),
                                 labelText: '이름',
                             border: OutlineInputBorder(
                               borderRadius:BorderRadius.all(Radius.circular(10)),
                             ),
                             hintText: '이름을 입력하세요'
                           ),
                           validator: (value) {
                             if (value.isEmpty) {
                               return '이름을 입력해 주세요.';
                             }
                             // if(value.isNotEmpty){
                             //   return '이름을 입력해 주세요.';
                             // }
                               return null;
                           },
                         ),
                         SizedBox(height: 15,),
                         em.userFB  != null ?  Container()  :TextFormField(
                           controller: _emailController,
                           textInputAction: TextInputAction.next,
                           decoration: InputDecoration(
                             icon: Icon(Icons.mail_outline),
                               labelText: 'ID(이메일)',
                               border: OutlineInputBorder(
                                 borderRadius:BorderRadius.all(Radius.circular(10)),
                               ),
                               hintText: '메일 인증이 발송됩니다.'
                           ),
                           validator: (value) {
                             if (value.isEmpty) {
                               return '이메일을 입력해 주세요.';
                             } else
                               return null;
                           },
                         ),
                         SizedBox(height: 15,),

                           TextFormField(

                             controller: _passwordController,
                             textInputAction: TextInputAction.next,
                             decoration: InputDecoration(
                                 icon: Icon(Icons.vpn_key_outlined,),
                                 labelText: '비밀번호',
                                 border: OutlineInputBorder(
                                   borderRadius:BorderRadius.all(Radius.circular(10)),
                                 ),
                                 hintText: '비밀번호를 입력해 주세요.'
                             ),
                             validator: (value) {
                               if (value.isEmpty) {
                                 return '비빌번호를 입력해 주세요.';
                               } else
                                 return null;
                             },
                           ),

                         SizedBox(height: 15,),
                         TextFormField(

                           style: TextStyle(
                             color: Colors.blueAccent,


                           ),
                           textInputAction: TextInputAction.done,
                           controller: _phoneController,
                           decoration: InputDecoration(
                               icon: Icon(Icons.phone_android_outlined),
                               labelText: '전화번호',
                              labelStyle: TextStyle(
                           ),
                               border: OutlineInputBorder(
                                 borderRadius:BorderRadius.all(Radius.circular(10)),
                               ),
                               hintText: '* 전화번호로 키패드가 적용됩니다.'
                           ),
                           keyboardType: TextInputType.number,
                           // ignore: deprecated_member_use
                           inputFormatters: [WhitelistingTextInputFormatter(RegExp('[0-9]')),],
                           validator: (value) {
                             if (value.isEmpty) {
                               return 'Enter some text';
                             } else
                               return null;
                           },
                         ),
                         SizedBox(height: 35,),
                     // RaisedButton(
                     //   color:Theme.of(context).primaryColor,
                     //   onPressed: (){
                     //     if(_formKey.currentState.validate()){
                     //       _formKey.currentState.save();
                     //     }
                     //   },
                     //   child: Text("Submit",style: TextStyle(color: Colors.white),),
                     // ),
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
                             child: Text('가입하기',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                             onPressed:  ()async{
                               KeyGenReturn keygen  = KeyGenReturn() ;
                               for(int i=4;i<=8;i++)  {
                                  await keygen.keypadCheckRE(_phoneController.text,i);
                                 // print(keygen.KeyNum);

                                 if(keygen.KeygenResult) break;

                               }
                                  if(keygen.KeygenResult)
                               if(_formKey.currentState.validate()){
                                 _formKey.currentState.save();
                                  _signUp();
                               }
                             },
                           ),
                         )
                       ],
                     ),
                   )
                 ],
               ),
             ),
           ),
         ),
       ],
     ),
    );
  }
    void _signUp() async {
      _scaffoldKey.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          duration: Duration(seconds: 10),
          content: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              Text(" 가입 하는 중..")
            ],
          ),
        ));
      if(em.userFB  != null){
       // bool result = await em.signUpWithEmail(em.users.email, _passwordController.text,em.users.displayName,_phoneController.text);
       bool result = await  InsertUsers().InsertUser(em.userFB.email.trim(), _passwordController.text.trim(),em.userFB.displayName,_phoneController.text.trim(),em.userFB.photoUrl,keypad1,);
       if (result) {
         em.login(em.userFB.email,_passwordController.text.trim());
         Navigator.push(
             context, CupertinoPageRoute(builder: (context) => RegisterComplete()));
       }  else {
         showLastFBMessage();
       }
      }else{bool result = await em.signUpWithEmail(_emailController.text.trim(), _passwordController.text.trim(),_nameController.text.trim(),_phoneController.text.trim(),keypad1,'0',);
      if (result) {
        em.login(_emailController.text.trim(),_passwordController.text.trim());
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => RegisterComplete()));
      }  else {
        showLastFBMessage();
      }
      }

      _scaffoldKey.currentState.hideCurrentSnackBar();


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
}
/// 나중에 따로 controller page 만들어서 관리
String keypad1;
class KeyGenReturn{
  bool KeygenResult = false;
  String tmpKeypad;
  Future<KeyGenReturn> keypadCheckRE(String keypad, int num) async {
    print(keypad);
    tmpKeypad = keypad.substring(keypad.length - num, keypad.length).trim();
    // print(tmpKeypad);
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };
    final response = await http.post(
        "http://211.253.30.245/php/TEST/KEYNoCHECK_TEST.php?keypad="+tmpKeypad,
        headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
        print(data['result']);
      if (data['result'].toString() == 'false') {
        KeygenResult = true;
        keypad1 = tmpKeypad;

      }
    }
  }
}






//       Scaffold(
//       appBar: AppBar(
//         title: Text('BottomNavigationBar'),
//       ),
//       body: Center(
//           child: _widgetOptions.elementAt(_selectedIndex)),
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(color: Colors.white, boxShadow: [
//           BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
//         ]),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
//             child: SalomonBottomBar(
//                 // gap: 8,
//                 // activeColor: Colors.white,
//                 // iconSize: 24,
//                 // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                 // duration: Duration(milliseconds: 800),
//                 // tabBackgroundColor: Colors.grey[800],
//                 items: [
//                   SalomonBottomBarItem(
//                     icon: Icon(Icons.home),
//                     title: Text("Home"),
//                     selectedColor: Colors.purple,
//                   ),
//                   SalomonBottomBarItem(
//                     icon: Icon(Icons.home),
//                     title: Text("Home"),
//                     selectedColor: Colors.purple,
//                   ),
//                   SalomonBottomBarItem(
//                     icon: Icon(Icons.home),
//                     title: Text("Home"),
//                     selectedColor: Colors.purple,
//                   ),
//                   SalomonBottomBarItem(
//                     icon: Icon(Icons.home),
//                     title: Text("Home"),
//                     selectedColor: Colors.purple,
//                   ),
//                 ],
//                 currentIndex: _selectedIndex,
//                 onTap: (index) {
//                   setState(() {
//                     _selectedIndex = index;
//                     print(index);
//                   });
//                 }),
//           ),
//         ),
//       ),
//
//     );
//   }
// }
//
// home() {
//   print('home');
//   return Text('index');
// }
//
// likes() {
//   print('likes');
//   return Text('dd2');
// }
//
// search() {
//   return Text('dd3');
// }
//
// profile() {
//   return Text('4');
// }

// home(){
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('hi'),
//     ),
//   );
// }
