import 'package:allserve/Screen/Allserve/AllServeHome.dart';
import 'package:allserve/Screen/Login/WelcomeScreen.dart';
import 'package:allserve/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String token = '';

void main() async {
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
        textSelectionTheme:
            TextSelectionThemeData(cursorColor: kThemeTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // ignore: unnecessary_null_comparison
      home: token != "null" ? AllServeHome() : WelcomeScreen(),
    );
  }
}
