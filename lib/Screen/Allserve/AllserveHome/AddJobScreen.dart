import 'package:allserve/Screen/Allserve/Search/Widgets/RecordTexForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddJobScreen extends StatefulWidget {
  AddJobScreen({Key? key}) : super(key: key);

  @override
  State<AddJobScreen> createState() => _AddJobScreenState();
}

class _AddJobScreenState extends State<AddJobScreen> {
  bool isChecked = false;
  final GlobalKey<FormState> recordFormKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  int val = 0;
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
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    'ชื่อตำแหน่ง *',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: RecordTextForm(
                hintText: 'กรุณากรอกชื่อและนามสกุล',
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: [
                  Text('เพศ'),
                  Row(
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
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    'ช่วงอายุ *',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.45,
                    child: RecordTextForm(
                      hintText: '',
                    ),
                  ),
                  Text('-'),
                  SizedBox(
                    width: size.width * 0.45,
                    child: RecordTextForm(
                      hintText: '',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    'การศึกษา *',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: RecordTextForm(
                hintText: 'ปริญญาตรี',
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    'สาขา *',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: RecordTextForm(
                hintText: 'สาระสนเทศ',
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            InkWell(
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: Text(
                      'เพิ่มรายการเรียบร้อย',
                      //style: TextStyle(fontFamily: fontFamily),
                    ),
                    content: Text(
                      'กดตกลงเพื่อดำเนินการต่อ',
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
                        onPressed: () => Navigator.pop(context, true),
                      ),
                      CupertinoDialogAction(
                        child: Text(
                          'ตกลง',
                          // style: TextStyle(
                          //   color: kThemeTextColor,
                          //   fontFamily: fontFamily,
                          // ),
                        ),
                        onPressed: () => Navigator.of(context)
                          ..pop()
                          ..pop(),
                      )
                    ],
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.32,
                  //color: Colors.red,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Center(
                      child: Text(
                    'เพิ่ม',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
