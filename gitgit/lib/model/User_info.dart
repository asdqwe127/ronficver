import 'dart:convert';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class individualUser {
  var id;
  String userid;
  String userName;
  String uPassword;
  String rfid;
  String email;
  String phone;
  String birthday;
  String gender;
  String keypad;
  var clubsId;
  var workoutLevel;
  String profile_url;
  String clubName;
  String height;
  String weight;
  var isSupervisor;
  var isExpert;
  var isDirector;
  String regDate;

  individualUser(
      {this.id,
        this.userid,
        this.userName,
        this.uPassword,
        this.rfid,
        this.email,
        this.phone,
        this.birthday,
        this.gender,
        this.keypad,
        this.clubsId,
        this.workoutLevel,
        this.clubName,
        this.height,
        this.weight,
        this.profile_url,
        this.isSupervisor,
        this.isExpert,
        this.isDirector,
        this.regDate});

  individualUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    userName = json['user_name'];
    uPassword = json['u_password'];
    rfid = json['rfid'];
    email = json['email'];
    phone = json['phone'];
    birthday = json['birthday'];
    gender = json['gender'];
    keypad = json['keypad'];
    clubsId = json['clubs_id'];
    workoutLevel = json['workout_level'];
    clubName = json['club_name'];
    height = json['height'];
    weight = json['weight'];
    profile_url = json['profile_url'];
    isSupervisor = json['is_supervisor'];
    isExpert = json['is_expert'];
    isDirector = json['is_director'];
    regDate = json['reg_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userid'] = this.userid;
    data['user_name'] = this.userName;
    data['u_password'] = this.uPassword;
    data['rfid'] = this.rfid;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    data['keypad'] = this.keypad;
    data['clubs_id'] = this.clubsId;
    data['workout_level'] = this.workoutLevel;
    data['club_name'] = this.clubName;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['profile_url'] = this.profile_url;
    data['is_supervisor'] = this.isSupervisor;
    data['is_expert'] = this.isExpert;
    data['is_director'] = this.isDirector;
    data['reg_date'] = this.regDate;
    return data;
  }
  @override
  String toString() {
    return 'userinfo: {id: ${id}, userid: ${userid},userName: ${userName},uPassword: ${uPassword},rfid: ${rfid}email: ${email},'
           'phone: ${phone},birthday: ${birthday},phone: ${phone},gender: ${gender},keypad: ${keypad},clubsId: ${clubsId},'
           'workoutLevel:${workoutLevel},clubName:${clubName},height:${height},weight:${weight},isSupervisor:${isSupervisor},'
           'isExpert:${isExpert},isDirector:${isDirector},regDate:${regDate},profile:${profile_url}';
  }
}

// static String encode(List<individualUser> musics) => json.encode(
//   musics
//       .map<Map<String, dynamic>>((music) => individualUser.toMap(music))
//       .toList(),
// );
//
// static List<individualUser> decode(String musics) =>
//     (json.decode(musics) as List<dynamic>)
//         .map<individualUser>((item) => individualUser.fromJson(item))
//         .toList();