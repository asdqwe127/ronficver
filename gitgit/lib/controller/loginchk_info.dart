import 'dart:convert';

//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:ronfic_ver2/Ori_user_Page.dart';
// import 'package:ronfic_ver2/model/User_info.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase/firebase_io.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ronfic_ver2/controller/firebase_provider.dart';
import 'package:ronfic_ver2/controller/insert_users.dart';
import 'package:ronfic_ver2/controller/loginchk_info.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ronfic_ver2/controller/Club_Info_Admin.dart';
import 'package:ronfic_ver2/controller/auth_page.dart';
import 'package:ronfic_ver2/model/Club_mebers.dart';
import 'package:ronfic_ver2/model/User_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:ronfic_ver2/screen/loginpage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:ronfic_ver2/main.dart';

class ExistingMebers with ChangeNotifier {

  individualUser user;
  final FirebaseAuth fAuth = FirebaseAuth.instance;
  FirebaseUser userFB;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String _lastFirebaseResponse = "";


  ExistingMebers() {
    prepareUser();
    print('여기');
  }




  logout() async {
    await fAuth.signOut();
    await googleSignIn.signOut();
    SharedPreferences pref = await SharedPreferences.getInstance();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    pref.remove('userData');
    prefs.remove('userid');
    setuser(null);
    userFB = null;
  }
  individualUser getUser() {
    // if (user != null) clubsid = user.clubsId.toString();

    return user;
  }

  prepareUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString('userData') != null) {
      Map userMap = jsonDecode(pref.getString('userData'));
      user = individualUser.fromJson(userMap);
      // login(user.userid, user.uPassword);
      setuser(user);
    }
  }

  void setuser(individualUser value) {
    user = value;
    notifyListeners();

  }


  Future<bool> login(id, pw) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };
    final response = await http.post(
        "http://211.253.30.245/php/TEST/IDCHECK_TEST.php?userid=" +
            id +
            "&u_password=" +
            pw,
        headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data["result"][0].toString() != "false") {
        var DataValue = data['result'][0];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('userid');
        prefs.setString('userid', DataValue['userid']);
        // prefs.setString('userpw,',DataValue['u_password']);
        SharedPreferences prefAdmin = await SharedPreferences.getInstance();
        prefAdmin.setInt('clubid', DataValue['clubs_id']);

        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.remove('userData');
        Map json = DataValue;
        var user = jsonEncode(individualUser.fromJson(json));
        await pref.setString('userData', user);

        setuser(individualUser.fromJson(json));

        return true;
      } else {
        return false;
      }
    }
  }

  Future<bool> loginChk(String userid) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };
    final response = await http.post(
        "http://211.253.30.245/php/TEST/UserChk_google.php?userid=" + userid,
        headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data["result"][0].toString() != "false") {
        var DataValue = data['result'][0];

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('userid', DataValue['userid']);
        // SharedPreferences prefAdmin = await SharedPreferences.getInstance();
        // prefAdmin.setInt('clubid', DataValue['clubs_id']);
        SharedPreferences pref = await SharedPreferences.getInstance();

        Map json = DataValue;
        var user = jsonEncode(individualUser.fromJson(json));
        pref.setString('userData', user);
        setuser(individualUser.fromJson(json));
        print(pref.getString('userData'));
        print('llllllllllllllllllllllllllllllllllllllll');

        return true;
      } else {
        setLastFBMessage('데이터 또는 와이파이 연결상태를 확인해주세요.');
        return false;
      }
    }
  }

  Future<bool> UserResume() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('userid') != null) {
      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      };
      final response = await http.post(
          "http://211.253.30.245/php/TEST/UserChk_google.php?userid=" +
              prefs.getString('userid'),
          headers: headers);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["result"][0].toString() != "false") {
          var DataValue = data['result'][0];
          SharedPreferences pref = await SharedPreferences.getInstance();
          Map json = DataValue;
          var user = jsonEncode(individualUser.fromJson(json));
          pref.setString('userData', user);
          setuser(individualUser.fromJson(json));
          print(pref.getString('userData'));
          return true;
        } else {
          setLastFBMessage('데이터 또는 와이파이 연결상태를 확인해주세요.');
          return false;
        }
      }
    } else {
      return false;
    }
  }



  FirebaseUser getUserFB() {
    return userFB;
  }

  void setUseFB(FirebaseUser value) {
    userFB = value;
  }


  Future<bool> googleSingIn() async {
    final GoogleSignInAccount account = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await account.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final AuthResult authResult = await fAuth.signInWithCredential(credential);
    setUseFB(authResult.user);
    print(userFB.email);
    print('ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd');

    bool res = await loginChk(userFB.email);
    if (res)
      return true;
    else
      return false;
  }

  Future<bool> signUpWithEmail(String email, String password, String name,
      var phone, var keypad, photo) async {

    try {
      // ignore: non_constant_identifier_namess
      bool RES = await InsertUsers().InsertUser(email, password, name, phone, photo, keypad);
      if (RES) {
        AuthResult result = await fAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        if (result.user != null) {
          result.user.sendEmailVerification();
          // logout();
          return true;
        } else {
          // logger.e(e.toString());
          // List<String> result = e.toString().split(", ");
          // setLastFBMessage(result[1]);
          return false;
        }
      }
    } on Exception catch (e) {
      print(e.toString());

      setLastFBMessage(e.toString());
      return false;
    }
  }

  Future<bool> signInWithEmail(String email, String password) async {
    try {
      var result = await fAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      if (result != null && result.user.isEmailVerified == true) {
        login(email.trim(), password.trim());
        print(getUser());

        return true;
      } else if (result != null && result.user.isEmailVerified != true) {
        setLastFBMessage('메일 인증을 받아야 로그인이 됩니다.');
        return false;
      }
    } on Exception catch (e) {
      // print(e.toString());
      List<String> result = e.toString().split(", ");
      setLastFBMessage('아이디 혹은 비밀번호를 확인하여 주십시오');
      return false;
    }
  }

  // Firebase로부터 로그아웃
  signOut() async {
    await fAuth.signOut();
    await googleSignIn.signOut();

  }



  //  비밀번호 재설정 메일을 한글로 전송
  sendPasswordResetEmailByKorean() async {
    await fAuth.setLanguageCode("ko");
    sendPasswordResetEmail();
  }

  //  비밀번호 재설정 메일을 전송
  sendPasswordResetEmail() async {
    fAuth.sendPasswordResetEmail(email: getUser().userid);
  }

  // Firebase로부터 회원 탈퇴
  // withdrawalAccount() async {
  // await getUser().delete();
  // setUser(null);
  // }

  // Firebase로부터 수신한 메시지 설정
  setLastFBMessage(String msg) {
    _lastFirebaseResponse = msg;
  }

  getLastFBMessage() {
    String returnValue = _lastFirebaseResponse;
    _lastFirebaseResponse = null;
    return returnValue;
  }


    List<ClubInfoUser> clubInfo = [];
    ClubInfoUser clubUSer;
    List<ClubInfoUser> clubgenderF = [];
    List<ClubInfoUser> clubgenderM = [];
    List<ClubInfoUser> clubworkdata = [];
     List<ClubInfoUser> TextData = [];

     bool reload = false;
    getclubGender()  async {
          clubgenderF.clear();
          clubgenderM.clear();
          clubworkdata.clear();

       clubInfo.forEach((ClubInfoUser) {
            if (ClubInfoUser.gender.contains('Female'))
              clubgenderF.add(ClubInfoUser);
            else if (ClubInfoUser.gender.contains('Male'))
              clubgenderM.add(ClubInfoUser);
          // print('reload step3');
          });
          clubInfo.forEach((ClubInfoUser) {
            if (ClubInfoUser.workDate != '0000-00-00')
              clubworkdata.add(ClubInfoUser);
          });


        if(reload == false){
          reload = true;
          notifyListeners();
        }
    }

  onSearchChange(String text) async {

       TextData.clear();
    if (text.isEmpty) {
      notifyListeners();
      return;
    }

        clubInfo.forEach((ClubInfoUser) {
      if (ClubInfoUser.userName.contains(text)) {TextData.add(ClubInfoUser);}
           print(TextData);

    });
    notifyListeners();

  }

    Future<bool> clubUserList() async {
      String tmpUri = "http://211.253.30.245/php/TEST/Allclubs.php?clubs_id=" +
          user.clubsId.toString();
      final response = await http.get(tmpUri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['result'][0].toString() != "false") {
          // print('reload step1');
          final List<ClubInfoUser> dataValue = data['result']
              .map<ClubInfoUser>((json) => ClubInfoUser.fromJson(json))
              .toList();
          // setClub(ClubInfoUser.fromJson(json));
          clubInfo.clear();
          clubInfo.addAll(dataValue);
          // setClubinfo(dataValue);
          await getclubGender();
          // notifyListeners();
          print('reload step2');
          return true;
        } else {
          return false;
        }
      }
    }
  }