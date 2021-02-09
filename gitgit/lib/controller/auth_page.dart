import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ronfic_ver2/controller/Club_Info_Admin.dart';
import 'package:ronfic_ver2/controller/firebase_provider.dart';
import 'package:ronfic_ver2/controller/loginchk_info.dart';
import 'package:ronfic_ver2/screen/AdminPage.dart';
import 'package:ronfic_ver2/screen/ScreenFirst.dart';
import 'package:ronfic_ver2/screen/SignInPage.dart';
import 'package:ronfic_ver2/screen/signedin_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

AuthPageState pageState;

class AuthPage extends StatefulWidget {
  @override
  AuthPageState createState() {
    pageState = AuthPageState();
    return pageState;
  }
}

class AuthPageState extends State<AuthPage> {
  // bool ischk = false;
  @override
  void initState() {
    super.initState();
    // initChk();
    // ExistingMebers().setuser();

  }
 initChk()async{

  // em.UserResume();
  // ExistingMebers em = ExistingMebers();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // em.loginChk(prefs.getString('userid'));
  // class GlobalProvider extends ChangeNotifier
  // {   static const _APP_INFO_LIST123 = "appInfoList123";
  // GlobalProvider(){     syncDataWithProvider();   }   List appInfoList123 = [];
  // Future updateSharedPreferencesAppInfo123(List value) async {
  //   List myAppInfoList123 = value.map((e) => json.encode(e)).toList();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final result =         await prefs.setStringList(_APP_INFO_LIST123, myAppInfoList123);
  //   print('result from updateSP $result');     print('Myappinfolist123 : $myAppInfoList123');   }
  //   Future syncDataWithProvider() async {     SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var result = prefs.getStringList(_APP_INFO_LIST123);     print('The Result is $result');
  //   if (result != null) {       appInfoList123 = result           .map((e) => AppInfoModel.fromJson(json.decode(e)))           .toList();     }     print('Hore $appInfoList123');     notifyListeners();   }   }

}
  async()async{

    // await ci.clubUserList(em.getUser().clubsId.toString());
  }

  ExistingMebers em;
  // ClubInfo ci;
  @override
  Widget build(BuildContext context) {
    // ci = Provider.of<ClubInfo>(context);
    em = Provider.of<ExistingMebers>(context);
    // if (em.getUser() != null ) {
    //     //   return SignedInPage();
    //     // }
    if(em.getUser() != null){
      if(em.getUser().isDirector == 1){
        setState((){em.clubUserList();});
        return AdminPage();
      }

      return SignedInPage();
    }else if(em.user != null ) {
      return SignedInPage();
    }else {
         return ScreenFirst();
    }
      // LoginPage();
      // SignInPage();
    }
  }

// && fp.getUser().isEmailVerified == true