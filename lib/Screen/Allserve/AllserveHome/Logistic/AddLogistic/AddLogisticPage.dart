import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

import '../../../../Alljob/Job/Widgets/RecordTexForm.dart';

class AddLogisticPage extends StatefulWidget {
  const AddLogisticPage({super.key});

  @override
  State<AddLogisticPage> createState() => _AddLogisticPageState();
}

class _AddLogisticPageState extends State<AddLogisticPage> {
  bool isChecked = false;
  String selectedItem = 'มอเอต์ไซด์';

  FilePickerResult? result;
  PlatformFile? _selectedFile;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เพิ่มขนส่ง',
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Row(
                  children: [
                    Text('ประเภทขนส่ง'),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SizedBox(
                height: size.height * 0.20,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Container(
                      width: size.width * 0.25,
                      height: size.height * 0.15,
                      child: Column(
                        children: [
                          Radio<String>(
                            fillColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                            value: 'มอเอต์ไซด์',
                            groupValue: selectedItem,
                            onChanged: (value) {
                              setState(() {
                                selectedItem = value!;
                              });
                            },
                          ),
                          SizedBox(
                              height: size.height * 0.08,
                              width: size.width * 0.18,
                              child: Image.asset(
                                'assets/r4.png',
                                fit: BoxFit.fill,
                              )),
                          Text('มอเอต์ไซด์')
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.25,
                      height: size.height * 0.15,
                      child: Column(
                        children: [
                          Radio<String>(
                            fillColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                            value: 'รถกระบะ',
                            groupValue: selectedItem,
                            onChanged: (value) {
                              setState(() {
                                selectedItem = value!;
                              });
                            },
                          ),
                          SizedBox(
                              height: size.height * 0.08,
                              width: size.width * 0.18,
                              child: Image.asset(
                                'assets/r5.png',
                                fit: BoxFit.fill,
                              )),
                          Text('รถกระบะ')
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.25,
                      height: size.height * 0.15,
                      child: Column(
                        children: [
                          Radio<String>(
                            fillColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                            value: 'รถ 6 ล้อ',
                            groupValue: selectedItem,
                            onChanged: (value) {
                              setState(() {
                                selectedItem = value!;
                              });
                            },
                          ),
                          SizedBox(
                              height: size.height * 0.08,
                              width: size.width * 0.18,
                              child: Image.asset(
                                'assets/r7.png',
                                fit: BoxFit.fill,
                              )),
                          Text('รถ 6 ล้อ')
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.25,
                      height: size.height * 0.15,
                      child: Column(
                        children: [
                          Radio<String>(
                            fillColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                            value: 'เรือ',
                            groupValue: selectedItem,
                            onChanged: (value) {
                              setState(() {
                                selectedItem = value!;
                              });
                            },
                          ),
                          SizedBox(
                              height: size.height * 0.08,
                              width: size.width * 0.18,
                              child: Image.asset(
                                'assets/r2.png',
                                fit: BoxFit.fill,
                              )),
                          Text('เรือ')
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.25,
                      height: size.height * 0.15,
                      child: Column(
                        children: [
                          Radio<String>(
                            fillColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                            value: 'เครื่องบิน',
                            groupValue: selectedItem,
                            onChanged: (value) {
                              setState(() {
                                selectedItem = value!;
                              });
                            },
                          ),
                          SizedBox(
                              height: size.height * 0.08,
                              width: size.width * 0.18,
                              child: Image.asset(
                                'assets/r1.png',
                                fit: BoxFit.fill,
                              )),
                          Text('เครื่องบิน')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: size.height * 0.20,
              //   child: ListView(
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     physics: const ClampingScrollPhysics(),
              //     children: [
              //       Container(
              //         width: size.width * 0.25,
              //         height: size.height * 0.15,
              //         child: Column(
              //           children: [
              //             Checkbox(
              //               checkColor: Colors.white,
              //               fillColor: MaterialStateProperty.resolveWith(getColor),
              //               value: isChecked,
              //               onChanged: (bool? value) {
              //                 setState(() {
              //                   isChecked = value!;
              //                 });
              //               },
              //             ),
              //             SizedBox(
              //                 height: size.height * 0.08,
              //                 width: size.width * 0.18,
              //                 child: Image.asset(
              //                   'assets/r4.png',
              //                   fit: BoxFit.fill,
              //                 )),
              //             Text('มอเอต์ไซด์')
              //           ],
              //         ),
              //       ),
              //       Container(
              //         width: size.width * 0.25,
              //         height: size.height * 0.15,
              //         child: Column(
              //           children: [
              //             Checkbox(
              //               checkColor: Colors.white,
              //               fillColor: MaterialStateProperty.resolveWith(getColor),
              //               value: isChecked,
              //               onChanged: (bool? value) {
              //                 setState(() {
              //                   isChecked = value!;
              //                 });
              //               },
              //             ),
              //             SizedBox(
              //                 height: size.height * 0.08,
              //                 width: size.width * 0.18,
              //                 child: Image.asset(
              //                   'assets/r5.png',
              //                   fit: BoxFit.fill,
              //                 )),
              //             Text('รถกระบะ')
              //           ],
              //         ),
              //       ),
              //       Container(
              //         width: size.width * 0.25,
              //         height: size.height * 0.15,
              //         child: Column(
              //           children: [
              //             Checkbox(
              //               checkColor: Colors.white,
              //               fillColor: MaterialStateProperty.resolveWith(getColor),
              //               value: isChecked,
              //               onChanged: (bool? value) {
              //                 setState(() {
              //                   isChecked = value!;
              //                 });
              //               },
              //             ),
              //             SizedBox(
              //                 height: size.height * 0.08,
              //                 width: size.width * 0.18,
              //                 child: Image.asset(
              //                   'assets/r7.png',
              //                   fit: BoxFit.fill,
              //                 )),
              //             Text('รถ 6 ล้อ')
              //           ],
              //         ),
              //       ),
              //       Container(
              //         width: size.width * 0.25,
              //         height: size.height * 0.15,
              //         child: Column(
              //           children: [
              //             Checkbox(
              //               checkColor: Colors.white,
              //               fillColor: MaterialStateProperty.resolveWith(getColor),
              //               value: isChecked,
              //               onChanged: (bool? value) {
              //                 setState(() {
              //                   isChecked = value!;
              //                 });
              //               },
              //             ),
              //             SizedBox(
              //                 height: size.height * 0.08,
              //                 width: size.width * 0.18,
              //                 child: Image.asset(
              //                   'assets/r2.png',
              //                   fit: BoxFit.fill,
              //                 )),
              //             Text('เรือ')
              //           ],
              //         ),
              //       ),
              // Container(
              //   width: size.width * 0.25,
              //   height: size.height * 0.15,
              //   child: Column(
              //     children: [
              //       Checkbox(
              //         checkColor: Colors.white,
              //         fillColor: MaterialStateProperty.resolveWith(getColor),
              //         value: isChecked,
              //         onChanged: (bool? value) {
              //           setState(() {
              //             isChecked = value!;
              //           });
              //         },
              //       ),
              //       SizedBox(
              //           height: size.height * 0.08,
              //           width: size.width * 0.18,
              //           child: Image.asset(
              //             'assets/r1.png',
              //             fit: BoxFit.fill,
              //           )),
              //       Text('เครื่องบิน')
              //     ],
              //   ),
              // ),
              //     ],
              //   ),
              // ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Row(
                  children: [
                    Text('จำนวน และ ขนาด'),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        SizedBox(width: size.width * 0.10, child: Text('สถานที่')),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.60,
                    child: RecordTextForm(
                      hintText: 'สถานที่',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        Text('รับ'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        SizedBox(width: size.width * 0.10, child: Text('สถานที่')),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.60,
                    child: RecordTextForm(
                      hintText: 'สถานที่',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        Text('ส่ง'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        SizedBox(width: size.width * 0.10, child: Text('กว้าง')),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.60,
                    child: RecordTextForm(
                      hintText: 'ระบุความกว้าง',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        Text('เมตร'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        SizedBox(width: size.width * 0.10, child: Text('ยาว')),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.60,
                    child: RecordTextForm(
                      hintText: 'ระบุความยาว',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        Text('เมตร'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        SizedBox(width: size.width * 0.10, child: Text('หนัก')),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.60,
                    child: RecordTextForm(
                      hintText: 'ระบุน้ำหนัก',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        Text('กิโล..'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        SizedBox(width: size.width * 0.10, child: Text('จำนวน')),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.60,
                    child: RecordTextForm(
                      hintText: 'ระบุจำนวน',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        Text('กล่อง'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Row(
                  children: [
                    Text('รูป'),
                  ],
                ),
              ),
              _selectedFile != null ? Center(child: buildFille(_selectedFile!)) : SizedBox.shrink(),
              SizedBox(
                height: size.height * 0.05,
              ),
              _selectedFile != null
                  ? Center(
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.25,
                        color: Colors.redAccent,
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              _selectedFile = null;
                            });
                          },
                          child: Center(
                              child: Text(
                            'ลบไฟล์',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    )
                  : Center(
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.25,
                        color: Colors.blueAccent,
                        child: InkWell(
                          onTap: () async {
                            final result = await FilePicker.platform.pickFiles(type: FileType.image);
                            setState(() {
                              if (result == null) return;

                              _selectedFile = result.files[0];
                            });
                          },
                          child: Center(
                              child: Text(
                            'อัพโหลดไฟล์',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ),
              SizedBox(
                height: size.height * 0.10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: Text(
                              'บันทึกข้อมูลสำเร็จ',
                              //style: TextStyle(fontFamily: fontFamily),
                            ),
                            content: Text(
                              'กด ตกลง เพื่อดำเนินการต่อ',
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
                          width: size.width * 0.75,
                          //color: Colors.red,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Center(
                              child: Text(
                            'บันทึก',
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFille(PlatformFile file) {
    final extension = file.extension ?? 'none';

    return InkWell(
      onTap: () => OpenFile.open(file.path),
      child: Container(
        width: 200,
        height: 200,
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(12)),
              child: Text(
                '.$extension',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            )),
            SizedBox(
              height: 8,
            ),
            Text(
              file.name,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
