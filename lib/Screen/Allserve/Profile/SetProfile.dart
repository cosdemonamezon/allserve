import 'package:allserve/Screen/Alljob/Notification/NotificationScreen.dart';
import 'package:allserve/Screen/Alljob/Profile/SetAbout.dart';
import 'package:allserve/Screen/Alljob/Profile/SetHelp.dart';
import 'package:allserve/Screen/Alljob/Profile/SetPayment.dart';
import 'package:allserve/Screen/Alljob/Profile/Widgets/CustomButton.dart';
import 'package:allserve/Screen/Allpartner/Profile/PartnerAddress.dart';
import 'package:allserve/Screen/Allpartner/Profile/PartnerLanguage.dart';
import 'package:allserve/Screen/Allpartner/Profile/ProfilePratnerScreen.dart';
import 'package:allserve/Screen/Allserve/Profile/Widgets/SetUpMenu.dart';
import 'package:allserve/Screen/Login/WelcomeScreen.dart';
import 'package:allserve/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetProfileScreen extends StatefulWidget {
  SetProfileScreen({Key? key}) : super(key: key);

  @override
  State<SetProfileScreen> createState() => _SetProfileScreenState();
}

class _SetProfileScreenState extends State<SetProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appFontSize = AppFontSize.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Stack(
            children: [
              Container(
                height: size.height / 6,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: Colors.blue,
                ),
              ),
              Column(
                children: [
                  Container(
                    height: size.height / 6,
                    width: size.width,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        left: size.height / 40,
                        right: size.height / 40,
                        top: size.height * 0.01),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: size.width > 700 ? 70 : 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/icons/user.png'),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Thawatchai Allserve',
                                style: TextStyle(
                                  fontSize: appFontSize?.body,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 3),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProfilePratnerScreen()));
                                },
                                child: Text(
                                  'แก้ไขข้อมูล',
                                  style: TextStyle(
                                    fontSize: appFontSize?.body3,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  // Divider(color: Colors.grey),
                  TitleTextWidget(title: 'บัญชีของฉัน', size: size),
                  SetUpMenu(
                    title: 'จัดการที่อยู่',
                    image: 'mapSetting',
                    page: PartnerAddress(),
                  ),
                  Divider(color: Colors.grey),
                  SetUpMenu(
                    title: 'ภาษา',
                    image: 'translate',
                    page: PartnerLanguage(),
                  ),
                  Divider(color: Colors.grey),
                  TitleTextWidget(title: 'ตั้งค่าแอป', size: size),
                  SetUpMenu(
                    title: 'แจ้งเตือน',
                    image: 'notificationSetting',
                    page: NotificationScreen(),
                  ),
                  Divider(color: Colors.grey),
                  SetUpMenu(
                    title: 'ข้อมูลบัตรเครดิต/เดบิต',
                    image: 'wallet',
                    page: SetPayment(),
                  ),
                  Divider(color: Colors.grey),
                  TitleTextWidget(title: 'ข้อมูล', size: size),
                  SetUpMenu(
                    title: 'ช่วยเหลือ',
                    image: 'questionSetting',
                    page: SetHelp(),
                  ),
                  Divider(color: Colors.grey),
                  SetUpMenu(
                    title: 'เกี่ยวกับเรา',
                    image: 'copyright',
                    page: SetAbout(),
                  ),
                  Divider(color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 25, right: 25, bottom: 10),
        child: CustomButton(
          color: Colors.white,
          borderOnly: true,
          text: 'ออกจากระบบ',
          onPressed: () async {
            logOut(context);
          },
        ),
      ),
    );
  }
  logOut(context) async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => WelcomeScreen(),
      ),
      (route) => false,
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({Key? key, required this.size, required this.title})
      : super(key: key);

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05, vertical: size.height * 0.02),
          child: Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
