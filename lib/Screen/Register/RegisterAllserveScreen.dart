import 'dart:io';

import 'package:allserve/Models/Login.dart';
import 'package:allserve/Screen/Login/WelcomeScreen.dart';
import 'package:allserve/Screen/Register/Widgets/RegisTextField.dart';
import 'package:allserve/Screen/Widgets/BackButtonWithOrIcon.dart';
import 'package:allserve/Screen/Widgets/ButtonRounded.dart';
import 'package:allserve/appTheme.dart';
import 'package:allserve/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:allserve/Screen/Widgets/cupertinoAlertDialog.dart';
import 'package:allserve/constants/constants.dart';
import 'package:allserve/Screen/Register/RegisterController.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'Servicer.dart';

class RegisterAllserveScreen extends StatefulWidget {
  RegisterAllserveScreen({Key? key}) : super(key: key);

  @override
  State<RegisterAllserveScreen> createState() => _RegisterAllserveScreenState();
}

class _RegisterAllserveScreenState extends State<RegisterAllserveScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController phone = TextEditingController();
  bool isLoadding = false;
  File? _selectedFile;
  Widget getImageWidget() {
    if (_selectedFile != null) {
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 80,
        child: ClipOval(
          child: Image.file(
            _selectedFile!,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 80,
        child: ClipOval(
          child: Image.asset(
            'assets/icons/user.png',
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }

  Future<void> getImage(ImageSource source) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        final cropped = await ImageCropper().cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          compressQuality: 90,
          maxHeight: 500,
          maxWidth: 500,
          compressFormat: ImageCompressFormat.jpg,
        );

        setState(() {
          _selectedFile = File(cropped!.path);
        });
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final appFontSize = AppFontSize.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/ALLZERVE.png', width: 100, height: 50),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: isLoadding == true
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width / 1.5,
                    height: 140,
                    child: Image.asset("assets/images/ALLZERVE.png"),
                  ),
                ],
              )
            : Stack(
                children: [
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                    ),
                  ),
                  SafeArea(
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 21),
                        constraints: BoxConstraints(maxWidth: 900),
                        child: Form(
                          key: registerFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // BackButtonWithOrIcon(),
                              SizedBox(height: 22),
                              Text(
                                'สมัครสมาชิก AllZerve',
                                style: TextStyle(
                                  fontSize: appFontSize?.title,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Stack(
                                children: [
                                  Center(
                                    child: getImageWidget(),
                                  ),
                                  Positioned(
                                    top: 130,
                                    left: 210,
                                    child: GestureDetector(
                                      onTap: () {
                                        getImage(ImageSource.gallery);
                                      },
                                      child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            color: Colors.grey,
                                          ),
                                          child: Icon(
                                            Icons.add_a_photo_outlined,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'อีเมล',
                                style: TextStyle(fontSize: appFontSize?.body),
                              ),
                              SizedBox(height: 10),
                              RegisTextField(
                                controller: email,
                                hintText: 'กรอก อีเมล',
                              ),
                              SizedBox(height: 16),
                              Text(
                                'ชื่อบริษัท',
                                style: TextStyle(fontSize: appFontSize?.body),
                              ),
                              SizedBox(height: 10),
                              RegisTextField(
                                controller: firstname,
                                hintText: 'กรอกชื่อบริษัท',
                              ),
                              SizedBox(height: 16),
                              // Text(
                              //   'นามสกุล',
                              //   style: TextStyle(fontSize: appFontSize?.body),
                              // ),
                              // SizedBox(height: 10),
                              // RegisTextField(
                              //   controller: lastname,
                              //   hintText: 'กรอกนามสกุล',
                              // ),
                              // SizedBox(height: 16),
                              Text(
                                'เบอร์โทรศัพท์',
                                style: TextStyle(fontSize: appFontSize?.body),
                              ),
                              SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Text(
                                      '+66',
                                      style: TextStyle(
                                        fontSize: appFontSize?.body2,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: RegisTextField(
                                      controller: phone,
                                      hintText: 'กรอกเบอร์โทรศัพท์',
                                      maxLength: 10,
                                      isHideCounter: true,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Text(
                                'รหัสผ่าน',
                                style: TextStyle(fontSize: appFontSize?.body),
                              ),
                              SizedBox(height: 10),
                              RegisTextField(
                                controller: password,
                                hintText: '',
                                isPassword: true,
                                validator: (value) {
                                  final regExp = RegExp(
                                    r'^(?=.*\d)(?=.*[a-zA-Z]).{0,}$',
                                  );
                                  if (value!.isEmpty || value == '') {
                                    return 'กรุณากรอกรหัสผ่าน';
                                  }
                                  if (value.length < 8 || value.length > 20) {
                                    return 'รหัสผ่านต้องมีความยาว 8 - 20 ตัวอักษร';
                                  }
                                  if (value != confirmpassword.text) {
                                    return 'รหัสผ่านไม่ตรงกัน';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16),
                              Text(
                                'ยืนยันรหัสผ่าน',
                                style: TextStyle(fontSize: appFontSize?.body),
                              ),
                              SizedBox(height: 10),
                              RegisTextField(
                                controller: confirmpassword,
                                hintText: '',
                                isPassword: true,
                                validator: (value) {
                                  if (value!.isEmpty || value == '') {
                                    return 'กรุณากรอกยืนยันรหัสผ่าน';
                                  }
                                  if (value.length < 8 || value.length > 20) {
                                    return 'รหัสผ่านต้องมีความยาว 8 - 20 ตัวอักษร';
                                  }
                                  if (value != password.text) {
                                    return 'รหัสผ่านไม่ตรงกัน';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16),
                              Container(
                                padding: EdgeInsets.only(bottom: padding.bottom),
                                height: size.height / 7,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 8),
                                      ButtonRounded(
                                        text: 'สมัครสมาชิก',
                                        color: Colors.blue,
                                        textColor: Colors.white,
                                        onPressed: () async {
                                          final userCompany = await RegisterService().setInformation(
                                            permission_id: '1',
                                            username: email.text,
                                            password: password.text,
                                            name: firstname.text,
                                            email: email.text,
                                            phone: phone.text,
                                            type: 'customer',
                                            line_token: '-',
                                            image: _selectedFile!,
                                          );
                                          // try {
                                          if (userCompany != null) {
                                            return showCupertinoDialog(
                                                context: context,
                                                builder: (context) => CupertinoQuestion(
                                                      title: 'ลงทะเบียนใช้งาน',
                                                      content: 'การลงทะเบียนสำเร็จ',
                                                      press: () {
                                                        Navigator.push(context,
                                                            MaterialPageRoute(builder: (context) => WelcomeScreen()));
                                                      },
                                                    ));
                                          }
                                          // } catch (e) {
                                          //   showDialog(
                                          //     context: context,
                                          //     builder: (context) => AlertDialog(
                                          //       backgroundColor: Colors.blueAccent,
                                          //       title: Text("Error", style: TextStyle(color: Colors.white)),
                                          //       content: Text(e.toString(), style: TextStyle(color: Colors.white)),
                                          //       actions: [
                                          //         TextButton(
                                          //             onPressed: () {
                                          //               Navigator.pop(context);
                                          //             },
                                          //             child: Text('OK', style: TextStyle(color: Colors.white)))
                                          //       ],
                                          //     ),
                                          //   );
                                          // }
                                        },
                                        // onPressed: () async {
                                        //   final url = Uri.parse('$baseUrl//api/user');
                                        //   final response = await http.post(url, body: {
                                        //     'permission_id': '1',
                                        //     'username': email.text,
                                        //     'password': password.text,
                                        //     'name': firstname.text,
                                        //     'email': email.text,
                                        //     'phone': phone.text,
                                        //     'type': "customer",
                                        //     "line_token": '-'
                                        //   });
                                        //   if (response.statusCode == 200) {
                                        //     final data = convert.jsonDecode(response.body);

                                        //     showCupertinoDialog(
                                        //         context: context,
                                        //         builder: (context) => CupertinoQuestion(
                                        //               title: 'ลงทะเบียนใช้งาน',
                                        //               content: 'การลงทะเบียนสำเร็จ',
                                        //               press: () {
                                        //                 Navigator.push(context,
                                        //                     MaterialPageRoute(builder: (context) => WelcomeScreen()));
                                        //               },
                                        //             ));
                                        //     return data;
                                        //   } else {
                                        //     final error = convert.jsonDecode(response.body);

                                        //     showCupertinoDialog(
                                        //         context: context,
                                        //         builder: (context) => CupertinoQuestion(
                                        //               title: 'ลงทะเบียนไม่สำเร็จ',
                                        //               content: error['message'].toString(),
                                        //               press: () {
                                        //                 Navigator.pop(context, true);
                                        //               },
                                        //             ));
                                        //     return null;
                                        //   }
                                        // },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).viewInsets.bottom * 0.4,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
