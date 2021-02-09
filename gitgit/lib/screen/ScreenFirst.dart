import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ronfic_ver2/controller/auth_page.dart';
import 'package:ronfic_ver2/controller/firebase_provider.dart';
import 'package:ronfic_ver2/controller/google_provider.dart';
import 'package:ronfic_ver2/controller/loginchk_info.dart';
import 'package:ronfic_ver2/screen/AgreePage.dart';
import 'package:ronfic_ver2/screen/RegisterPage.dart';
import 'package:ronfic_ver2/screen/Register_Complete.dart';
import 'package:ronfic_ver2/screen/SignInPage.dart';
import 'package:ronfic_ver2/screen/signedin_page.dart';
import 'package:video_player/video_player.dart';

import 'Ori_user_Page.dart';











class ScreenFirst extends StatefulWidget {
  @override
  _ScreenFirstState createState() => _ScreenFirstState();
}

ExistingMebers em;
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
class _ScreenFirstState extends State<ScreenFirst> {
   VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    // _controller = VideoPlayerController.network(
    //   "http://211.253.30.245/video/Xim/17.Decline_Bench.mp4");

      // _controller = VideoPlayerController.network(
      //   "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    _controller = VideoPlayerController.asset("video/ronficVideo.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
    _controller.setVolume(0.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    em = Provider.of<ExistingMebers>(context);

    return Scaffold(
      key: _scaffoldKey,
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return
              Stack(
                children: <Widget>[
                  SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: SizedBox(
                        width: MediaQuery.of(context).size?.width ?? 0,
                        height:MediaQuery.of(context).size?.height ?? 0,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  ),
                  LoginWidget(context)
                ],
              );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       if (_controller.value.isPlaying) {
      //         _controller.pause();
      //       } else {
      //         _controller.play();
      //       }
      //     });
      //   },
      //   child:
      //   Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      // ),
    );
  }

}
 LoginWidget(BuildContext context){
   textWhite (String text) {
     return Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),);
   }
   // final MediaH = MediaQuery.of(context).size.height;
   final MediaW = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(

              child: Center(
                child: Container (
                  // color: Colors.red,
                  // height: MediaH,
                  width: MediaW/1.4,
                  child: Image.asset('images/ronfic_logo_green_resize2.png',color:Color.fromRGBO(255, 255, 255, 1)),
                ),
              ),
            ),

            SafeArea(
              child: Container(
                height: 190,
                width: MediaW/1.1,
                // color: Colors.blueGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      onPressed: ()async{
                        await  googlesign(context);
                   // fp.googleSingIn();
                        // googlesign(context);
                        // bool result = await fp.googleSingIn();
                        //
                        // if(result)Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => AuthPage()),(route) => false);

                        // if(result)Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (BuildContext context) => AuthPage(),
                        //   ),
                        // );

                      },
                      color:Colors.white,
                      shape: StadiumBorder(),
                      child: Container(
                          width: MediaW,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('images/google1.png',width: MediaW/14,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text('Google sign in',style: TextStyle(fontSize:16,color: Colors.black87,fontWeight: FontWeight.w400),),
                                )
                              ],
                            ),
                          )
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: FlatButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginPage1()),

                              );
                              },
                            shape: StadiumBorder(),
                            color: Colors.blueAccent,
                            child: Container(
                              // width: MediaW/2.7,
                              height: 50,
                            child: Center(child:textWhite('기존회원')),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: OutlineButton(onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AgreePage()),
                            );
                          },
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.2),
                            shape:StadiumBorder(),
                            child:Container(
                                height: 50,
                                child: Center(child:textWhite('가입하기'))
                            ),
                          ),
                        ),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          textWhite('이미 계정이 있으십니까?'),
                          FlatButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                            },
                              child: Text(' '
                              '로그인',style: TextStyle(color: Colors.blue),)),
                        ],
                      ),
                    ),
                  ],
                ),

              ),
            ),
          ],
        ),

    );

  }
void googlesign(BuildContext context) async {
     _scaffoldKey.currentState
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      duration: Duration(seconds:10),
      content: Row(
        children: <Widget>[
          CircularProgressIndicator(),
          Text("   로그인중 입니다...")
        ],
      ),
    ));

  bool result = await em.googleSingIn();
  _scaffoldKey.currentState.hideCurrentSnackBar();
  if (result) Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => AuthPage()), (route) => false);
   else   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => RegisterPage()), (route) => false);




    // Navigator.push(context, CupertinoPageRoute(builder: (context) => RegisterPage()));

  // Navigator.push(
  //   context,
  //   MaterialPageRoute(
  //     builder: (BuildContext context) => AuthPage(),
  //   ),
  // );

}
    // Navigator.pushAndRemoveUntil(context,
    //   MaterialPageRoute(builder: (BuildContext context) => RegisterPage()), (route) => false);

// var VideoInfolist = List<VideoTable>();
//
// class VideoTable {
//   int id;
//   String name;
//   String workout_type;
//   String machine_type;
//   String thumbnail_url;
//   String url;
//
//   VideoTable(this.id,this.name,this.workout_type, this.machine_type,this.thumbnail_url,this.url);
//
//   @override
//   String toString() {
//     return '{ ${this.id}, ${this.name}, ${this.workout_type},${this.machine_type}, ${this.thumbnail_url},${this.url} }';
//   }
// }
//
// class Video extends StatefulWidget {
//   final Person _person;
//   final VoidCallback signOut;
//   final VoidCallback getRef;
//   Video(this._person,this.getRef, this.signOut);
//
//   @override
//   _VideoState createState() => _VideoState();
// }
//
// class _VideoState extends State<Video> {
//
//
//   void signOut() {
//     setState(() {
//       widget.signOut();
//     });
//   }
//
//
//   @override
//   void initState() {
//
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//
//     super.dispose();
//   }
//
//   Future<void> VideoList(String video_type, String machine_type) async {
//     //미플 데이터 읽기
//     String tmpUri = "http://211.253.30.245/php/get_videoList.php?video_type=" + video_type +"&machine_type=" +machine_type;
//
//     print(tmpUri);
//     final response = await http.get(tmpUri);
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       VideoInfolist.clear();
//
//       if (data['result'].toString() != "false") {
//         var _DataValue = data['result'];
//
//         //print(_DataValue);
//         for (var datai in _DataValue) {
//           VideoInfolist.add(VideoTable(datai['id'], datai['video_name'], datai['workout_type'], datai['machine_type'],datai['thumbnail_url'], datai['url'])
//           );
//         }
//         print(VideoInfolist);
//
//       }
//     }
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: <Widget>[
//             Icon(Icons.person, color: Colors.white70, size: 18.0),
//             Expanded(child:widget._person.isDirector ? Text("  " + widget._person.name + " " +
//                 widget._person.age.toString() + "세 " +
//                 double.parse(widget._person.weight).toStringAsFixed(1) + "kg " +
//                 double.parse(widget._person.height).toStringAsFixed(1) + "cm",
//                 style: TextStyle(color: Colors.white70, fontSize: 18.0,))
//                 : Text("  " + widget._person.name,
//                 style: TextStyle(color: Colors.white70, fontSize: 18.0,))
//             ),//fontWeight: FontWeight.bold )),
//           ],
//         ),
//         actions: !widget._person.isDirector ? <Widget>[
//           IconButton(
//             icon: Icon(Icons.qr_code),
//             tooltip: 'QR code', onPressed: () {
//
//             Navigator.of(context).push(CupertinoPageRoute(
//                 builder: (BuildContext context) => MyKeypad(widget._person, true)));
//
//           },
//           ),
//         ] : null,
//         backgroundColor: Colors.indigo, //Color(0xff3C8DBC),//Colors.blueAccent,
//         iconTheme: IconThemeData(
//           color: Colors.white70, //change your color here
//         ),
//
//       ),
//
//       body:  ListView(
//         children: <Widget>[
//           SizedBox(height: 30,),
//           InkWell (
//             onTap: () async {
//               print("장비 사용법");
//               await this.VideoList('U', '');
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => VideoUsageSelectList(widget._person, ""),
//                   )
//               );
//             },
//             child: Container(
//
//               height: 140,
//               width: MediaQuery
//                   .of(context)
//                   .size
//                   .width,
//               margin: EdgeInsets.symmetric(horizontal: 5.0),
//               decoration: BoxDecoration(
//                   image: new DecorationImage(
//                     fit: BoxFit.cover,
//                     colorFilter:
//                     ColorFilter.mode(Colors.black54.withOpacity(0.4),
//                         BlendMode.dstIn),
//                     image: AssetImage('images/module_screen.jpeg'),
//                     // image: new NetworkImage(
//                     //   'http://www.server.com/image.jpg',
//                     // ),
//                   ),
//                   color: Colors.black54,
//                   border: Border.all(
//                       color: Colors.white,
//                       //Color(0xff1A2226),// set border color
//                       width: 0.5),
//                   // set border width
//                   //borderRadius: BorderRadius.all(Radius.circular(50.0)), // set rounded corner radius
//                   borderRadius: const BorderRadius.only(
//                     bottomRight: Radius.circular(8.0),
//                     bottomLeft: Radius.circular(8.0),
//                     topLeft: Radius.circular(8.0),
//                     topRight: Radius.circular(54.0),
//                   ),
//
//                   boxShadow: [
//                     BoxShadow(blurRadius: 5,
//                         color: Colors.blueGrey[50],
//                         offset: Offset(1, 3))
//                   ] // make rounded corner of border
//               ),
//               child: Center(child: Stack( children: [
//                 Text("기구 사용법", style: TextStyle(fontSize: 24,  fontWeight: FontWeight.w600,
//                   foreground: Paint()
//                     ..style = PaintingStyle.stroke
//                     ..strokeWidth = 1
//                     ..color = Colors.black,
//                 ),),
//                 Text("기구 사용법", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600,
//
//                 ),),
//               ],)),
//             ),),
//
//           SizedBox(height: 30,),
//           InkWell (
//             onTap: () async {
//               print("스트레칭 운동방법");
//               await this.VideoList('EM', '');
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => VideoMethodSelectList(widget._person, "SC001"),
//                   )
//               );
//
//             },
//             child: Container(
//               height: 140,
//               width: MediaQuery
//                   .of(context)
//                   .size
//                   .width,
//               margin: EdgeInsets.symmetric(horizontal: 5.0),
//               decoration: BoxDecoration(
//                   image: new DecorationImage(
//                     fit: BoxFit.cover,
//                     colorFilter:
//                     ColorFilter.mode(Colors.black54.withOpacity(0.4),
//                         BlendMode.dstIn),
//                     image: AssetImage('images/stretching.jpg'),
//                     // image: new NetworkImage(
//                     //   'http://www.server.com/image.jpg',
//                     // ),
//                   ),
//                   color: Colors.black45,
//                   border: Border.all(
//                       color: Colors.white,
//                       //Color(0xff1A2226),// set border color
//                       width: 0.5),
//                   // set border width
//                   //borderRadius: BorderRadius.all(Radius.circular(50.0)), // set rounded corner radius
//                   borderRadius: const BorderRadius.only(
//                     bottomRight: Radius.circular(8.0),
//                     bottomLeft: Radius.circular(8.0),
//                     topLeft: Radius.circular(8.0),
//                     topRight: Radius.circular(54.0),
//                   ),
//
//                   boxShadow: [
//                     BoxShadow(blurRadius: 5,
//                         color: Colors.blueGrey[50],
//                         offset: Offset(1, 3))
//                   ] // make rounded corner of border
//               ),
//               child:  Center(child: Stack(children: [
//                 Text("스트레칭 운동", style: TextStyle(fontSize: 24,  fontWeight: FontWeight.w600,
//                   foreground: Paint()
//                     ..style = PaintingStyle.stroke
//                     ..strokeWidth = 1
//                     ..color = Colors.black,
//                 ),),
//                 Text("스트레칭 운동", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),)
//               ],)
//               ),
//             ),),
//           SizedBox(height: 30,),
//           InkWell (
//             onTap: () async {
//               print("폼롤러 운동 방법");
//               await this.VideoList('EM', '');
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => VideoMethodSelectList(widget._person, "FR001"),
//                   )
//               );
//             },
//             child: Container(
//                 height: 140,
//                 width: MediaQuery
//                     .of(context)
//                     .size
//                     .width,
//                 margin: EdgeInsets.symmetric(horizontal: 5.0),
//                 decoration: BoxDecoration(
//                     image: new DecorationImage(
//                       fit: BoxFit.cover,
//                       colorFilter:
//                       ColorFilter.mode(Colors.black54.withOpacity(0.4),
//                           BlendMode.dstIn),
//                       image: AssetImage('images/formroller.jpg'),
//                       // image: new NetworkImage(
//                       //   'http://www.server.com/image.jpg',
//                       // ),
//                     ),
//                     color: Colors.black45,
//                     border: Border.all(
//                         color: Colors.white,
//                         //Color(0xff1A2226),// set border color
//                         width: 0.5),
//                     // set border width
//                     //borderRadius: BorderRadius.all(Radius.circular(50.0)), // set rounded corner radius
//                     borderRadius: const BorderRadius.only(
//                       bottomRight: Radius.circular(8.0),
//                       bottomLeft: Radius.circular(8.0),
//                       topLeft: Radius.circular(8.0),
//                       topRight: Radius.circular(54.0),
//                     ),
//
//                     boxShadow: [
//                       BoxShadow(blurRadius: 5,
//                           color: Colors.blueGrey[50],
//                           offset: Offset(1, 3))
//                     ] // make rounded corner of border
//                 ),
//                 child: Center(child: Stack(children: [
//
//                   Text("폼롤러 운동", style: TextStyle(fontSize: 24,  fontWeight: FontWeight.w600,
//                     foreground: Paint()
//                       ..style = PaintingStyle.stroke
//                       ..strokeWidth = 1
//                       ..color = Colors.black,
//                   ),),
//                   Text("폼롤러 운동", style: TextStyle(fontSize: 24, color: Colors.white,fontWeight: FontWeight.w600),)
//
//                 ],)
//
//
//                 )
//             ),
//           ),
//         ],
//
//       ),
//       drawer: widget._person.isDirector ? null : DrawManu(context,widget._person,widget.getRef, signOut),
//     );
//   }
// }
//
// int listMachineNum = 0; //0: all, 1: xim, 2: module
//
// class VideoUsageSelectList extends StatefulWidget {
//
//   final Person _person;
//   final String machine_type;
//
//
//
//   VideoUsageSelectList(this._person, this.machine_type);
//
//   _VideoUsageSelectListState createState() => _VideoUsageSelectListState();
// }
//
// class _VideoUsageSelectListState extends State<VideoUsageSelectList> {
//
//
//
//   var listVideo = List.from(VideoInfolist);
//
//   @override
//   Widget build(BuildContext context) {
//
//     listVideo = VideoInfolist;
//     if(listMachineNum>0)
//     {
//
//       if(listMachineNum==1) listVideo = VideoInfolist.where((i) => i.machine_type.contains('XM001')).toList();
//       if(listMachineNum==2) listVideo = VideoInfolist.where((i) => i.machine_type.contains('MD001')).toList();
//     }
//
//     return Scaffold(
//
//       appBar: AppBar(
//         title: Row(
//           children: <Widget>[
//             Icon(Icons.person, color: Colors.white70, size: 18.0),
//             Expanded(child:widget._person.isDirector ? Text("  " + widget._person.name + " " +
//                 widget._person.age.toString() + "세 " +
//                 double.parse(widget._person.weight).toStringAsFixed(1) + "kg " +
//                 double.parse(widget._person.height).toStringAsFixed(1) + "cm",
//                 style: TextStyle(color: Colors.white70, fontSize: 18.0,))
//                 : Text("  " + widget._person.name,
//                 style: TextStyle(color: Colors.white70, fontSize: 18.0,))
//               //fontWeight: FontWeight.bold )),
//             ),
//           ],
//         ),
//         backgroundColor: Colors.indigo, //Color(0xff3C8DBC),//Colors.blueAccent,
//         iconTheme: IconThemeData(
//           color: Colors.white70, //change your color here
//         ),
//
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 30,
//             width:  MediaQuery
//                 .of(context)
//                 .size
//                 .width,
//             child: Row(
//               children: [
//                 Expanded(child: InkWell(
//                   onTap: (){
//                     listMachineNum=0;
//                     setState(() {
//
//                     });
//                   },
//                   child: Center(child: Text("ALL"),),
//                 ),),
//
//                 Container(
//                   padding: EdgeInsets.only(top: 10),
//                   height: 8,
//                   width: 1,
//                   decoration: BoxDecoration(
//                     color: Colors.blueGrey.withOpacity(0.5),
//                     borderRadius: BorderRadius.all(
//                         Radius.circular(4.0)),
//                   ),
//                 ),
//                 Expanded(child: InkWell(
//                   onTap: (){
//                     listMachineNum=1;
//                     setState(() {
//
//                     });
//                   },
//                   child: Center(child: Text("XIM"),),
//                 ),),
//
//                 Container(
//                   padding: EdgeInsets.only(top: 10),
//                   height: 8,
//                   width: 1,
//                   decoration: BoxDecoration(
//                     color: Colors.blueGrey.withOpacity(0.5),
//                     borderRadius: BorderRadius.all(
//                         Radius.circular(4.0)),
//                   ),
//                 ),
//                 Expanded(child: InkWell(
//                   onTap: (){
//                     listMachineNum=2;
//                     setState(() {
//
//                     });
//                   },
//                   child: Center(child: Text("MODULE"),),
//                 ),),
//               ],
//             ),
//
//
//
//           ),
//           Expanded(
//             child: ListView.builder(
//                 itemCount: listVideo.length,
//                 itemBuilder: (context, index){
//                   print(listVideo[index].workout_type );
//                   AssetImage tmpimg = AssetImage('images/ronfic_logo_green_resize.png');
//                   switch(listVideo[index].machine_type)
//                   {
//                     case 'XM001':
//                       tmpimg = AssetImage('images/machine/FITVISOR_XIM.png');
//                       break;
//                     case 'MD001':
//                       if(listVideo[index].workout_type!=null) tmpimg = AssetImage('images/machine/'+listVideo[index].workout_type +'.png');
//                       //else tmpimg = AssetImage('images/machine/module_usage.jpeg');
//                       break;
//                     case 'MP001':
//                       tmpimg = AssetImage('images/machine/MINIPLUS.png');
//                       break;
//
//                   }
//
//                   return  Container(
//                     child: Column(
//                       children: [
//                         InkWell(
//                           onTap: (){
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => VideoPlay(listVideo[index].name,listVideo[index].url),
//                                 )
//                             );
//                           },
//                           child: Container(
//                             height: 80,
//                             width: MediaQuery.of(context).size.width,
//                             decoration: BoxDecoration(
//                               color: Colors.white ,
//                               // borderRadius: BorderRadius.all(
//                               //   Radius.circular(20),
//                               // ),
//                               border: Border(
//                                 top: BorderSide( color: Colors.grey.shade600),
//                                 bottom: BorderSide( color: Colors.transparent),
//                               ),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color:  Colors.grey,
//                                   offset: Offset(1.0, 1.0),
//                                   blurRadius: 1.0,
//                                   spreadRadius: .5,
//                                 ),
//                               ],
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Container(
//                                   // height: 110,
//                                   width: 110,
//                                   //color: Colors.green,
//                                   child:  Image(
//                                       image: tmpimg
//                                   ),
//                                 ),
//                                 Container(
//                                   //height: 110,
//                                   width: 230,
//                                   // color: Colors.green,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                       Text(listVideo[index].name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );;
//
//                 }
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class VideoMethodSelectList extends StatefulWidget {
//
//   final Person _person;
//   final String machine_type;
//
//   VideoMethodSelectList(this._person, this.machine_type);
//
//   _VideoMethodSelectListState createState() => _VideoMethodSelectListState();
// }
//
// class _VideoMethodSelectListState extends State<VideoMethodSelectList> {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     var listVideo = VideoInfolist.where((i) => i.machine_type.contains(widget.machine_type)).toList();
//
//     return Scaffold(
//
//       appBar: AppBar(
//         title: Row(
//           children: <Widget>[
//             Icon(Icons.person, color: Colors.white70, size: 18.0),
//             Expanded(child:widget._person.isDirector ? Text("  " + widget._person.name + " " +
//                 widget._person.age.toString() + "세 " +
//                 double.parse(widget._person.weight).toStringAsFixed(1) + "kg " +
//                 double.parse(widget._person.height).toStringAsFixed(1) + "cm",
//                 style: TextStyle(color: Colors.white70, fontSize: 18.0,))
//                 : Text("  " + widget._person.name,
//                 style: TextStyle(color: Colors.white70, fontSize: 18.0,))
//               //fontWeight: FontWeight.bold )),
//             ),
//           ],
//         ),
//         backgroundColor: Colors.indigo, //Color(0xff3C8DBC),//Colors.blueAccent,
//         iconTheme: IconThemeData(
//           color: Colors.white70, //change your color here
//         ),
//
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//                 itemCount: listVideo.length,
//                 itemBuilder: (context, index){
//                   print(listVideo[index].workout_type );
//                   // AssetImage tmpimg = AssetImage(listVideo[index].thumbnail_url);
//
//
//                   return  Container(
//                     child: Column(
//                       children: [
//                         InkWell(
//                           onTap: (){
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => VideoPlay(listVideo[index].name ,listVideo[index].url),
//                                 )
//                             );
//                           },
//                           child: Container(
//                             height: 80,
//                             width: MediaQuery.of(context).size.width,
//                             decoration: BoxDecoration(
//                               color: Colors.white ,
//                               // borderRadius: BorderRadius.all(
//                               //   Radius.circular(20),
//                               // ),
//                               border: Border(
//
//                                 top: BorderSide( color: Colors.grey.shade600),
//                                 bottom: BorderSide( color: Colors.transparent),
//                               ),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color:  Colors.grey,
//                                   offset: Offset(1.0, 1.0),
//                                   blurRadius: 1.0,
//                                   spreadRadius: .5,
//                                 ),
//                               ],
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Container(
//                                   // height: 110,
//                                   width: 110,
//                                   //color: Colors.green,
//                                   child:  Image.network(
//                                       listVideo[index].thumbnail_url
//                                   ),
//                                 ),
//                                 Container(
//                                   //height: 110,
//                                   width: 230,
//                                   // color: Colors.green,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                       Text(listVideo[index].name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );;
//
//                 }
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class VideoPlay extends StatefulWidget {
//
//
//   final String name;
//   final String url;
//
//   VideoPlay(this.name,this.url);
//
//
//
//   _VideoPlayState createState() => _VideoPlayState();
// }
//
// class _VideoPlayState extends State<VideoPlay> {
//   ChewieController _chewieController;
//   VideoPlayerController _videoPlayerController;
//
//
//   TargetPlatform _platform = TargetPlatform.iOS;
//
//
//
//   @override
//   void initState() {
//
//     super.initState();
//
//     this.initializePlayer();
//
//   }
//
//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     _chewieController.dispose();
//     super.dispose();
//   }
//
//   Future<void> initializePlayer() async {
//     _videoPlayerController = VideoPlayerController.network(
//         widget.url);
//     await _videoPlayerController.initialize();
//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController,
//       autoPlay: true,
//       looping: true,
//       // Try playing around with some of these other options:
//
//       // showControls: false,
//       // materialProgressColors: ChewieProgressColors(
//       //   playedColor: Colors.red,
//       //   handleColor: Colors.blue,
//       //   backgroundColor: Colors.grey,
//       //   bufferedColor: Colors.lightGreen,
//       // ),
//       // placeholder: Container(
//       //   color: Colors.grey,
//       // ),
//       // autoInitialize: true,
//     );
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: <Widget>[
//             Text(widget.name,
//                 style: TextStyle(color: Colors.white70, fontSize: 18.0,))
//           ],
//         ),
//         backgroundColor: Colors.indigo, //Color(0xff3C8DBC),//Colors.blueAccent,
//         iconTheme: IconThemeData(
//           color: Colors.white70, //change your color here
//         ),
//       ),
//
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: Center(
//               child: _chewieController != null &&
//                   _chewieController
//                       .videoPlayerController.value.initialized
//                   ? Chewie(
//                 controller: _chewieController,
//               )
//                   : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(),
//                   SizedBox(height: 20),
//                   Text('Loading'),
//                 ],
//               ),
//             ),
//           ),
//
//         ],
//       ),
//
//
//
//
//
//     );
//   }
//
// }
//







// class ScreenFirst extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         key: const ValueKey<String>('home_page'),
//         appBar: AppBar(
//           title: const Text('Video player example'),
//           actions: <Widget>[
//             IconButton(
//               key: const ValueKey<String>('push_tab'),
//               icon: const Icon(Icons.navigation),
//               onPressed: () {
//                 Navigator.push<_PlayerVideoAndPopPage>(
//                   context,
//                   MaterialPageRoute<_PlayerVideoAndPopPage>(
//                     builder: (BuildContext context) => _PlayerVideoAndPopPage(),
//                   ),
//                 );
//               },
//             )
//           ],
//           bottom: const TabBar(
//             isScrollable: true,
//             tabs: <Widget>[
//               Tab(
//                 icon: Icon(Icons.cloud),
//                 text: "Remote",
//               ),
//               Tab(icon: Icon(Icons.insert_drive_file), text: "Asset"),
//               Tab(icon: Icon(Icons.list), text: "List example"),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: <Widget>[
//             _BumbleBeeRemoteVideo(),
//             _ButterFlyAssetVideo(),
//             _ButterFlyAssetVideoInList(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _ButterFlyAssetVideoInList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         _ExampleCard(title: "Item a"),
//         _ExampleCard(title: "Item b"),
//         _ExampleCard(title: "Item c"),
//         _ExampleCard(title: "Item d"),
//         _ExampleCard(title: "Item e"),
//         _ExampleCard(title: "Item f"),
//         _ExampleCard(title: "Item g"),
//         Card(
//             child: Column(children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   const ListTile(
//                     leading: Icon(Icons.cake),
//                     title: Text("Video video"),
//                   ),
//                   Stack(
//                       alignment: FractionalOffset.bottomRight +
//                           const FractionalOffset(-0.1, -0.1),
//                       children: <Widget>[
//                         _ButterFlyAssetVideo(),
//                         Image.asset('assets/flutter-mark-square-64.png'),
//                       ]),
//                 ],
//               ),
//             ])),
//         _ExampleCard(title: "Item h"),
//         _ExampleCard(title: "Item i"),
//         _ExampleCard(title: "Item j"),
//         _ExampleCard(title: "Item k"),
//         _ExampleCard(title: "Item l"),
//       ],
//     );
//   }
// }
//
// /// A filler card to show the video in a list of scrolling contents.
// class _ExampleCard extends StatelessWidget {
//   const _ExampleCard({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           ListTile(
//             leading: const Icon(Icons.airline_seat_flat_angled),
//             title: Text(title),
//           ),
//           ButtonBar(
//             children: <Widget>[
//               FlatButton(
//                 child: const Text('BUY TICKETS'),
//                 onPressed: () {
//                   /* ... */
//                 },
//               ),
//               FlatButton(
//                 child: const Text('SELL TICKETS'),
//                 onPressed: () {
//                   /* ... */
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _ButterFlyAssetVideo extends StatefulWidget {
//   @override
//   _ButterFlyAssetVideoState createState() => _ButterFlyAssetVideoState();
// }
//
// class _ButterFlyAssetVideoState extends State<_ButterFlyAssetVideo> {
//   VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//       "http://211.253.30.245/video/Stretching/Upper/1.Neck.mp4");
//
//     _controller.addListener(() {
//       setState(() {});
//     });
//     _controller.setLooping(true);
//     _controller.initialize().then((_) => setState(() {}));
//     _controller.play();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           Container(
//             padding: const EdgeInsets.only(top: 20.0),
//           ),
//           const Text('With assets mp4'),
//           Container(
//             padding: const EdgeInsets.all(20),
//             child: AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: <Widget>[
//                   VideoPlayer(_controller),
//                   _ControlsOverlay(controller: _controller),
//                   VideoProgressIndicator(_controller, allowScrubbing: true),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _BumbleBeeRemoteVideo extends StatefulWidget {
//   @override
//   _BumbleBeeRemoteVideoState createState() => _BumbleBeeRemoteVideoState();
// }
//
// class _BumbleBeeRemoteVideoState extends State<_BumbleBeeRemoteVideo> {
//   VideoPlayerController _controller;
//
//   Future<ClosedCaptionFile> _loadCaptions() async {
//     final String fileContents = await DefaultAssetBundle.of(context)
//         .loadString('assets/bumble_bee_captions.srt');
//     return SubRipCaptionFile(fileContents);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
//       closedCaptionFile: _loadCaptions(),
//       videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
//     );
//
//     _controller.addListener(() {
//       setState(() {});
//     });
//     _controller.setLooping(true);
//     _controller.initialize();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           Container(padding: const EdgeInsets.only(top: 20.0)),
//           const Text('With remote mp4'),
//           Container(
//             padding: const EdgeInsets.all(20),
//             child: AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: <Widget>[
//                   VideoPlayer(_controller),
//                   ClosedCaption(text: _controller.value.caption.text),
//                   _ControlsOverlay(controller: _controller),
//                   VideoProgressIndicator(_controller, allowScrubbing: true),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _ControlsOverlay extends StatelessWidget {
//   const _ControlsOverlay({Key key, this.controller}) : super(key: key);
//
//   static const _examplePlaybackRates = [
//     0.25,
//     0.5,
//     1.0,
//     1.5,
//     2.0,
//     3.0,
//     5.0,
//     10.0,
//   ];
//
//   final VideoPlayerController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         AnimatedSwitcher(
//           duration: Duration(milliseconds: 50),
//           reverseDuration: Duration(milliseconds: 200),
//           child: controller.value.isPlaying
//               ? SizedBox.shrink()
//               : Container(
//             color: Colors.black26,
//             child: Center(
//               child: Icon(
//                 Icons.play_arrow,
//                 color: Colors.white,
//                 size: 100.0,
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             controller.value.isPlaying ? controller.pause() : controller.play();
//           },
//         ),
//         Align(
//           alignment: Alignment.topRight,
//           child: PopupMenuButton<double>(
//             initialValue: controller.value.playbackSpeed,
//             tooltip: 'Playback speed',
//             onSelected: (speed) {
//               controller.setPlaybackSpeed(speed);
//             },
//             itemBuilder: (context) {
//               return [
//                 for (final speed in _examplePlaybackRates)
//                   PopupMenuItem(
//                     value: speed,
//                     child: Text('${speed}x'),
//                   )
//               ];
//             },
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 // Using less vertical padding as the text is also longer
//                 // horizontally, so it feels like it would need more spacing
//                 // horizontally (matching the aspect ratio of the video).
//                 vertical: 12,
//                 horizontal: 16,
//               ),
//               child: Text('${controller.value.playbackSpeed}x'),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class _PlayerVideoAndPopPage extends StatefulWidget {
//   @override
//   _PlayerVideoAndPopPageState createState() => _PlayerVideoAndPopPageState();
// }
//
// class _PlayerVideoAndPopPageState extends State<_PlayerVideoAndPopPage> {
//   VideoPlayerController _videoPlayerController;
//   bool startedPlaying = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _videoPlayerController =
//         VideoPlayerController.asset('assets/Butterfly-209.mp4');
//     _videoPlayerController.addListener(() {
//       if (startedPlaying && !_videoPlayerController.value.isPlaying) {
//         Navigator.pop(context);
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     super.dispose();
//   }
//
//   Future<bool> started() async {
//     await _videoPlayerController.initialize();
//     await _videoPlayerController.play();
//     startedPlaying = true;
//     return true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 0,
//       child: Center(
//         child: FutureBuilder<bool>(
//           future: started(),
//           builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//             if (snapshot.data == true) {
//               return AspectRatio(
//                 aspectRatio: _videoPlayerController.value.aspectRatio,
//                 child: VideoPlayer(_videoPlayerController),
//               );
//             } else {
//               return const Text('waiting for video to load');
//             }
//           },
//         ),
//       ),
//     );
//   }
// }