import 'package:allserve/Screen/Allserve/AllserveHome/Widgets/AddTextForm.dart';
import 'package:allserve/Screen/Widgets/ButtonRounded.dart';
import 'package:flutter/material.dart';

class AddRecruitScreen extends StatefulWidget {
  AddRecruitScreen({Key? key}) : super(key: key);

  @override
  State<AddRecruitScreen> createState() => _AddRecruitScreenState();
}

class _AddRecruitScreenState extends State<AddRecruitScreen> {
  @override
  final GlobalKey<FormState> addFormKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  int val = 0;
  String dayvalue = 'วัน';
  String mounthvalue = 'เดือน';
  String yearvalue = 'ปี';
  bool isChecked = false;

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Recruit',
          //style: TextStyle(color: Colors.deepOrange),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Color(0xFFF3F3F3),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: addFormKey,
                      child: Wrap(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'ตำแหน่งงาน',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          AddTextForm(
                            controller: username,
                            hintText: 'Username',
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'การศึกษา',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          AddTextForm(
                            controller: username,
                            hintText: 'Username',
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Text(
                              'เพศ',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: val,
                                  onChanged: (value) {
                                    setState(() {
                                      val = int.parse(value.toString());
                                    });
                                  },
                                  activeColor: Colors.blue,
                                ),
                                Text("ชาย"),
                                Radio(
                                  value: 2,
                                  groupValue: val,
                                  onChanged: (value) {
                                    setState(() {
                                      val = int.parse(value.toString());
                                    });
                                  },
                                  activeColor: Colors.blue,
                                ),
                                Text("หญิง"),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'เบอร์โทรศัพ',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          AddTextForm(
                            controller: username,
                            hintText: 'กรุณากรอกเบอร์โทรติดต่อ',
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'เงินเดือน',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          AddTextForm(
                            controller: username,
                            hintText: 'เงินเดือน',
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'ที่อยู่',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          AddTextForm(
                            controller: username,
                            hintText: '',
                            maxLines: 4,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'เกี่ยวกับบริษัท',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          AddTextForm(
                            controller: username,
                            hintText: '',
                            maxLines: 4,
                          ),
                          SizedBox(height: 25),
                          ButtonRounded(
                            text: 'บันทึก',
                            color: Colors.blue,
                            textColor: Colors.white,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
