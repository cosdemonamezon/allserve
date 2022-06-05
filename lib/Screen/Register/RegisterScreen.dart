import 'package:allserve/Screen/Register/Widgets/RegisTextField.dart';
import 'package:allserve/Screen/Widgets/BackButtonWithOrIcon.dart';
import 'package:allserve/Screen/Widgets/ButtonRounded.dart';
import 'package:allserve/appTheme.dart';
import 'package:allserve/constants.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final appFontSize = AppFontSize.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
                        BackButtonWithOrIcon(),
                        SizedBox(height: 22),
                        Text(
                          'สมัครสมาชิก',
                          style: TextStyle(
                            fontSize: appFontSize?.title,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 50),
                        Text(
                          'ชื่อ - นามสกุล',
                          style: TextStyle(fontSize: appFontSize?.body),
                        ),
                        SizedBox(height: 10),
                        RegisTextField(
                          hintText: 'กรอกชื่อ - นามสกุล',
                        ),
                        SizedBox(height: 16),
                        Text(
                          'ชื่อผู้ใช้',
                          style: TextStyle(fontSize: appFontSize?.body),
                        ),
                        SizedBox(height: 10),
                        RegisTextField(
                          hintText: 'กรอกชื่อผู้ใช้',
                        ),
                        SizedBox(height: 16),
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
                          hintText: '••••••••••',
                          isPassword: true,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'ยืนยันรหัสผ่าน',
                          style: TextStyle(fontSize: appFontSize?.body),
                        ),
                        SizedBox(height: 10),
                        RegisTextField(
                          hintText: '••••••••••',
                          isPassword: true,
                        ),
                        SizedBox(height: 16),
                        Container(
                          padding: EdgeInsets.only(bottom: padding.bottom),
                          height: size.height / 7,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Column(
                              children: [
                                SizedBox(height: 8),
                                ButtonRounded(
                                  text: 'สมัครสมาชิก',
                                  color: kThemeTextColor,
                                  textColor: Colors.white,
                                  onPressed: () async {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).viewInsets.bottom * 0.4,
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
