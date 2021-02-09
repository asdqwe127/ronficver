import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ronfic_ver2/controller/Club_Info_Admin.dart';
import 'package:ronfic_ver2/controller/loginchk_info.dart';
import 'package:ronfic_ver2/model/Club_mebers.dart';
import 'package:ronfic_ver2/model/IndicatorStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}


List<Color> gradientColors = [
  const Color(0xff18ffff),
  const Color(0xff23b6e6),
  // const Color(0xff00e55ff),
  // const Color(0xFF84ffff),
  // const Color(0xff02d39a),

];

  ExistingMebers em;
class _AdminHomeState extends State<AdminHome> {
  int touchedIndex;
  bool showAvg = false;
  double valueM = 0.0;
  double valueF = 0.0;
  bool showAge = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    em = Provider.of<ExistingMebers>(context);
     em.clubUserList();
    valueM = em.clubgenderM.length.toInt() / em.clubInfo.length.toInt() * 100;
    valueF = em.clubgenderF.length.toInt() / em.clubInfo.length.toInt() * 100;

    return em.reload == false && em.clubInfo.length.toString() == '0'
        ? CircularProgressIndicator()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xffffffff),
              elevation: 0,
              title: Text(
                // em.user.clubName,
                em.user.clubName,
                style: TextStyle(fontSize: 24, color: Colors.lightBlueAccent),
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
//                   FlatButton(onPressed: (){
//                     em.clubUserList();
//                      em.clubInfo.clear();
//                     em.clubgenderF.clear();
//                     em.clubgenderM.clear();
//                     em.clubworkdata.clear();
//                   print(em.clubInfo);
//                   print(em.clubgenderF.length);
//                   print(em.clubgenderM.length);
//                     print(em.clubworkdata.length);
//
//
//
// em.logout();
//                     // int memberAll = ci.clubInfo.length.toInt();
//                     // int memberF   = ci.clubgenderF.length.toInt();
//                     // int memberM   = ci.clubgenderM.length.toInt();
//                     // print('ddd');
//                     // double valueM = (memberM/memberAll*100).floorToDouble();
//                     // int valueF = (memberF/memberAll*100).floor();
//
//                   // print(valueF);
//
//                   }, child: Text('RESET'),),
                  // Stack(
                  //     children:[
                  //       Container(
                  //           // height: 150,
                  //           // width: MediaQuery.of(context).size.width,
                  //           child: Image.asset('images/adminimg.jpg',fit: BoxFit.cover,)),
                  //       Center(
                  //           child: Container(child: Text(em.user.clubName,style: TextStyle(fontSize: 50,color: Color(0xfffffffff)),))
                  //
                  //       ),
                  //
                  //
                  //
                  //     ]),
                  Column(children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffEDEDED),
                                offset: Offset(0, 7),
                                blurRadius: 5.0,
                                spreadRadius: .5,
                              ),
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0, 0),
                                blurRadius: 0.0,
                                spreadRadius: 0,
                              ),
                            ]
                            // color: Colors.blue
                            ),
                        height: 180,
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Container(
                                width: 80,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                  ),
                                ),
                                child: Center(
                                    child: Text(
                                  'DashBoard',
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  showAge = !showAge;
                                });

                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      child: Column(
                                    children: [
                                      Text(
                                        '전체 회원   ',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black54),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          em.clubInfo.length.toString() + '명',
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: 130,
                                          height: 130,
                                          child: PieChart(
                                            PieChartData(
                                                pieTouchData: PieTouchData(
                                                    touchCallback:
                                                        (pieTouchResponse) {
                                                  setState(() {
                                                    if (pieTouchResponse
                                                                .touchInput
                                                            is FlLongPressEnd ||
                                                        pieTouchResponse
                                                                .touchInput
                                                            is FlPanEnd) {
                                                      touchedIndex = -1;
                                                    } else {
                                                      touchedIndex =
                                                          pieTouchResponse
                                                              .touchedSectionIndex;
                                                    }
                                                  });
                                                }),
                                         borderData: FlBorderData(
                                                  show: false,
                                                ),
                                                sectionsSpace: 1.5,
                                                centerSpaceRadius: 25,
                                                sections:       showAge ? showingSectionsAGE() : showingSections()),
                                          ),
                                        ),
                                        showAge ?   Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: Column(
                                            children: const <Widget>[
                                              Indicator(
                                                color: Color(0xff00b1fa),
                                                text: '10대',
                                                isSquare: false,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Indicator(
                                                color: Color(0xff04db02),
                                                text: '20대',
                                                isSquare: false,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Indicator(
                                                color: Color(0xfff0c500) ,
                                                text: '30대',
                                                isSquare: false,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Indicator(
                                                color: Color(0xffdb3702),
                                                text: '40대',
                                                isSquare: false,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Indicator(
                                                color: Color(0xff8F01DB),
                                                text: '그외 ',
                                                isSquare: false,
                                              ),
                                            ],
                                          ),
                                        ) : Padding(
                                          padding: const EdgeInsets.only(left:15),
                                          child: Column(
                                            children: const <Widget>[
                                              Indicator(
                                          color: Color(0xffE80C54),
                                                text: '여성',
                                                isSquare: true,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Indicator(
                                                color: Color(0xff0A6FFF),
                                                text: '남성',
                                                isSquare: true,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffEDEDED),
                          offset: Offset(2, 7),
                          blurRadius: 5.0,
                          spreadRadius: .5,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 0),
                          blurRadius: 0.0,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // RaisedButton(onPressed: (){}
                        // ,child: Text('ad'),
                        // ),
                           Container(
                            width: 80,
                            height: 22,
                            decoration: BoxDecoration(
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey[300],
                              //     offset: Offset(1, 4),
                              //     blurRadius: 3.0,
                              //     spreadRadius: .0,
                              //   ),
                              // ],
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              'Work data',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),

                        InkWell(
                          onTap: () {
                            setState(() {
                              showAvg = !showAvg;
                            });
                          },
                          child: Center(
                            child: Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width / 1.2,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                boxShadow: [
                                  // BoxShadow(
                                  //   color: Color(0xffEDEDED),
                                  //   offset: Offset(2, 7),
                                  //   blurRadius: 5.0,
                                  //   spreadRadius: .5,
                                  // ),
                                  // BoxShadow(
                                  //   color: Colors.white,
                                  //   offset: Offset(0, 0),
                                  //   blurRadius: 0.0,
                                  //   spreadRadius: 0,
                                  // ),
                                ],
                              ),
                              child: LineChart(
                                showAvg ? avgData() : mainData(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
  double ones = 0;
  double twos = 0;
  double threes= 0;
  double fours = 0;
  double etcs = 0;
AgeSection(){
  int ones1 = 0;
  int twos2 = 0;
  int threes3= 0;
  int fours4 = 0;
  int etc5 = 0;
  DateTime now = DateTime.now();

 var  ageSection = em.clubInfo;
    for(var i=0; i < ageSection.length; i++){
      // print(ageSection[i].birthday.toString().substring(0,4));
       var birth =  ageSection[i].birthday.toString().substring(0,4);
      int.parse(DateTime.now().year.toString());
      if(int.parse(DateTime.now().year.toString())+1-int.parse(birth) >= 10 && int.parse(DateTime.now().year.toString())+1-int.parse(birth) <= 19){
        ones1++;
        ones = ones1.toDouble();
      }
   else if(int.parse(DateTime.now().year.toString())+1-int.parse(birth) >= 20 && int.parse(DateTime.now().year.toString())+1-int.parse(birth) <= 29){
       twos2++;
       twos = twos2.toDouble();
       }
    else if(int.parse(DateTime.now().year.toString())+1-int.parse(birth) >= 30 && int.parse(DateTime.now().year.toString())+1-int.parse(birth) <= 39){
       threes3++;
       threes = threes3.toDouble();

      }else if(int.parse(DateTime.now().year.toString())+1-int.parse(birth) >= 40 && int.parse(DateTime.now().year.toString())+1-int.parse(birth) <= 49){
        fours4++;
        fours = fours4.toDouble();
      }else{
      etc5++;
      etcs = etc5.toDouble();
      }
    }
}

  List<PieChartSectionData> showingSectionsAGE() {
        AgeSection();
        double one   = ones  /em.clubInfo.length.toInt()*100;
        double two   = twos  /em.clubInfo.length.toInt()*100;
        double three = threes/em.clubInfo.length.toInt()*100;
        double four  = fours /em.clubInfo.length.toInt()*100;
        double etc =  etcs /em.clubInfo.length.toInt()*100;
        //

    return List.generate(5, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 20 : 15;
      final double radius = isTouched ? 40 : 35;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff00b1fa),
            value:  one,
            title:  one.round().toString() + '%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xff04db02),
            value:  two == 0.0 ? 0: two,
            title:two == 0.0 ? '': two.round().toString()  + '%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xfff0c500),
            value: three == 0.0  ?  0:three,
            title: three == 0.0 ? '':three.round().toString() + '%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xffdb3702),
            value:  four == 0.0 ? 0:four,
            title:  four == 0.0 ? '':four.round().toString() + '%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: four == 0.0 ? 12  : fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 4:
          return PieChartSectionData(
            color: const Color(0xff8F01DB),
            value: etc == 0.0 ? 0.1:etc,
            title: etc == 0.0 ? '' :etc.round().toString() + '%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        // case 5:
        //   return PieChartSectionData(
        //     color: const Color.fromRGBO(155, 195, 213, 1),
        //     value: 2,
        //     title: '1111' + '%',
        //     radius: radius,
        //     titleStyle: TextStyle(
        //         fontSize: fontSize,
        //         fontWeight: FontWeight.bold,
        //         color: const Color(0xffffffff)),
        //   );
        default:
          return null;
      }
    });
  }


  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 20 : 15;
      final double radius = isTouched ? 40 : 35;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0A6FFF),
            value: valueM.floorToDouble(),
            title: valueM.round().toString()+ '%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xffE80C54),
            value: valueF.floorToDouble(),
            title: valueF.round().toString() + '%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}


// class TodayWorkout extends StatelessWidget {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//   em = Provider.of<ExistingMebers>(context);
//     return LineChartData(
//       gridData: FlGridData(
//         show: true,
//         drawVerticalLine: true,
//         getDrawingHorizontalLine: (value) {
//           return FlLine(
//             // color: const Color(0xff37434d),
//             color: Colors.transparent,
//             strokeWidth: 0.0,
//           );
//         },
//         getDrawingVerticalLine: (value) {
//           return FlLine(
//             color: Colors.transparent,
//             strokeWidth: 0.0,
//           );
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         bottomTitles: SideTitles(
//           showTitles: true,
//           reservedSize: 25,
//           getTextStyles: (value) => const TextStyle(
//               color: Color(0xff68737d),
//               fontWeight: FontWeight.bold,
//               fontSize: 16),
//           getTitles: (value) {
//             switch (value.toInt()) {
//               case 0:
//                 return '월';
//               case 1:
//                 return '화';
//               case 2:
//                 return '수';
//               case 3:
//                 return '목';
//               case 4:
//                 return '금';
//               case 5:
//                 return '토';
//               case 6:
//                 return '일';
//             }
//             return '';
//           },
//           margin: 10,
//         ),
//         leftTitles: SideTitles(
//           showTitles: false,
//           getTextStyles: (value) => const TextStyle(
//             color: Color(0xff67727d),
//             fontWeight: FontWeight.bold,
//             fontSize: 9,
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
//               case 20:
//                 return '20';
//               case 25:
//                 return '25';
//             }
//             return '';
//           },
//           reservedSize: 28,
//           margin: 12,
//         ),
//       ),
//       borderData: FlBorderData(
//           show: false,
//           border: Border.all(color: const Color(0xff37434d), width: 15.0)),
//       minX: 0,
//       maxX: 6,
//       minY: 0,
//       maxY: 50,
//       lineBarsData: [
//         LineChartBarData(
//           spots: [
//             FlSpot(0, 17),
//             FlSpot(1, 12),
//             FlSpot(2, 30),
//             FlSpot(3, 13),
//             FlSpot(4, 14),
//             FlSpot(5, 34),
//             FlSpot(6, 30),
//           ],
//           isCurved: true,
//           colors: gradientColors,
//           barWidth: 1,
//           isStrokeCapRound: true,
//           dotData: FlDotData(
//             show: false,
//           ),
//           belowBarData: BarAreaData(
//             show: true,
//             colors:
//             gradientColors.map((color) => color.withOpacity(0.4)).toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }
//














// Container(
//   margin: EdgeInsets.only(top: 15),
//                 height:150,
//                 width: MediaQuery.of(context).size.width/1.1,
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(10),),
//                     boxShadow: [
//
//                       //
//                         BoxShadow(
//                         color: Colors.grey,
//                         offset: Offset(0, 1.5),
//                         blurRadius: 10.0,
//                         spreadRadius: .5,
//                       ),
//                       BoxShadow(
//                         color: Colors.white,
//                         offset: Offset(.0, 0),
//                         blurRadius: 0.0,
//                         spreadRadius: .0,
//                       ),
//                     ],
//
//
//
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
//                   child: LineChart(
//                     showAvg ? avgData() : mainData(),
//                   ),
//                 ),
//               ),
//     ],
//   ),
// ),
//               );
//       SizedBox(
//         width: 60,
//         height: 29,
//         child: FlatButton(
//           onPressed: () {
//             setState(() {
//               showAvg = !showAvg;
//             });
//           },
//           child: Text(
//             'avg',
//             style: TextStyle(
//                 fontSize: 25, color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
//           ),
//         ),
//       ),
//
// // );
// }

// var one;
// var two;
// var three;
// var four;
// var five;
// var six;
// var zero;
double max = 0.0;
todayData(){
  // DateTime date = DateTime.now();
  // DateFormat('eeee').format(date);
  // if(date.weekday == 1){
  //
  // }
   // var  now      =  DateTime.now().toString().substring(0,10);
   var workdata  =  em.clubworkdata;
   int workday=0;
   // int workday1=0;
   // int workday2=0;
   // int workday3=0;
   // int workday4=0;
   // int workday5=0;
   // int workday6=0;



   // var givenYear = 1999;
   // var listOfMondays = [];
   // var dateIter = DateTime(givenYear);
   // while (dateIter.year < givenYear + 1) {
   //   dateIter.add(new Duration(days: 1));
   //   // if (dateIter.weekday == 1) {
   //   //   //1 for Monday, 2 for Tuesday, 3 for Wednesday and so on.
   //   //   listOfMondays.add(dateIter);
   //   //   // print(listOfMondays);
   //   // }
   // }
   DateTime now = DateTime.now();
    // day = workdata.toString().substring(6,7);
    // print(day);
  //  DateFormat().format(now);
  //  zero = now.day;
  // one = now.day+1;
  // two = now.day+2;
  // three = now.day+3;
  // four = now.day+4;
  // five = now.day+5;
  // six = now.day+6;
  max = workdata.length.toDouble();
   for( int i = 0 ; i < workdata.length; i++){
     if(workdata[i].workDate.substring(8,10) == now.day.toString().padLeft(2,'0')){
       workday++;
     }



   }

  //   for( int i = 0 ; i < workdata.length; i++){
  //    if(workdata[i].workDate.substring(0,4) == now.year.toString()){
  //     if(workdata[i].workDate.substring(5,7) == now.month.toString().padLeft(2,'0')){
  //
  //       if(workdata[i].workDate.substring(8,10) == zero.toString().padLeft(2,'0')){
  //         workday++;
  //       }
  //         if(workdata[i].workDate.substring(8,10) == one.toString().padLeft(2,'0')){
  //           workday1++;
  //         }
  //       if(workdata[i].workDate.substring(8,10) == two.toString().padLeft(2,'0')){
  //         workday2++;
  //       }
  //       if(workdata[i].workDate.substring(8,10) == three.toString().padLeft(2,'0')){
  //         print(workdata[i]);
  //         workday3++;
  //       }
  //       if(workdata[i].workDate.substring(8,10) == four.toString().padLeft(2,'0')){
  //         workday4++;
  //       }
  //       if(workdata[i].workDate.substring(8,10) == five.toString().padLeft(2,'0')){
  //         workday5++;
  //       }
  //       if(workdata[i].workDate.substring(8,10) == six.toString().padLeft(2,'0')){
  //         workday6++;
  //       }
  //
  //     }

     // }
    // print(workout);print('dddddd');
    // }
   return    LineChartBarData(
     spots: [
       // todayData(),
        FlSpot(0, 0) ,
       workday == 0 ? FlSpot(1, 0) :  FlSpot(1, workday.toDouble()),
       // workday2 == 0 ? FlSpot(2, 0) :  FlSpot(2, workday2.toDouble()),
       // workday3 == 0 ? FlSpot(3, 0) :  FlSpot(3, workday3.toDouble()),
       // workday4 == 0 ? FlSpot(4, 0) :  FlSpot(4, workday4.toDouble()),
       // workday5 == 0 ? FlSpot(5, 0) :  FlSpot(5, workday5.toDouble()),
       // workday6 == 0 ? FlSpot(6, 0) :  FlSpot(6, workday6.toDouble()),
     ],
     isCurved: true,
     colors: gradientColors,
     barWidth: 1,
     isStrokeCapRound: true,
     dotData: FlDotData(
       show: false,
     ),
     belowBarData: BarAreaData(
       show: true,
       colors:
       gradientColors.map((color) => color.withOpacity(0.4)).toList(),
     ),
   );

}






LineChartData mainData() {
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          // color: const Color(0xff37434d),
          color: Colors.transparent,
          strokeWidth: 0.0,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: Colors.transparent,
          strokeWidth: 0.0,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 25,
        getTextStyles: (value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 16),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return '금일운동';
            case 1:
              return   '';
            // case 2:
            //   return two.toString();
            // case 3:
            //   return three.toString();
            // case 4:
            //   return four.toString();
            // case 5:
            //   return five.toString();
            // case 6:
            //   return six.toString();
          }
          return '';
        },
        margin: 10,
      ),
      leftTitles: SideTitles(
        showTitles: false,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xff67727d),
          fontWeight: FontWeight.bold,
          fontSize: 9,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return '0';
            case 5:
              return '5';
            case 10:
              return '10';
            case 15:
              return '15';
            case 20:
              return '20';
            case 25:
              return '25';
          }
          return '';
        },
        reservedSize: 28,
        margin: 12,
      ),
    ),
    borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d), width: 15.0)),
    minX: 0,
    maxX: 1.2,
    minY: 0,
    maxY: max.toDouble(),
    lineBarsData: [
      todayData(),
    ],
  );
}



monthData(){
  var workdata  =  em.clubworkdata;
  int month1=0;
  int month2=0;
  int month3=0;
  int month4=0;
  int month5=0;
  int month6=0;
  int month7=0;
  int month8=0;
  int month9=0;
  int month10=0;
  int month11=0;
  int month12=0;

  DateTime now = DateTime.now();
  DateFormat().format(now);
  for( int i = 0 ; i < workdata.length; i++){

    if(workdata[i].workDate.substring(0,4) == now.year.toString()){
      if(workdata[i].workDate.substring(6,7) == '1'){
        month1++;
        // print(now.weekday);
        // print(workdata[i].workDate.substring(6,7));
      }else if(workdata[i].workDate.substring(6,7) == '2'){
        month2++;
        // print(month2);
      }else if(workdata[i].workDate.substring(6,7) == '3'){
        month3++;
      }

    }
    // print(spots[1]);print('dddddd');
  }



  return LineChartBarData(
    spots: [
      month1 == 0 ? FlSpot(0, 0):FlSpot(0, month1.toDouble()),
      month2 == 0 ? FlSpot(1, 0):FlSpot(1, month2.toDouble()),
      month3 == 0 ? FlSpot(2,0):FlSpot(2, month3.toDouble()),
      month4 == 0 ? FlSpot(3,0):FlSpot(3, month4.toDouble()),
      month5 == 0 ? FlSpot(4,0):FlSpot(4, month5.toDouble()),
      month6 == 0 ? FlSpot(5, 0):FlSpot(0, month6.toDouble()),
      month7 == 0 ? FlSpot(6, 0):FlSpot(1, month7.toDouble()),
      month8 == 0 ? FlSpot(7,0):FlSpot(2, month8.toDouble()),
      month9 == 0 ? FlSpot(8,0):FlSpot(3, month9.toDouble()),
      month10 == 0 ? FlSpot(9,0):FlSpot(4, month10.toDouble()),
      month11 == 0 ? FlSpot(10,0):FlSpot(4, month11.toDouble()),
      month12 == 0 ? FlSpot(11,0):FlSpot(4, month12.toDouble()),

    ],
    isCurved: true,
    colors: gradientColors,
    barWidth: 1,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(
      show: true,
      colors:
      gradientColors.map((color) => color.withOpacity(0.4)).toList(),
    ),
  );
}

LineChartData avgData() {
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          // color: const Color(0xff37434d),
          color: Colors.transparent,
          strokeWidth: 0.0,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: Colors.transparent,
          strokeWidth: 0.0,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 25,
        getTextStyles: (value) => const TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 14),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return '1월';
            case 1:
              return '2월';
            case 2:
              return '3월';
            case 3:
              return '4월';
            case 4:
              return '5월';
            case 5:
              return '6월';
            case 6:
              return '7월';
            case 7:
              return '8월';
            case 8:
              return '8월';
            case 9:
              return '10월';
            case 10:
              return '11월';
            case 11:
              return '12월';
          }
          return '';
        },
        margin: 10,
      ),
      leftTitles: SideTitles(
        showTitles: false,
        getTextStyles: (value) => const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 9,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return '0';
            case 5:
              return '5';
            case 10:
              return '10';
            case 15:
              return '15';
            case 20:
              return '20';
            case 25:
              return '25';
          }
          return '';
        },
        reservedSize: 28,
        margin: 12,
      ),
    ),
    borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d), width: 15.0)),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 50,
    lineBarsData: [
      monthData(),
    ],
  );
}
