// import 'package:flutter/cupertino.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase/firebase_io.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:ronfic_ver2/controller/insert_users.dart';
// import 'package:ronfic_ver2/controller/loginchk_info.dart';
//
//
//
// class FirebaseProvider with ChangeNotifier {
//   final FirebaseAuth fAuth = FirebaseAuth.instance;
//   FirebaseUser _user;
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   String _lastFirebaseResponse = "";
//   var phone1= '';
//
//   FirebaseProvider() {
//     _prepareUser();
//   }
//
//   FirebaseUser getUser() {
//     return _user;
//   }
//
//   void setUser(FirebaseUser value) {
//     _user = value;
//     notifyListeners();
//   }
//
//   _prepareUser() {
//     fAuth.currentUser().then((FirebaseUser currentUser) {
//       setUser(currentUser);
//     });
//   }
//   Future<bool> googleSingIn()  async {
//
//     final GoogleSignInAccount account = await googleSignIn.signIn();
//     final GoogleSignInAuthentication googleAuth = await account.authentication;
//
//     final AuthCredential credential = GoogleAuthProvider.getCredential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//
//     final AuthResult authResult = await fAuth.signInWithCredential(credential);
//     final FirebaseUser user = authResult.user;
//     // assert(!user.isAnonymous);
//     assert(await user.getIdToken() != null);
//     _user = await fAuth.currentUser();
//     assert(user.uid == _user.uid);
//     setUser(authResult.user);
//     // email = user.email;
//     // url = user.photoUrl;
//     // name = user.phoneNumber;
//     // notifyListeners();
//
//     return true;
//   }
//
//   Future<bool> signUpWithEmail(String email, String password,String name,var phone) async {
//
//     try {
//       AuthResult result = await fAuth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       if (result.user != null) {
//        // await InsertUsers().InsertUser(email, password, name, phone,'');
//
//         // user.displayName = name;
//        // phone1 = result.user.phoneNumber;
//        //    _user.phoneNumber = phone;
//         // result.user.
//        print(result.user.phoneNumber);
//         result.user.sendEmailVerification();
//         signOut();
//         return true;
//       }
//     } on Exception catch (e) {
//       print(e.toString());
//       // List<String> result = e.toString().split(", ");
//       setLastFBMessage(e.toString());
//       return false;
//     }
//   }
//
//
//   Future<bool> signInWithEmail(String email, String password) async {
//     try {
//       var result = await fAuth.signInWithEmailAndPassword(
//           email: email.trim(), password: password.trim());
//       if (result != null  &&  result.user.isEmailVerified == true) {
//         // setUser(result.user);
//         // ExistingMebers();
//         await ExistingMebers().login(email, password);
//         // ExistingMebers().prepareUser();
//         print(getUser());
//
//         return true;
//       }else {
//         setLastFBMessage('메일 인증을 받아야 로그인이 됩니다.');
//       return false;
//       }
//     } on Exception catch (e) {
//       // print(e.toString());
//       List<String> result = e.toString().split(", ");
//       setLastFBMessage('아이디 혹은 비밀번호를 확인하여 주십시오');
//       return false;
//     }
//   }
//
//   // Firebase로부터 로그아웃
//   signOut() async {
//     await fAuth.signOut();
//     await googleSignIn.signOut();
//     setUser(null);
//     notifyListeners();
//   }
//
//   // // 사용자에게 비밀번호 재설정 메일을 영어로 전송 시도
//   // sendPasswordResetEmailByEnglish() async {
//   //   await fAuth.setLanguageCode("en");
//   //   sendPasswordResetEmail();
//   // }
//
//   // 사용자에게 비밀번호 재설정 메일을 한글로 전송 시도
//   sendPasswordResetEmailByKorean() async {
//     await fAuth.setLanguageCode("ko");
//     sendPasswordResetEmail();
//   }
//
//   // 사용자에게 비밀번호 재설정 메일을 전송
//   sendPasswordResetEmail() async {
//     fAuth.sendPasswordResetEmail(email: getUser().email);
//   }
//
//   // Firebase로부터 회원 탈퇴
//   withdrawalAccount() async {
//     await getUser().delete();
//     setUser(null);
//   }
//
//   // Firebase로부터 수신한 메시지 설정
//   setLastFBMessage(String msg) {
//     _lastFirebaseResponse = msg;
//   }
//
//   // Firebase로부터 수신한 메시지를 반환하고 삭제
//   getLastFBMessage() {
//     String returnValue = _lastFirebaseResponse;
//     // _lastFirebaseResponse = null;
//     return returnValue;
//   }
//
//
//
//
//
//
//
//
//
//
//
// }