import 'dart:async';

import 'package:allserve/Screen/Allserve/AllServeHome.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:allserve/Screen/Login/WelcomeScreen.dart';
import 'package:allserve/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screen/Allserve/AllserveHome/AllServeController.dart';
import 'Screen/Allserve/AllserveHome/Logistic/LogisticController.dart';
import 'Screen/Allserve/AllserveHome/RecruitScreen.dart';
import 'Screen/Allserve/AllserveHome/Scrap/ScrapController.dart';
import 'Screen/Allserve/AllserveHome/purchase/purchaseController.dart';
import 'Screen/Allserve/Search/Controller.dart';
import 'Screen/app/AppController.dart';

String token = '';

void main() {
  configLoading();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppController()),
      ChangeNotifierProvider(create: (_) => JobController()),
      ChangeNotifierProvider(create: (_) => SearchController()),
      ChangeNotifierProvider(create: (_) => ScrapController()),
      ChangeNotifierProvider(create: (_) => LogisticController()),
      ChangeNotifierProvider(create: (_) => PurchaseController()),
    ],
    child: const MyApp(),
  ));
}

void main2() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  String tokenString = await prefs.getString('token').toString();
  if (tokenString != '') token = tokenString;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('th');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AllZerve',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'NotoSansThai',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(),
        ),
        primaryColor: kPrimaryColor,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'NotoSansThai',
        textSelectionTheme: TextSelectionThemeData(cursorColor: kThemeTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // ignore: unnecessary_null_comparison
      home: SplashScreen(),
      // home: token != "null" ? AllServeHome() : WelcomeScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
            Color(0xFFffffff),
            Color(0xFFd5e8f9),
          ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/ALLZERVE.png",
                  height: 300.0,
                  width: 300.0,
                ),
                Text(
                  "ยินดีต้อนรับเข้าสู่ระบบ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}
