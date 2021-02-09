import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ronfic_ver2/controller/loginchk_info.dart';
import 'package:ronfic_ver2/model/Club_mebers.dart';



ExistingMebers em;
class AdminSearchPage extends StatelessWidget {
  final ClubInfoUser member;

  AdminSearchPage({Key key, @required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  em = Provider.of<ExistingMebers>(context);

  return Scaffold(
      appBar: AppBar(
        title: Text(member.userName.toString()),
      ),
    );
  }
}
