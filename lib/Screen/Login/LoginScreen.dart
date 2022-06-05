import 'package:allserve/Screen/Alljob/AlljobHome.dart';
import 'package:allserve/Screen/Allpartner/AllpartnerHome.dart';
import 'package:allserve/Screen/Allserve/AllServeHome.dart';
import 'package:allserve/Screen/Login/Widgets/AppTextForm.dart';
import 'package:allserve/Screen/Widgets/ButtonRounded.dart';
import 'package:allserve/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isLoadding = false;

  @override
  void dispose() {
    super.dispose();
    username.dispose();
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
                              'Username',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          AppTextForm(
                            controller: username,
                            hintText: 'Username',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Password',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          AppTextForm(
                            controller: password,
                            hintText: 'Password',
                            isPassword: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    ButtonRounded(
                      text: 'Login',
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {
                        Future.delayed(Duration(seconds: 1), () {
                          setState(() {
                            isLoadding = true;
                          });
                          Future.delayed(Duration(seconds: 3), () {
                            if (username.text != '') {
                              setState(() {
                                isLoadding = false;
                              });
                              if (username.text == 'allserv') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AllServeHome()));
                              } else if (username.text == 'alljob') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AlljobHome()));
                              } else if (username.text == 'allpartner') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AllPartnerHome()));
                              } else {}
                            } else {
                              print('No data');
                            }
                          });
                        });
                      },
                    ),
                    SizedBox(height: 25),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'ForgotPassword',
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
}
