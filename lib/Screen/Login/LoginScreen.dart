import 'package:allserve/Screen/Alljob/AlljobHome.dart';
import 'package:allserve/Screen/Allpartner/AllpartnerHome.dart';
import 'package:allserve/Screen/Allserve/AllServeHome.dart';
import 'package:allserve/Screen/Login/LoginApi.dart';
import 'package:allserve/Screen/Login/Widgets/AppTextForm.dart';
import 'package:allserve/Screen/Widgets/ButtonRounded.dart';
import 'package:allserve/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/cupertino.dart';
import 'package:allserve/Screen/Widgets/cupertinoAlertDialog.dart';

import 'package:allserve/constants/constants.dart';
import 'package:allserve/Screen/Register/RegisterController.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isLoadding = false;

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //extendBody: true,
      body: SafeArea(
        child: isLoadding == true
            ? Center(
                child: SizedBox(
                  width: size.width / 1.5,
                  height: 140,
                  child: Image.asset("assets/images/645bf.gif"),
                ),
              )
            : SingleChildScrollView(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/ALLZERVE.png',
                          height: 200,
                          width: 250,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Form(
                      key: loginFormKey,
                      child: Wrap(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'อีเมล',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          AppTextForm(
                            controller: email,
                            hintText: 'อีเมล',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'รหัสผ่าน',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          AppTextForm(
                            controller: password,
                            hintText: 'รหัสผ่าน',
                            isPassword: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    ButtonRounded(
                      text: 'เข้าสู่ระบบ',
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {
                        signIn(email: email.text, password: password.text);
                      },
                    ),
                    SizedBox(height: 25),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'ลืมรหัสผ่าน',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Future<bool?> signIn({
    required String email,
    required String password,
  }) async {
    final url = Uri.https(publicUrl, 'api/public/api/login');
    final response = await http.post(url, body: {
      'username': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);

      final SharedPreferences prefs = await _prefs;

      if (data != null) {
        await prefs.setString('token', data['token']);
        await prefs.setString('uid', data['data']['id'].toString());
      }

      showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoQuestion(
                title: 'การเข้าสู่ระบบ',
                content: 'ยินดีต้อนรับ เข้าสู่ระบบสำเร็จ',
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AllServeHome()));
                },
              ));
      return true;
    } else {
      final error = convert.jsonDecode(response.body);

      showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoQuestion(
                title: 'การเข้าสู่ระบบไม่สำเร็จ',
                content: error['message'].toString(),
                press: () {
                  Navigator.pop(context, true);
                },
              ));
      return null;
    }
  }

  void login(context) async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      isLoadding = true;
    });
    final response =
        await LoginApi.login(email: email.text, password: password.text);
    if (response['status_api']) {
      await prefs.setString('token', response['token']);

      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          isLoadding = false;
        });
        if (response['data']['firstName'] == 'allserve') {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AllServeHome()));
        } else if (response['data']['firstName'] == 'alljob') {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AlljobHome()));
        } else if (response['data']['firstName'] == 'allpartner') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AllPartnerHome()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AllPartnerHome()));
        }
      });
    } else {
      print(response);
    }
  }
}
