import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ronfic_ver2/controller/firebase_provider.dart';
import 'package:ronfic_ver2/controller/google_provider.dart';
import 'package:ronfic_ver2/controller/loginchk_info.dart';
import 'package:ronfic_ver2/screen/AdminPage.dart';
import 'package:ronfic_ver2/screen/Homebottom.dart';
import 'package:ronfic_ver2/screen/info_emptyPage.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

SignedInPageState pageState;

class SignedInPage extends StatefulWidget {
  @override
  SignedInPageState createState() {
    pageState = SignedInPageState();
    return pageState;
  }
}

ExistingMebers em;

class SignedInPageState extends State<SignedInPage> {
  TextStyle tsItem = const TextStyle(
      color: Colors.blueGrey, fontSize: 13, fontWeight: FontWeight.bold);
  TextStyle tsContent = const TextStyle(color: Colors.blueGrey, fontSize: 12);
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  int _selectedIndex = 0;
@override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    em = Provider.of<ExistingMebers>(context);

    List<Widget> _widgetOptions = <Widget>[
      HomeBottom(),
      likes(),
      Text(
        'Index 2: Search',
        style: optionStyle,
      ),
      Text(
        'Index 3: Profile',
        style: optionStyle,
      ),
    ];

    return
      em.user.email == '1' || em.user.email == '' ? InfoEmpty() :
    Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
            child: SalomonBottomBar(
              // gap: 8,
              // activeColor: Colors.white,
              // iconSize: 24,
              // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              // duration: Duration(milliseconds: 800),
              // tabBackgroundColor: Colors.grey[800],
                items: [
                  SalomonBottomBarItem(
                    icon: Icon(Icons.home),
                    title: Text('home'),
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
                    selectedColor: Colors.lightBlue,
                  ),
                  SalomonBottomBarItem(
                    icon: Icon(Icons.whatshot_sharp),
                    title: Text("Home"),
                    selectedColor: Colors.deepOrange,
                  ),
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

// home() {
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
//       child: RaisedButton(
//         color: Colors.indigo[300],
//         child: Text(
//           'loggout',
//           // '${fp.getUser().email}',
//           style: TextStyle(color: Colors.red),
//         ),
//         onPressed: () {
//
//           print(fp.getUser().photoUrl);
//           // fp.signOut();
//           // gp.googleSignOut();
//
//         },
//       ),
//     );
//   }
// }
likes() {
  print('likes');
  return Text('dasdf');
}

search() {
  return Text('dd3');
}

profile() {
  return Text('4');
}
      // appBar: AppBar(title: Text("Singed In Page")),
      // body: ListView(
      //   children: <Widget>[
      //     Container(
      //       margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      //       child: Column(
      //         children: <Widget>[
      //           //Hader
      //           Container(
      //             height: 50,
      //             decoration: BoxDecoration(color: Colors.amber),
      //             child: Center(
      //               child: Text(
      //                 "Signed In User Info",
      //                 style: TextStyle(
      //                     color: Colors.blueGrey,
      //                     fontSize: 18,
      //                     fontWeight: FontWeight.bold),
      //               ),
      //             ),
      //           ),
      //
      //           // User's Info Area
      //           Container(
      //             decoration: BoxDecoration(
      //               border: Border.all(color: Colors.amber, width: 1),
      //             ),
      //             child: Column(
      //               children: <Widget>[
      //                 Row(
      //                   children: <Widget>[
      //                     Container(
      //                       width: propertyWith,
      //                       child: Text("UID", style: tsItem),
      //                     ),
      //                     Expanded(
      //                       child: Text(fp.getUser().uid, style: tsContent),
      //                     )
      //                   ],
      //                 ),
      //                 Divider(height: 1),
      //                 Row(
      //                   children: <Widget>[
      //                     Container(
      //                       width: propertyWith,
      //                       child: Text("Email", style: tsItem),
      //                     ),
      //                     Expanded(
      //                       child: Text(fp.getUser().email, style: tsContent),
      //                     )
      //                   ],
      //                 ),
      //                 Divider(height: 1),
      //                 Row(
      //                   children: <Widget>[
      //                     Container(
      //                       width: propertyWith,
      //                       child: Text("Name", style: tsItem),
      //                     ),
      //                     Expanded(
      //                       child: Text(fp.getUser().displayName ?? "",
      //                           style: tsContent),
      //                     )
      //                   ],
      //                 ),
      //                 Divider(height: 1),
      //                 Row(
      //                   children: <Widget>[
      //                     Container(
      //                       width: propertyWith,
      //                       child: Text("Phone Number", style: tsItem),
      //                     ),
      //                     Expanded(
      //                       child: Text(fp.getUser().phoneNumber ?? "",
      //                           style: tsContent),
      //                     )
      //                   ],
      //                 ),
      //                 Divider(height: 1),
      //                 Row(
      //                   children: <Widget>[
      //                     Container(
      //                       width: propertyWith,
      //                       child: Text("isEmailVerified", style: tsItem),
      //                     ),
      //                     Expanded(
      //                       child: Text(fp.getUser().isEmailVerified.toString(),
      //                           style: tsContent),
      //                     )
      //                   ],
      //                 ),
      //                 Divider(height: 1),
      //                 Row(
      //                   children: <Widget>[
      //                     Container(
      //                       width: propertyWith,
      //                       child: Text("Provider ID", style: tsItem),
      //                     ),
      //                     Expanded(
      //                       child:
      //                       Text(fp.getUser().providerId, style: tsContent),
      //                     )
      //                   ],
      //                 ),
      //               ].map((c) {
      //                 return Padding(
      //                   padding: const EdgeInsets.symmetric(
      //                       vertical: 10, horizontal: 10),
      //                   child: c,
      //                 );
      //               }).toList(),
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //
      //     // Sign In Button
      //     Container(
      //       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //       child: RaisedButton(
      //         color: Colors.indigo[300],
      //         child: Text(
      //           "SIGN OUT",
      //           style: TextStyle(color: Colors.white),
      //         ),
      //         onPressed: () {
      //           fp.signOut();
      //         },
      //       ),
      //     ),
      //
      //     // Send Password Reset Email by English
      //     Container(
      //       margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      //       child: RaisedButton(
      //         color: Colors.orange[300],
      //         child: Text(
      //           "Send Password Reset Email by English",
      //           style: TextStyle(color: Colors.white),
      //         ),
      //         onPressed: () {
      //           // fp.sendPasswordResetEmailByEnglish();
      //         },
      //       ),
      //     ),
      //
      //     // Send Password Reset Email by Korean
      //     Container(
      //       margin: const EdgeInsets.only(left: 20, right: 20, top: 0),
      //       child: RaisedButton(
      //         color: Colors.orange[300],
      //         child: Text(
      //           "Send Password Reset Email by Korean",
      //           style: TextStyle(color: Colors.white),
      //         ),
      //         onPressed: () {
      //           fp.sendPasswordResetEmailByKorean();
      //         },
      //       ),
      //     ),
      //
      //     // Send Password Reset Email by Korean
      //     Container(
      //       margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      //       child: RaisedButton(
      //         color: Colors.red[300],
      //         child: Text(
      //           "Withdrawal (Delete Account)",
      //           style: TextStyle(color: Colors.white),
      //         ),
      //         onPressed: () {
      //           fp.withdrawalAccount();
      //         },
      //       ),
      //     ),
      //   ],
      // ),


