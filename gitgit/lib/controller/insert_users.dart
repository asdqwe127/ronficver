import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ronfic_ver2/controller/loginchk_info.dart';
import 'package:ronfic_ver2/screen/RegisterPage.dart';
class InsertUsers{


  // ignore: missing_return
  Future<bool> InsertUser(String id, String pw,String name,var phone,var photo,var keypad ) async {

    // final id = prefs.getString('id');
    // final pw = prefs.getString('pw');
    //    https://github.com/wogus3602/Login-Logout-Flutter-/blob/master/lib/user_repository.dart
    // prefs = await SharedPreferences.getInstance();
    // $sql = "call ronfic.RE_Insert_users('$userid','$user_name', '$password', '$phone', '$keypad',);";
    Map<String, String> headers = {'Content-Type': 'application/json;charset=UTF-8', 'Charset': 'utf-8'};
    final response = await http.post("http://211.253.30.245/php/TEST/INSERT_USER_2.php?userid="+id+"&username="+name+'&password='+pw+'&phone='+phone+'&keypad='+keypad+'&profileurl='+photo,
        headers: headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data["result"][0].toString() != "is_success:-1") {
       // ExistingMebers().logout();
        var DataValue = data['result'][0];
          print(DataValue);

        // var userinfo = individualUser.fromJson(DataValue);
        // SharedPreferences pref = await SharedPreferences.getInstance();
        // Map json = DataValue;
        // var user = jsonEncode(individualUser.fromJson(json));
        // pref.setString('userData', user);
        // setuser(individualUser.fromJson(json));


        return true;
      } else {
        return false;
      }

    }
  }



}