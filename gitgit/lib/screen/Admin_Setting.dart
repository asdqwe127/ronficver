import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ronfic_ver2/controller/loginchk_info.dart';








ExistingMebers em;
class AdminSetting extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    em = Provider.of<ExistingMebers>(context);
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('setting',style: TextStyle(fontSize: 24, color: Colors.lightBlueAccent ),),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){em.logout();},
          child: Text('아웃'),
        ),
      ),
    );
  }
}
