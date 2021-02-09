import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ronfic_ver2/controller/auth_page.dart';
import 'package:ronfic_ver2/controller/loginchk_info.dart';


TextStyle baseTextStyle() {
  return TextStyle(fontFamily: 'Poppins');
}

TextStyle headerTextStyle() {
  return baseTextStyle().copyWith(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );
}

TextStyle regularTextStyle() {
  return baseTextStyle().copyWith(
    color: Color(0xffb6b2df),
    fontSize: 9.0,
    fontWeight: FontWeight.w400,
  );
}

TextStyle subHeaderTextStyle() {
  return regularTextStyle().copyWith(fontSize: 12.0);
}


ExistingMebers em;
AppBar RegAppBar(BuildContext context,String msg){
em = Provider.of<ExistingMebers>(context);
  return AppBar(
    title: Text(
      msg,
      style: TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
          fontSize: 18),
    ),
    centerTitle: true,
    leading: InkWell(
        onTap: () {
          if(em.userFB != null){ em.logout();}

          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => AuthPage()), (route) => false);
        },
        child: Icon(Icons.arrow_back_ios)),
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.blueAccent),

  );
}