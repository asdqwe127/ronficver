import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ronfic_ver2/controller/Club_Info_Admin.dart';
import 'package:ronfic_ver2/controller/auth_page.dart';

import 'package:ronfic_ver2/controller/loginchk_info.dart';
import 'package:ronfic_ver2/screen/Admin_Search.dart';
import 'package:ronfic_ver2/screen/Admin_Setting.dart';
import 'package:ronfic_ver2/screen/Admin_home.dart';
import 'package:ronfic_ver2/screen/HomePage.dart';
import 'package:ronfic_ver2/screen/Homebottom.dart';
import 'package:ronfic_ver2/screen/signedin_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
//
//
// ExistingMebers em;
//
class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int _selectedIndex = 1;
  // List<Color> gradientColors = [
  //   const Color(0xff23b6b5),
  //   const Color(0xff02d39a),
  //   const Color.fromARGB(255, 255, 255, 0),
  // ];
  // bool showAvg = false;
  // ClubInfo ci;
  // ExistingMebers em;
  List<Widget> _widgetOptions = <Widget>[
    AdminHome(),
    AdminSearch(),
    AdminSetting(),
  ];
  @override
  Widget build(BuildContext context) {
    // ci = Provider.of<ClubInfo>(context);
    // em = Provider.of<ExistingMebers>(context);
    // var data1 = ci.getClub();
    // return
   return Scaffold(
      body:Center(
          child: _widgetOptions.elementAt(_selectedIndex)),
        bottomNavigationBar: Container(
          height:60,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(blurRadius: 0, color: Colors.black.withOpacity(.1))
          ]),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0),
              child: SalomonBottomBar(
                  items: [
                    SalomonBottomBarItem(
                      icon: Icon(Icons.home),
                      title: Text("Home"),
                      selectedColor: Colors.blue,
                    ),
                    SalomonBottomBarItem(
                      icon: Icon(Icons.search),
                      title: Text("search"),
                      selectedColor: Colors.lightGreen,
                    ),
                    SalomonBottomBarItem(
                      icon: Icon(Icons.android_sharp),
                      title: Text("setting"),
                      selectedColor: Colors.lightBlueAccent,
                    ),
                    // SalomonBottomBarItem(
                    //   icon: Icon(Icons.whatshot_sharp),
                    //   title: Text("Home"),
                    //   selectedColor: Colors.deepOrange,
                    // ),
                  ],
                  currentIndex: _selectedIndex,
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                      print(index);
                    });
                  }),
            ),
          ),
        ),

    );
  }
}

// Scaffold(
//   appBar: AppBar(
//     title: Text('i dont Know'),
//   ),
//       body:Center(
//         child: ListView.builder(itemCount: data1.length,
//             itemBuilder: (context, index){
//               final info = data1[index];
//               return listTitle(info.id,info.userid);
//             }
//
//         ),
//       ),
//     );
//
//   }
//   Widget listTitle(int id,String userid) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           FlatButton(onPressed: (){em.logout();},child: Text('logout'),),
//       FlatButton(onPressed: ()async{
//
//           // await em.login('bbat', '8179');
//           // em.logout();
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (BuildContext context) => SignedInPage(),
//             ),
//           );
//
//
//
//       }, child: Text('사용자 화면으로 이동')),
//       Text(userid.toString() ?? "불러오는중",style: TextStyle(fontSize: 50),),
//
//
//         ],
//       ),
//     );
//
//   }
// }
//       Column(
//         children: [
//
//           FlatButton(onPressed: (){
//             // ci.clubUserList();
//             em.logout();
//             }, child: Text('dfdfdfdfdfdf\n\n\n\n\n\n')),
//           Center(
//             child: Container(
//     width: MediaQuery.of(context).size.width/1.5,
//     height: 150,
//                 color: Colors.black,
//     child:LineChart(
//             mainData(),
//     ),
//     ),
//           ),
//         ],
//       ),
//
//     );
//   }
//
//   LineChartData mainData() {
//     return LineChartData(
//       gridData: FlGridData(
//         show: true,
//         drawVerticalLine: true,
//         getDrawingHorizontalLine: (value) {
//           return FlLine(
//             color: const Color(0xff37434d),
//             strokeWidth: 0.5,
//           );
//         },
//         getDrawingVerticalLine: (value) {
//           return FlLine(
//             color: const Color(0xff37434d),
//             strokeWidth: 0.5,
//           );
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         bottomTitles: SideTitles(
//           showTitles: true,
//           reservedSize: 18,
//           getTextStyles: (value) =>
//           const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
//           getTitles: (value) {
//             switch (value.toInt()) {
//               case 0:
//                 return 'Mon';
//               case 2:
//                 return 'Tue';
//               case 4:
//                 return 'Wen';
//               case 6:
//                 return 'Thr';
//               case 8:
//                 return 'Fri';
//               case 10:
//                 return 'Sat';
//               case 12:
//                 return 'Sun';
//             }
//             return '';
//           },
//           margin: 5,
//         ),
//         leftTitles: SideTitles(
//           showTitles: true,
//           getTextStyles: (value) => const TextStyle(
//             color: Color(0xff67727d),
//             fontWeight: FontWeight.bold,
//             fontSize: 15,
//           ),
//           getTitles: (value) {
//             switch (value.toInt()) {
//               case 0:
//                 return '0';
//               case 5:
//                 return '5';
//               case 10:
//                 return '10';
//               case 15:
//                 return '15';
//               // case 20:
//               //   return '20';
//               // case 25:
//               //   return '25';
//               // case 30:
//               //   return '30';
//
//             }
//             return null;
//           },
//           reservedSize: 20,
//           margin: 5,
//         ),
//       ),
//       borderData:
//       FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 0.5)),
//       minX: 0,
//       maxX: 12,
//       minY: 0,
//       maxY: 15,
//       lineBarsData: [
//         LineChartBarData(
//           spots: [
//             FlSpot(0, 1),
//             FlSpot(2, 10),
//             FlSpot(4, 15),
//             FlSpot(6, 20),
//             FlSpot(8, 1),
//             FlSpot(10, 7),
//             FlSpot(12, 1),
//
//
//             // FlSpot(13, 4),
//             // FlSpot(14, 4),
//             // FlSpot(11, 4),
//             // FlSpot(11, 4),
//
//
//           ],
//           isCurved: true,
//
//           colors: gradientColors,
//           barWidth: 5,
//           isStrokeCapRound: true,
//           dotData: FlDotData(
//             show: true,
//           ),
//           belowBarData: BarAreaData(
//             show: true,
//             colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
//           ),
//         ),
//       ],
//     );
//   }
//
//   LineChartData avgData() {
//     return LineChartData(
//       lineTouchData: LineTouchData(enabled: true),
//       gridData: FlGridData(
//         show: true,
//         drawHorizontalLine: true,
//         getDrawingVerticalLine: (value) {
//           return FlLine(
//             color: const Color(0xff37434d),
//             strokeWidth: 1,
//           );
//         },
//         getDrawingHorizontalLine: (value) {
//           return FlLine(
//             color: const Color(0xff37434d),
//             strokeWidth: 1,
//           );
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         bottomTitles: SideTitles(
//           showTitles: true,
//           reservedSize: 22,
//           getTextStyles: (value) =>
//           const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
//           getTitles: (value) {
//             switch (value.toInt()) {
//               case 2:
//                 return 'MAR';
//               case 5:
//                 return 'JUN';
//               case 8:
//                 return 'SEP';
//             }
//             return '';
//           },
//           margin: 8,
//         ),
//         leftTitles: SideTitles(
//           showTitles: true,
//           getTextStyles: (value) => const TextStyle(
//             color: Color(0xff67727d),
//             fontWeight: FontWeight.bold,
//             fontSize: 15,
//           ),
//           getTitles: (value) {
//             switch (value.toInt()) {
//               case 1:
//                 return '10k';
//               case 3:
//                 return '30k';
//               case 5:
//                 return '50k';
//             }
//             return '';
//           },
//           reservedSize: 28,
//           margin: 12,
//         ),
//       ),
//       borderData:
//       FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
//       minX: 0,
//       maxX: 11,
//       minY: 0,
//       maxY: 6,
//       lineBarsData: [
//         LineChartBarData(
//           spots: [
//             FlSpot(0, 3.44),
//             FlSpot(2.6, 3.44),
//             FlSpot(4.9, 3.44),
//             FlSpot(6.8, 3.44),
//             FlSpot(8, 3.44),
//             FlSpot(9.5, 3.44),
//             FlSpot(11, 3.44),
//           ],
//           isCurved: true,
//           colors: [
//             ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2),
//             ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2),
//           ],
//           barWidth: 5,
//           isStrokeCapRound: true,
//           dotData: FlDotData(
//             show: false,
//           ),
//           belowBarData: BarAreaData(show: true, colors: [
//             ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2).withOpacity(0.1),
//             ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2).withOpacity(0.1),
//           ]),
//         ),
//       ],
//     );
//   }
// }


// Stack(
//   children: <Widget>[
//     AspectRatio(
//       aspectRatio:1.5,
//       child: Container(
//         decoration: const BoxDecoration(
//             // borderRadius: BorderRadius.all(
//             //   Radius.circular(0),
//             // ),
//             color: Color(0xff232d37)),
//         child: Padding(
//           padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
//           child: LineChart(
//             showAvg ? avgData() : mainData(),
//           ),
//         ),
//       ),
//     ),
//     SizedBox(
//       width: 60,
//       height: 400,
//       child: FlatButton(
//         onPressed: () {
//           setState(() {
//             showAvg = !showAvg;
//           });
//         },
//         child: Text(
//           'avg',
//           style: TextStyle(
//               fontSize: 12, color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
//         ),
//       ),
//     ),
//   ],
// ),