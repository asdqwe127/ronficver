// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:prefs/prefs.dart';
// import 'package:provider/provider.dart';
// import 'package:ronfic_ver2/controller/firebase_provider.dart';
// import 'package:ronfic_ver2/controller/loginchk_info.dart';
// import 'package:ronfic_ver2/model/User_info.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'Ori_user_Page.dart';
// import 'screen/loginpage.dart';
//
//
//
//  main() async{
//   runApp(MyApp());
//
//
// }
// int  LoginCode = Prefs.getInt('LoginCode');
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
//
//
// class _MyAppState extends State<MyApp> {
//
//   @override
//  initState()  {
//     super.initState();
//     // _loadCounter();
//     // login();
//     // Prefs.init();
//     // GetPref();
//     // LoginCode = Prefs.getInt('LoginCode') ?? 0;
//
//   }
//   // SavePref(int value) async {
//   //   SharedPreferences preferences = await SharedPreferences.getInstance();
//   //   setState(() {
//   //       preferences.setInt("LoginCode", value);
//   //     });
//   // }
//
//   GetPref() async {
//     login();
//
//     // LoginCode = Prefs.getBool("LoginCode");
//     // if (LoginCode == 1) {
//     //   _defaultHome = new FirstPage();
//     // }else{
//     //   _defaultHome = new LoginPage();
//     // }
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return MultiProvider(
//       providers: [
//         Provider<Loginchk_info>.value(
//           value: Loginchk_info(),
//         ),
//         ChangeNotifierProvider<PostProvider>.value(
//             value: PostProvider(),
//         ),
//         ChangeNotifierProvider<FirebaseProvider>(
//             create:(_) => FirebaseProvider()),
//         Provider<int>.value(value: 100),
//         Provider<int>.value(value: 200),
//       ],
//       child: MaterialApp(
//           title: 'test1',
//           initialRoute: '/',
//           routes: {
//             '/login': (context) => LoginPage(),
//             '/first': (context) => FirstPage(),
//           },
//           theme: ThemeData(
//               scaffoldBackgroundColor:Colors.white,
//               textTheme: GoogleFonts.notoSansTextTheme(
//               Theme.of(context).textTheme,
//             ),
//             primaryColor: Colors.blueAccent[300],
//             // primarySwatch: Colors.blue,
//             visualDensity: VisualDensity.adaptivePlatformDensity,
//           ),
//
//           home:
//           // _defaultHome
//           // LoginCode == 1 ? FirstPage() :
//           LoginPage(),
//           // ChangeNotifierProvider<PostProvider>(
//           //   create: (context) => PostProvider(),
//           //   child: LoginPage(),
//           // ),
//
//         ),
//     );
//
//   }
// }




// import 'dart:convert';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:ronfic_ver2/controller/Club_Info_Admin.dart';
// import 'package:ronfic_ver2/controller/TEST.dart';
import 'package:ronfic_ver2/controller/auth_page.dart';
// import 'package:ronfic_ver2/controller/google_provider.dart';
import 'package:ronfic_ver2/controller/loginchk_info.dart';
// import 'package:ronfic_ver2/model/Club_mebers.dart';
// import 'package:ronfic_ver2/model/User_info.dart';
// import 'package:ronfic_ver2/screen/ScreenFirst.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'controller/firebase_provider.dart';

import 'package:provider/provider.dart';


// final FirebaseAuth _auth = FirebaseAuth.instance;
//
// void main(){
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'firebase',
//       home: MyHomePage(title:'firebase'),
//     );
//   }
// }
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key,this.title}) : super(key:key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// appBar: AppBar(
//   title:Text(widget.title),
//   actions: [
//     Builder(builder: (BuildContext context){
//       return FlatButton(
//         child: Text('Sign out'),
//         textColor: Theme.of(context).buttonColor,
//         onPressed: () async{
//           final FirebaseUser user = await _auth.currentUser();
//           if(user == null){
//             Scaffold.of(context).showSnackBar(SnackBar(
//               content: Text('no one has signed in.'),
//             ));
//             return;
//           }
//           await _auth.signOut();
//           final String uid = user.uid;
//           Scaffold.of(context).showSnackBar(SnackBar(
//             content: Text('${uid} has successfully signed out'),
//           ));
//
//         },
//       );
//     }),
//     FlatButton(
//       child: Text('안녕'),
//       onPressed: (){
//         Navigator.push(context,
//     MaterialPageRoute(builder: (context) =>  _RegisterEmailSection()));
//
//       },
//     )
//   ],
// ),
//       body:
//       Builder(builder: (BuildContext context){
//         return ListView(
//           scrollDirection: Axis.vertical,
//           padding: EdgeInsets.all(16),
//           children: [
//
//
//
//             Text('여기여기'),
//
//             Text('여기여기'),
//
//           ],
//         );
//       }),
//     );
//   }
// }
//
//
// final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
// final TextEditingController _emailController = TextEditingController();
// final TextEditingController _passwordController = TextEditingController();
// bool _success;
// String _userEmail;
// class _RegisterEmailSection extends StatefulWidget {
//   @override
//   __RegisterEmailSectionState createState() => __RegisterEmailSectionState();
// }
//
// class __RegisterEmailSectionState extends State<_RegisterEmailSection> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('여긴어디'),
//       ),
//       body: Form(
//         key:_formkey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextFormField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'email'
//               ),
//               validator: (String value){
//                 if (value.isEmpty){
//                   return 'please enter some text';
//                 }
//                 return null;
//               },
//             ),
//             TextFormField(
//               controller: _passwordController,
//               decoration: InputDecoration(
//                   labelText:'pwd'
//               ),
//               validator: (String value){
//                 if (value.isEmpty){
//                   return 'please enter some text';
//                 }
//                 return null;
//               },
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 16.0),
//               alignment: Alignment.center,
//               child: RaisedButton(
//                 onPressed: () async{
//                    if(_formkey.currentState.validate()){
//                   _register();
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//             ),
//             Container(
//
//               alignment: Alignment.center,
//               child: Text(_success == null ? 'user null': (_success ? 'successfully registered' + _userEmail : 'registeration failed')),
//             )
//           ],
//         ),
//       ),
//     );
//
//   }
//   void _register() async{
//     final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text)).user;
//     if(user == null){
//       setState(() {
//         _success = true;
//         _userEmail = user.email;
//       });
//     }else{
//       setState(() {
//
//       _success = true;
//       });
//     }
//
//   }
// }
//


//

import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
void main() => runApp(MyApp());
final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
void _initNotiSetting() async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final initSettingsAndroid = AndroidInitializationSettings('app_icon');
  final initSettingsIOS = IOSInitializationSettings(
    requestSoundPermission: true,
    requestBadgePermission: false,
    requestAlertPermission: false,
  );
  final initSettings = InitializationSettings(
  initSettingsAndroid,
  initSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(
    initSettings,
  );
}
class _MyAppState extends State<MyApp> {
  var tokens = '';
  @override
  void initState() {
    super.initState();
    firebaseCloudMessaging_Listeners();
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  WidgetsFlutterBinding.ensureInitialized();

    return MultiProvider(
      providers: [
        // ChangeNotifierProvider<BankAccount>(create: (_) => BankAccount()),
        // Provider<String>.value(value: "Park"),
        // ChangeNotifierProvider<FirebaseProvider>(
        //     create: (_) => FirebaseProvider()),
        ChangeNotifierProvider<ExistingMebers>(
            create: (_) => ExistingMebers()),
        // ChangeNotifierProvider<ClubInfo>(
        //     create: (_) => ClubInfo()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
              '/': (context) => AuthPage(),

          // '/second': (context) => SecondScreen(),
        },
      theme: ThemeData(
              scaffoldBackgroundColor:Colors.white,
              textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme,
            ),
            primaryColor: Colors.blueAccent[200],
            // primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
        title: "Ronfic Zone",

        // home: AuthPage(),
      ),
    );
  }

  void _incrementToken(var item){
    setState(() {
      tokens = item;
    });
  }


  void firebaseCloudMessaging_Listeners() {
    if (Platform.isIOS) iOS_Permission();

    _firebaseMessaging.getToken().then((token){

      print('token:'+token);
      _incrementToken(token);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {

        print('on message $message');
        if(message != null && message['notification']['title'] != null && message['notification']['body'] != null){
          showDialog(context: context,
          builder: (context)=> AlertDialog(
            content:ListTile(
              title: (message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: [
              FlatButton(child: Text('확인'),onPressed: () => Navigator.of(context).pop,)
            ],
          )
          );
        }

      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');

      },
      onLaunch: (Map<String, dynamic> message) async {

        print('on launch $message');
      },
    );
  }

  void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true)
    );
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings)
    {
      print("Settings registered: $settings");
    });
  }
}
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
// void main() => runApp(
//     MultiProvider(
//         providers: [
//           ChangeNotifierProvider<LoginCheckProvider>(create: (_) => new LoginCheckProvider(),)
//         ],
//         child: MaterialApp(home: AutoLoginCheck(),)
//     )
// );
//
// class LocalDbf{
//   static const String _AUTO_KEY = "auto";
//   static const String _AUTO_ID = "aid";
//   static const String _AUTO_TOKEN = "atoken";
//   Future<bool> autoCheck() async => await SharedPreferences.getInstance().then((SharedPreferences _pref) => _pref.getBool(_AUTO_KEY) ?? false);
//   Future<bool> setCheck({@required bool auto}) async => await SharedPreferences.getInstance().then((SharedPreferences _pref) async => await _pref.setBool(_AUTO_KEY, auto));
//   Future<Map<String, String>> userInfo() async => await SharedPreferences.getInstance()
//       .then((SharedPreferences _pref){
//     final String _id = _pref.getString(_AUTO_ID) ?? "";
//     final String _pwnToken = _pref.getString(_AUTO_TOKEN) ?? "";
//     if(_id.isEmpty || _pwnToken.isEmpty) return {};
//     return {"id":_id, "pw": _pwnToken};
//   });
//   Future<bool> setUserInfo({@required String id, @required String pwnToken}) async => await SharedPreferences.getInstance().then((SharedPreferences _pref) async{
//     final bool _setId = await _pref.setString(_AUTO_ID, id);
//     final bool _setPw = await _pref.setString(_AUTO_TOKEN, pwnToken);
//     if(!_setId || !_setPw) return false;
//     return true;
//   });
//   Future<bool> clearAutoInfo() async => await SharedPreferences.getInstance().then((SharedPreferences _pref) async => await _pref.clear() ?? false);
// }
//
// class Fetch{
//   static const String _END_POINT = "http://127.0.0.1:3000";
//   Future<bool> postFetch({@required Map<String, dynamic> body, @required Map<String, String> header}) async{
//     try{
//       http.Response _res = await http.post("$_END_POINT/login",headers: header, body: body).timeout(Duration(seconds: 8),onTimeout: () async => http.Response("false", 400));
//       bool _result = json.decode(_res.body);
//       return _result;
//     }
//     catch(e){
//       return false;
//     }
//   }
//   void _parse(){} // ... 반환 구조 지정 필요
// }
//
// class LoginCheckProvider with ChangeNotifier{
//   final LocalDbf _dbf = new LocalDbf();
//   final Fetch _fetch = new Fetch();
//
//   bool result;
//
//   LoginCheckProvider(){
//     Future.microtask(() async => await check());
//     return;
//   }
//
//   Future<void> check() async{
//     final bool _check = await _dbf.autoCheck();
//     if(!_check) return this.result = false;
//     final Map<String, String> _body = await _dbf.userInfo();
//     if(_body.isEmpty) return this.result = false;
//     this.result = await _fetch.postFetch(body: _body, header: {"token":"1"});
//     notifyListeners();
//   }
//
//   Future<void> logOut() async{
//     this.result = !await _dbf.clearAutoInfo();
//     notifyListeners();
//     return;
//   }
//
//   Future<void> login({@required String id, @required String pwnToken}) async{
//     final bool _res = await _fetch.postFetch(body: {'id':id, "pw":pwnToken}, header: {"token":"1"});
//     if(_res){
//       await _dbf.setCheck(auto: true);
//       await _dbf.setUserInfo(id: id, pwnToken: pwnToken);
//       this.result = true;
//     }
//     notifyListeners();
//   }
// }
//
// class AutoLoginCheck extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     LoginCheckProvider _lc = Provider.of<LoginCheckProvider>(context);
//     return _lc.result == null
//         ? Scaffold(body: Text("로딩"))
//         : _lc.result
//         ? new MainPage()
//         : new LoginPage();
//   }
// }
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   FocusNode _idFocus;
//   FocusNode _pwFocus;
//
//   TextEditingController _idController;
//   TextEditingController _pwController;
//
//   @override
//   void initState() {
//     if(!mounted) return;
//     Future.microtask((){
//       _idFocus = new FocusNode();
//       _pwFocus = new FocusNode();
//       _idController = new TextEditingController();
//       _pwController = new TextEditingController();
//       return;
//     }).then((_) => setState((){}));
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _idController?.dispose();
//     _pwController?.dispose();
//     super.dispose();
//   }
//
//   LoginCheckProvider _lc;
//
//   @override
//   Widget build(BuildContext context) {
//     if(_lc == null) _lc = Provider.of<LoginCheckProvider>(context);
//     return IgnorePointer(
//       ignoring: _idController == null || _pwController == null ? true : false,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Flexible(
//                     flex: 2,
//                     child: Container(
//                       margin: EdgeInsets.all(50.0),
//                       decoration: BoxDecoration(
//                           color: Colors.red,
//                           image: DecorationImage(
//                             image: NetworkImage(
//                               "https://raw.githubusercontent.com/doyle-flutter/Recipe/master/2019-11-21.webp",
//                             ),
//                             fit: BoxFit.cover,
//                           )
//                       ),
//                     )
//                 ),
//                 Flexible(
//                     child: Container(
//                       child: Form(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Flexible(
//                               child: Container(
//                                 width: MediaQuery.of(context).size.width/2,
//                                 alignment: Alignment.center,
//                                 child: TextField(
//                                   maxLines: 1,
//                                   focusNode: _idFocus,
//                                   textInputAction: TextInputAction.next,
//                                   cursorColor: Colors.black,
//                                   controller: _idController,
//                                   autocorrect: true,
//                                   enabled: true,
//                                   keyboardType: TextInputType.emailAddress,
//                                   onSubmitted: (String v)
//                                   => this._inputFieldFocusChange(
//                                       context: context,
//                                       currentFocus: this._idFocus,
//                                       nextFocus: this._pwFocus
//                                   ),
//                                   decoration: InputDecoration(
//                                       filled: true,
//                                       fillColor: Colors.grey[200],
//                                       hintText: "E-Mail",
//                                       prefixIcon: Icon(Icons.person,color: Colors.black,),
//                                       suffixIcon: this._inputIcon(controller: this._idController, currentFocus: this._idFocus),
//                                       border: InputBorder.none
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Flexible(
//                               child: Container(
//                                 width: MediaQuery.of(context).size.width/2,
//                                 alignment: Alignment.center,
//                                 child: TextField(
//                                   maxLines: 1,
//                                   focusNode: _pwFocus,
//                                   textInputAction: TextInputAction.done,
//                                   cursorColor: Colors.black,
//                                   controller: _pwController,
//                                   obscureText: true,
//                                   onSubmitted: (String v){},
//                                   decoration: InputDecoration(
//                                       filled: true,
//                                       fillColor: Colors.grey[200],
//                                       hintText: "Password",
//                                       prefixIcon: Icon(Icons.lock_outline, color: Colors.black,),
//                                       suffixIcon: this._inputIcon(
//                                           controller: this._pwController,
//                                           currentFocus: this._pwFocus),
//                                       border: InputBorder.none
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                 ),
//                 Flexible(
//                     child: Column(
//                       children: <Widget>[
//                         Flexible(
//                           child: Container(
//                             alignment: Alignment.center,
//                             child: MaterialButton(
//                               onPressed: this._validation,
//                               child: Text("Login"),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _inputIcon({TextEditingController controller, FocusNode currentFocus}){
//     if(controller?.text == "") return null;
//     else return IconButton(
//       icon: Icon(Icons.clear),
//       onPressed: () => this.clickClearText(targetVar: controller, currentFocus: currentFocus),
//     );
//   }
//
//   void _inputFieldFocusChange({
//     BuildContext context,
//     FocusNode currentFocus,
//     FocusNode nextFocus
//   }){
//     Future.microtask(() => currentFocus.unfocus())
//         .then((_) => FocusScope.of(context).requestFocus(nextFocus));
//   }
//
//   void clickClearText({
//     @required TextEditingController targetVar,
//     @required FocusNode currentFocus
//   }){
//     assert(targetVar != null); assert(currentFocus != null);
//     Future.delayed(Duration.zero,(){
//       currentFocus.unfocus();
//     }).then((_) => targetVar.clear());
//   }
//
//   Future<void> _validation() async{
//     await _lc.login(id: _idController.text, pwnToken: _pwController.text);
//     _idController.text = "";
//     _pwController.text = "";
//   }
// }
//
// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     LoginCheckProvider _lc = Provider.of<LoginCheckProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.error_outline),
//             onPressed: () async {
//               await _lc.logOut();
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Flutter Firebase")),
//       body: ListView(
//         children: <Widget>[
//           ListTile(
//             title: Text("Google Sign-In Demo"),
//             subtitle: Text("google_sign_in Plugin"),
//             onTap: () {
//               // Navigator.push(context,
//               //     MaterialPageRoute(builder: (context) => GoogleSignInDemo()));
//             },
//           ),
//           ListTile(
//             title: Text("Firebase Auth"),
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => AuthPage()));
//             },
//           )
//         ].map((e) {
//           return Card(
//             child: e,
//           );
//         }).toList(),
//       ),
//     );
//
//   }
//
// }
//
//








// class HomePage extends StatefulWidget {
//   final String title;
//
//   HomePage({this.title});
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     // final counter = Provider.of<Counter>(context); // Counter 타입의 데이터를 가져옴.
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Provider demoark가나다라",style: TextStyle(fontWeight: FontWeight.w500),),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               '${counter.getCounter()}',
//               style: Theme.of(context).textTheme.display1,
//             ),
//             RaisedButton(
//               onPressed: openFirstPage,
//               child: Text('가나 다라 마바사sadfsdafasdfasdf' ,style: TextStyle(fontWeight: FontWeight.bold), ),
//             ),
//             RaisedButton(
//               onPressed: openSecondPage,
//               child: Text('second page'),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FloatingActionButton(
//             onPressed: () =>
//                 Provider.of<Counter>(context, listen: false).increment(),
//             // 버튼을 누를 때마다, 값이 증가합니다. notifyListeners()가 호출되기에 UI가 갱신됩니다.
//             tooltip: 'Increment',
//             child: Icon(Icons.add),
//             heroTag: null,
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           FloatingActionButton(
//             onPressed: counter.decrement,
//             tooltip: 'Decrement',
//             child: Icon(Icons.remove),
//             heroTag: null,
//           )
//         ],
//       ),
//     );
//   }
//
//   // 다른 페이지로 이동을 합니다. 이동한 페이지에서도 Counter의 값은 동일합니다.
//   Future openFirstPage() {
//     return  Navigator.pushNamed(context, '/first');
//
//   }
//
//   Future openSecondPage() {
//     return Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => SecondPage()),
//     );
//   }
// }

// class Counter with ChangeNotifier {
//   int _counter;
//
//   Counter(this._counter);
//
//   getCounter() => _counter;
//
//   setCounter(int counter) => _counter = counter;
//
//   void increment() {
//     _counter++;
//     notifyListeners(); // 값이 변할 때마다 플러터 프레임워크에 알려줍니다.
//   }
//
//   void decrement() {
//     _counter--;
//     notifyListeners(); // 값이 변할 때마다 플러터 프레임워크에 알려줍니다.
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:ronfic_ver2/screen/HomePage.dart';
// // import 'package:planets_flutter/HomePage.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Planets',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }