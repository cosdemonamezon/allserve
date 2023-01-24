import 'package:allserve/Screen/Allserve/AllserveHome/AllServeService.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/Widgets/AddTextForm.dart';
import 'package:allserve/Screen/Widgets/ButtonRounded.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Widgets/LoadingDialog.dart';
import 'AllServeController.dart';

class AddRecruitScreen extends StatefulWidget {
  AddRecruitScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<AddRecruitScreen> createState() => _AddRecruitScreenState();
}

class _AddRecruitScreenState extends State<AddRecruitScreen> {
  @override
  final GlobalKey<FormState> addFormKey = GlobalKey<FormState>();
  final TextEditingController position = TextEditingController();
  final TextEditingController degree = TextEditingController();
  final TextEditingController major = TextEditingController();
  final TextEditingController salary = TextEditingController();
  final TextEditingController exp = TextEditingController();
  final TextEditingController qty = TextEditingController();
  final TextEditingController description = TextEditingController();
  int val = 0;
  String dayvalue = 'วัน';
  String mounthvalue = 'เดือน';
  String yearvalue = 'ปี';
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เพิ่มตำแหน่งงาน',
          //style: TextStyle(color: Colors.deepOrange),
        ),
        backgroundColor: Colors.transparent,
        // automaticallyImplyLeading: false,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Card(
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
                                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                            AddTextForm(
                              controller: position,
                              hintText: '',
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'วุฒิการศึกษา',
                                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                            AddTextForm(
                              controller: degree,
                              hintText: '',
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(
                            //       vertical: 10, horizontal: 10),
                            //   child: Text(
                            //     'เพศ',
                            //     style: TextStyle(
                            //         color: Colors.blue,
                            //         fontWeight: FontWeight.bold),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(
                            //       vertical: 10, horizontal: 10),
                            //   child: Row(
                            //     children: [
                            //       Radio(
                            //         value: 1,
                            //         groupValue: val,
                            //         onChanged: (value) {
                            //           setState(() {
                            //             val = int.parse(value.toString());
                            //           });
                            //         },
                            //         activeColor: Colors.blue,
                            //       ),
                            //       Text("ชาย"),
                            //       Radio(
                            //         value: 2,
                            //         groupValue: val,
                            //         onChanged: (value) {
                            //           setState(() {
                            //             val = int.parse(value.toString());
                            //           });
                            //         },
                            //         activeColor: Colors.blue,
                            //       ),
                            //       Text("หญิง"),
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: size.height * 0.02,
                            // ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'สาขา',
                                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                            AddTextForm(
                              controller: major,
                              hintText: '',
                            ),
                            // SizedBox(
                            //   height: size.height * 0.02,
                            // ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'เงินเดือน',
                                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                            AddTextForm(controller: salary, hintText: '', keyboardType: TextInputType.phone),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'ประสบการณ์',
                                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                            AddTextForm(
                              controller: exp,
                              hintText: '',
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'จำนวนที่รับ',
                                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                            AddTextForm(
                              controller: qty,
                              hintText: '',
                            ),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(vertical: 10),
                            //   child: Text(
                            //     'ที่อยู่',
                            //     style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                            //   ),
                            // ),
                            // AddTextForm(
                            //   controller: username,
                            //   hintText: '',
                            //   maxLines: 4,
                            // ),
                            // SizedBox(
                            //   height: size.height * 0.02,
                            // ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'ลักษณะงาน',
                                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                              ),
                            ),
                            AddTextForm(
                              controller: description,
                              hintText: '',
                              maxLines: 4,
                            ),
                            SizedBox(height: 25),
                            ButtonRounded(
                              text: 'บันทึก',
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: () {
                                showCupertinoDialog(
                                  context: context,
                                  builder: (context) => CupertinoAlertDialog(
                                    title: Text(
                                      'ดำเนินการเรียบร้อย',
                                      //style: TextStyle(fontFamily: fontFamily),
                                    ),
                                    content: Text(
                                      'ต้องการออกจากหน้านี้หรือไม่',
                                      //style: TextStyle(fontFamily: fontFamily),
                                    ),
                                    actions: <CupertinoDialogAction>[
                                      CupertinoDialogAction(
                                        child: Text(
                                          'ยกเลิก',
                                          // style: TextStyle(
                                          //   color: kThemeTextColor,
                                          //   fontFamily: fontFamily,
                                          //   fontWeight: FontWeight.bold,
                                          // ),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                      CupertinoDialogAction(
                                        child: Text(
                                          'ตกลง',
                                          // style: TextStyle(
                                          //   color: kThemeTextColor,
                                          //   fontFamily: fontFamily,
                                          // ),
                                        ),
                                        onPressed: () async {
                                          try {
                                            LoadingDialog.open(context);
                                            final String position1 = position.text;
                                            final String degree1 = degree.text;
                                            final String major1 = major.text;
                                            final String salary1 = salary.text;
                                            final String exp1 = exp.text;
                                            final String qty1 = qty.text;
                                            final String description1 = description.text;
                                            await JobService().postRecruitment(
                                                user_id: widget.id.toString(),
                                                position: position1,
                                                degree: degree1,
                                                major: major1,
                                                salary: salary1,
                                                exp: exp1,
                                                qty: qty1,
                                                description: description1);
                                            await context.read<JobController>().loadPositionCompay(id: widget.id);
                                            LoadingDialog.close(context);
                                            if (mounted) {
                                              Navigator.of(context)
                                                ..pop()
                                                ..pop();
                                            }
                                          } catch (e) {
                                            LoadingDialog.close(context);
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                backgroundColor: Colors.blueAccent,
                                                title: Text("Error", style: TextStyle(color: Colors.white)),
                                                content: Text(e.toString(), style: TextStyle(color: Colors.white)),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('OK', style: TextStyle(color: Colors.white)))
                                                ],
                                              ),
                                            );
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
