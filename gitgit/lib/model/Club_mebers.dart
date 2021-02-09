// class clubInfo {
//   List<ClubInfo> result;
//
//   clubInfo({this.result});
//
//   clubInfo.fromJson(Map<String, dynamic> json) {
//     if (json['result'] != null) {
//       result = new List<ClubInfo>();
//       json['result'].forEach((v) {
//         result.add(new ClubInfo.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.result != null) {
//       data['result'] = this.result.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

import 'package:flutter/material.dart';

class ClubInfoUser{
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
  var workoutTarget;
  String clubName;
  String profileUrl;
  String workDate;
  String height;
  String weight;
  var isSupervisor;
  var isExpert;
  var isDirector;
  String regDate;

  ClubInfoUser(
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
        this.workoutTarget,
        this.clubName,
        this.profileUrl,
        this.workDate,
        this.height,
        this.weight,
        this.isSupervisor,
        this.isExpert,
        this.isDirector,
        this.regDate});

  factory ClubInfoUser.fromJson(Map<String, dynamic> json) {
    return ClubInfoUser(
    id : json['id'],
    userid : json['userid'],
    userName : json['user_name'],
    uPassword : json['u_password'],
    rfid : json['rfid'],
    email : json['email'],
    phone : json['phone'],
    birthday : json['birthday'],
    gender : json['gender'],
    keypad : json['keypad'],
    clubsId : json['clubs_id'],
    workoutLevel : json['workout_level'],
    workoutTarget : json['workout_target'],
    clubName : json['club_name'],
    profileUrl : json['profile_url'],
    workDate : json['work_date'],
    height : json['height'],
    weight : json['weight'],
    isSupervisor : json['is_supervisor'],
    isExpert : json['is_expert'],
    isDirector : json['is_director'],
    regDate :json['reg_date'],
    );
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
    data['workout_target'] = this.workoutTarget;
    data['club_name'] = this.clubName;
    data['profile_url'] = this.profileUrl;
    data['work_date'] = this.workDate;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['is_supervisor'] = this.isSupervisor;
    data['is_expert'] = this.isExpert;
    data['is_director'] = this.isDirector;
    data['reg_date'] = this.regDate;
    return data;
  }
  String toString() {
    return '{ ${this.id}, ${this.userid}, ${this.userName},${this.birthday},${this.gender}, ${this.weight},${this.profileUrl}=>?,${this.workDate}, ${this.keypad},${this.clubsId} }';
  }

}











