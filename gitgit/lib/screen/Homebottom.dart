import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:path/path.dart' as path;
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ronfic_ver2/controller/firebase_provider.dart';
import 'package:ronfic_ver2/controller/loginchk_info.dart';
import 'package:ronfic_ver2/screen/info_emptyPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

class HomeBottom extends StatefulWidget {
  @override
  _HomeBottomState createState() => _HomeBottomState();
}

ExistingMebers em;




class _HomeBottomState extends State<HomeBottom> {
  File imageFile;
  final ImagePicker _picker = ImagePicker();

  // var _flutterLocalNotificationsPlugin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// 자체 앱알람
    //   var initializationSettingsAndroid =
    //   AndroidInitializationSettings('@mipmap/ic_launcher');
    //   var initializationSettingsIOS = IOSInitializationSettings();
    //
    //   var initializationSettings = InitializationSettings(
    //       initializationSettingsAndroid, initializationSettingsIOS);
    //
    //   _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    //   _flutterLocalNotificationsPlugin.initialize(initializationSettings,
    //       onSelectNotification: onSelectNotification);
    // }
    //
    // Future<void> onSelectNotification(String payload) async {
    //   debugPrint("$payload");
    //   showDialog(
    //       context: context,
    //       builder: (_) => AlertDialog(
    //         title: Text('Notification Payload'),
    //         content: Text('Payload: $payload'),
    //       ));
  }

  @override
  Widget build(BuildContext context) {
    em = Provider.of<ExistingMebers>(context);
    return Scaffold(
      drawer: Drawer(
        elevation: 1.5,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            DrawerHeader(
              padding: EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context, builder: ((builder) => bottomSheet()));
                },
                child: ClipRRect(

                    borderRadius: BorderRadius.circular(100.0),
                    child:
                    // imageFile == null ?  Image.asset('images/profile.png') : Image.file(File(_imageFile.path),fit: BoxFit.fill,height: 160,width: 120,),

                    em.user.profile_url.isEmpty ? Image.asset(
                        'images/profile.png',) : Image.network(
                      em.user.profile_url, fit: BoxFit.fill,height: 100,width: 120,)
                ),
              ),
              decoration: BoxDecoration(
                // color: Colors.red,
                border: Border(
                    bottom: BorderSide(
                        color: Colors.white
                    )
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {

                });
                Navigator.of(context).pop();
              },
              child: Text(
                'Profile',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Settings',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              'About',
              style: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 45,
            ),
            FlatButton(
              onPressed: () {
                em.logout();
              },
              child: Text(
                'Log Out',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 65,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    color: Colors.lightBlue,
                    child: Center(
                      child: Text(
                        'v1.0.1',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 20,
                          color: const Color(0xffffffff),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ))
          ],
        ),
        // Populate the Drawer in the next step.
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,

        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: Builder(
                builder: (context) =>
                    IconButton(

                      icon: Image.asset(
                        "images/menu.png", color: Colors.blue,
                        height: 25,
                        width: 35,
                      ),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
              ),
            ),
            FlatButton(onPressed: () {
              em.logout();
            },child: Text(em.user.clubName, style: TextStyle(color: Colors.black54),)),
          ],
        ),

        centerTitle: false,
        titleSpacing: 0,

      ),
      body:
      Column(
        children: [
          Container(
            height: 200,
            child: new Swiper(
              loop: true,
              autoplay: true,
              autoplayDelay: 3000,
              itemBuilder: (BuildContext context, int index) {
                return ClayContainer(
                  color: Colors.grey[100],
                  // height: 200,
                  // width: 200,
                  // borderRadius: 75,
                  // depth: 40,
                  // spread: 10,
                  child: Column(
                    children: [
                      Text('bbat', style: TextStyle(fontSize: 24),),
                    ],
                  ),
                );
              },
              itemCount: 5,
              itemWidth: 350.0,
              layout: SwiperLayout.STACK,
            ),
          ),
        ],
      ),

    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text('choose profile', style: TextStyle(fontSize: 20),),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton.icon(onPressed: () {
                takePhoto(ImageSource.camera);

              },
                  icon: Icon(Icons.camera, size: 50,),
                  label: Text('Camera', style: TextStyle(fontSize: 20),)),
              FlatButton.icon(onPressed: () {
                takePhoto(ImageSource.gallery);

              },
                  icon: Icon(Icons.photo_library, size: 50,),
                  label: Text('Gallery', style: TextStyle(fontSize: 20),))
            ],
          )
        ],
      ),
    );
  }

  takePhoto(ImageSource source) async {
    Navigator.pop(context);
    // ignore: deprecated_member_use
    var pickedFile = await ImagePicker.pickImage(source: source,imageQuality: 20, maxHeight: 300, maxWidth: 400,);
    setState(() {
      imageFile = pickedFile;
    });
    
    print('here');
    await uploadImage();
    print('here2');

  }


uploadImage()async{
    print('여기');
    var uri = Uri.parse("http://211.253.30.245/php/upload_image.php");
    var request = new MultipartRequest("POST", uri);
    var multipartFile = await MultipartFile.fromPath("profile", imageFile.path);
    request.files.add(multipartFile);
    StreamedResponse response = await request.send();
    response.stream.transform(utf8.decoder).listen((value) {

    });
    if(response.statusCode==200) {
      print(multipartFile.filename);
      String tmpUri = "http://211.253.30.245/php/UPDATE_profile_url.php?id=" +
           em.user.id.toString() + "&profile_url=" +
            "http://211.253.30.245/images/profile/" + multipartFile.filename;

        final response = await http.get(tmpUri);
      if (response.statusCode == 200) {
         await em.UserResume();
      }
    }else{
      print(" upload failed");
    }
}
}


//   getGalleryImage() async {
//     try {
//       // print(image);
//       // print(image.path);
//       String tmpName = em.user.id + "-1" + path.extension(image.path);
//       //print(tmpName);
//
//       if (global.mimage_url.length > 6) {
//         String tmplink = global.mimage_url.substring(
//             global.mimage_url.length - 5, global.mimage_url.length - 4);
//         print(tmplink);
//         if (tmplink == "1") {
//           tmpName = widget._refUserinfo.id + "-2" + path.extension(image.path);
//         }
//       }
//
//       //print(tmpName);
//       uploadFile(tmpName, File(image.path));
//     } catch (e) {
//       print(e.code);
//     }
//   }
//
//
//   uploadFile(String _fileName, File _image) async {
//     String uploadurl = "http://211.253.30.245/php//file_upload.php";
//     mImage = null;
//
//     Dio dio = new Dio();
//     String progress;
//     // print(_fileName);
//     FormData formdata = FormData.fromMap({
//       "file": await MultipartFile.fromBytes(
//           _image.readAsBytesSync(),
//           filename: _fileName
//         //show only filename from path
//       ),
//     });
//
//     Response<Map> response = await dio.post(uploadurl,
//       data: formdata,
//       onSendProgress: (int sent, int total) {
//         String percentage = (sent / total * 100).toStringAsFixed(2);
//         // setState(() {
//         progress = "$sent" + " Bytes of " "$total Bytes - " + percentage +
//             " % uploaded";
//         // print(progress);
//         //   //update the progress
//         // });
//       },);
//
//
//     if (response.statusCode == 200) {
//       // print(response.toString());
//       Map responseBody = response.data;
//       //print(responseBody);
//
//       if (responseBody['success'] == true) {
//         //print("success upload");
//
//         String tmpUri = "http://211.253.30.245/php/UPDATE_profile_url.php?id=" +
//             widget._refUserinfo.id + "&profile_url=" +
//             "http://211.253.30.245/images/profile/" + _fileName;
//
//         // print(tmpUri);
//         final response = await http.get(tmpUri);
//
//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//
//           SharedPreferences preferences = await SharedPreferences.getInstance();
//
//           if (data['result'].toString() != "false") {
//             //global.mimage = Image.file(_image);
//             global.mimage_url =
//                 "http://211.253.30.245/images/profile/" + _fileName;
//             mImage = NetworkImage("${global.mimage_url}");
//             preferences.setString("profile_url", global.mimage_url);
//             preferences.commit();
//             widget.getRef();
//
//             //  print("url_update completed");
//           }
//         }
//       }
//       //print response from server
//     } else {
//       print("Error during connection to server.");
//     }
//   }
//
//
// // }


///앱알람
//
//        Scaffold(
//          appBar: AppBar(
//            title: Text(em.user.profile_url),
//          ),
//          body: Column(
//            children: [
//              FadeInImage.assetNetwork(placeholder: '', image: em.user.profile_url,width: 50, height: 50,),
//              FlatButton(onPressed: ()async {    SharedPreferences pref = await SharedPreferences.getInstance();
//              SharedPreferences prefs = await SharedPreferences.getInstance();
// em.UserResume();
//             String ac =  pref.getString('userData');
//
//                    print(prefs.getString('userid'));
//              print( pref.getString('userData'));}, child:Text('ddddddd')),
//              RaisedButton(
//                onPressed: _showNotification,
//                child: Text('Show Notification'),
//              ),
//              RaisedButton(
//                onPressed: _dailyAtTimeNotification,
//                child: Text('Daily At Time Notification'),
//              ),
//              RaisedButton(
//                onPressed: _repeatNotification,
//                child: Text('Repeat Notification'),
//              ),
//              FlatButton(onPressed: (){_dailyAtTimeNotification();}, child: Text('알람ddddddddddd')),
//              Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
//                 child: Column(
//                   children: [
//                     FlatButton(onPressed: (){em.sendPasswordResetEmail();}, child: Text('메일 보내기')),
//                     RaisedButton(
//                       color: Colors.indigo[300],
//                       child: em.user == null ? Text('dd'):Text(em.user.userid+em.user.regDate),
//                       // fp.getUser() == null ? Padding(
//                       //   padding: const EdgeInsets.all(25.0),
//                       //   child: Text("아이디:"+em.user.userid+"\nkeypad:"+em.user.keypad.toString()+"\n클럽네임:\r"+em.user.clubName.toString()+"\n생년월일"+em.user.birthday.toString(),style: TextStyle(color:Colors.white),),
//                       // ):Text("email:"+fp.getUser().email+"\nuid:"+fp.getUser().uid, style: TextStyle(color: Colors.white),),
//                       onPressed: () {
//
//
//
//                             em.logout();
//
// // print(prp.isit());
//
//                         // print(em.user.userid);
//                         // print(fp.getUser().displayName);
//
//                         // gp.googleSignOut();
//
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//            ],
//          ),
//        );
//     }
//   Future<void> _showNotification() async {
//     var android = AndroidNotificationDetails(
//         'your channel id', 'your channel name', 'your channel description',
//         importance: Importance.Max, priority: Priority.High);
//
//     var ios = IOSNotificationDetails();
//     var detail = NotificationDetails(android, ios);
//
//     await _flutterLocalNotificationsPlugin.show(
//       0,
//       '단일 Notification',
//       '단일 Notification 내용',
//       detail,
//       payload: 'Hello Flutter',
//     );
//   }
//
//   Future<void> _dailyAtTimeNotification() async {
//     var time = Time(22, 40, 0);
//     var android = AndroidNotificationDetails(
//         'your channel id', 'your channel name', 'your channel description',
//         importance: Importance.Max, priority: Priority.High);
//
//     var ios = IOSNotificationDetails();
//     var detail = NotificationDetails(android, ios);
//
//     await _flutterLocalNotificationsPlugin.showDailyAtTime(
//       0,
//       '매일 똑같은 시간의 Notification',
//       '매일 똑같은 시간의 Notification 내용',
//       time,
//       detail,
//       payload: 'Hello Flutter',
//     );
//   }
//
//   Future<void> _repeatNotification() async {
//     var android = AndroidNotificationDetails(
//         'your channel id', 'your channel name', 'your channel description',
//         importance: Importance.Max, priority: Priority.High);
//
//     var ios = IOSNotificationDetails();
//     var detail = NotificationDetails(android, ios);
//
//     await _flutterLocalNotificationsPlugin.periodicallyShow(
//       0,
//       '반복 Notification',
//       '반복 Notification 내용',
//       RepeatInterval.EveryMinute,
//       detail,
//       payload: 'Hello Flutter',
//     );
//   }
//
// }
//
//
// }
