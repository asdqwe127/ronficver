



import 'package:flutter/material.dart';




import 'package:ronfic_ver2/model/Club_mebers.dart';
import 'package:shared_preferences/shared_preferences.dart';



  // String clubsid;
  // DateFormat dateFormat = DateFormat("yyyy-MM-dd");
class ClubInfo with ChangeNotifier {
//   ClubInfo(){
//
//     // clubUserList();
// }
// //   String DateNow = dateFormat.format(DateTime.now());
//   List<ClubInfoUser> clubInfo = [];
//   ClubInfoUser clubUSer;
//   List<ClubInfoUser> clubgenderF = [];
//   List<ClubInfoUser> clubgenderM = [];
//
//
//   // getClub(){
//   //   clubUserList();
//   //   // notifyListeners();
//   //   return _clubInfo;
//   // }
// //   ClubInfoUser getClubtest11(){
// //
// // return clubUSer;
// // }
// //   setClub(ClubInfoUser value){
// //     clubUSer = value;
// //     notifyListeners();
// //   }
//
//   getclubGender() async {
//     print('reload step3');
//     clubgenderF.clear();
//     clubgenderM.clear();
//     clubInfo.forEach((ClubInfoUser) {
//       if (ClubInfoUser.gender.contains('Female')) clubgenderF.add(ClubInfoUser);
//       else if (ClubInfoUser.gender.contains('Male')) clubgenderM.add(ClubInfoUser);
//       // print(index_map[num+1]);clubsInfo.name.contains(index_map[num])
//     });
//   }
//
//
//
//
//     Future<bool>clubUserList(var clubId) async {
//       String tmpUri = "http://211.253.30.245/php/TEST/Allclubs.php?clubs_id="+clubId;
//     final response = await http.get(tmpUri);
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       if (data['result'][0].toString() != "false") {
//         // List<ClubInfo> test11 = data['result'][0];
//         // Map json = test11;
//         // Map json = DataValue;
//         // var user = ClubInfoUser.fromJson( data['result']);
//         // for (Map user in data['result']) {
//         //
//         //   clubInfo.add(ClubInfoUser.fromJson(user));
//         // }
//         print('reload step1');
//         final List<ClubInfoUser> dataValue = data['result'].
//         map<ClubInfoUser>((json) => ClubInfoUser.fromJson(json)).toList();
//         // setClub(ClubInfoUser.fromJson(json));
//             clubInfo.clear();
//             clubInfo.addAll(dataValue);
//            print('reload step2');
//             await getclubGender();
//         // print('df');
//         // print(clubsid);
//
//         // print(_DataValue);
//
//         // notifyListeners();
//
//         // print(_DataValue);
// return true;
//
//       }else{
//         return false;
//       }
       // var dd = individualUser.fromJson(_DataValue);
       //  print(_DataValue);
       // print(dd['userid'][0]);
       //  for( var arr in _DataValue){
       //   // dd.addAll(arr);
       //    print(arr);
       //  }

        // List<dynamic> json = _DataValue;
        // var hi = individualUser.fromJson(_DataValue);
        // Map json = _DataValue;
        // var user = jsonEncode(individualUser.fromJson(json));








        // people.clear();
        // for (var i in _DataValue) {
          // print(i);
          // int userAge = int.parse(_date.substring(0, 4)) -
          //     int.parse(i['birthday'].substring(0, 4)) + 1;
          //print(userAge.toString());
          //   people.add(Person(userAge, i['id'].toString(), i['userid'].toString(),
          //       i['user_name'].toString(), i['birthday'],i ['gender'].toString(), i['weight'].toString(), i['height'].toString(),i['clubs_id'].toString(),
          //       i['phone'], i['level'],i['target'], i['keypad'], i['is_director'].toString() == "0" ? false : true, i['reg_date'].toString(),
          //       hangulChosung(i['user_name'].toString()), i['profile_url'].toString(), i['work_date'].toString()));
          //   // print(people);
          // }
          //print(people);

        // }
    //   }
    // }
}