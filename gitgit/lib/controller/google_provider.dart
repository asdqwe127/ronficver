// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
//
//
//
//
//
// //구글 로그인을 통해 로그인을 하는 코드이다.
//
// class GoogleProvider with ChangeNotifier{
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   FirebaseUser currentUser;
//   String name = "";
//   String email = "";
//   String url = "";
// Future<bool> googleSingIn()  async {
//   final GoogleSignInAccount account = await googleSignIn.signIn();
//   final GoogleSignInAuthentication googleAuth = await account.authentication;
//
//   final AuthCredential credential = GoogleAuthProvider.getCredential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );
//
//   final AuthResult authResult = await _auth.signInWithCredential(credential);
//   final FirebaseUser user = authResult.user;
//
//   assert(!user.isAnonymous);
//   assert(await user.getIdToken() != null);
//
//   currentUser = await _auth.currentUser();
//   assert(user.uid == currentUser.uid);
//
// //해당 부분을 통해 현재 로그인된 유저의 이메일, 사진, 닉네임을 설정해준다.
//
//       email = user.email;
//       url = user.photoUrl;
//       name = user.displayName;
//
//       notifyListeners();
//
//   return true;
// }
//
// //구글 로그인에서 로그아웃 할때 설정해주었던 모든 것들을 다시 초기화 시켜주는 작업도 함께 해준다.
// void googleSignOut() async {
//   await _auth.signOut();
//   await googleSignIn.signOut();
//     email = "";
//     url = "";
//     name = "";
//   notifyListeners();
//
//   print("User Sign Out");
// }
// }