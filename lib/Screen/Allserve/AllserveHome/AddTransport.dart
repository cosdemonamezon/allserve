import 'package:allserve/Screen/Allserve/Search/Widgets/RecordTexForm.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTransport extends StatefulWidget {
  AddTransport({Key? key}) : super(key: key);

  @override
  State<AddTransport> createState() => _AddTransportState();
}

class _AddTransportState extends State<AddTransport> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  FilePickerResult? result;
  PlatformFile? file;
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
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Container(
                      width: size.width * 0.25,
                      height: size.height * 0.15,
                      child: Column(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: isChecked1,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked1 = value!;
                              });
                            },
                          ),
                          SizedBox(
                              height: size.height * 0.08,
                              width: size.width * 0.18,
                              child: Image.asset(
                                'assets/icons/box1.png',
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
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: isChecked2,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked2 = value!;
                              });
                            },
                          ),
                          SizedBox(
                              height: size.height * 0.08,
                              width: size.width * 0.18,
                              child: Image.asset(
                                'assets/icons/box2.png',
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
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: isChecked3,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked3 = value!;
                              });
                            },
                          ),
                          SizedBox(
                              height: size.height * 0.08,
                              width: size.width * 0.18,
                              child: Image.asset(
                                'assets/icons/box3.png',
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
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: isChecked4,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked4 = value!;
                              });
                            },
                          ),
                          SizedBox(
                              height: size.height * 0.08,
                              width: size.width * 0.18,
                              child: Image.asset(
                                'assets/icons/box3.png',
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
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: isChecked5,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked5 = value!;
                              });
                            },
                          ),
                          SizedBox(
                              height: size.height * 0.08,
                              width: size.width * 0.18,
                              child: Image.asset(
                                'assets/icons/box3.png',
                                fit: BoxFit.fill,
                              )),
                          Text('เครื่องบิน')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        SizedBox(
                            width: size.width * 0.10, child: Text('กว้าง')),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        SizedBox(width: size.width * 0.10, child: Text('รูป')),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.60,
                    child: InkWell(
                      onTap: () async {
                        result = await FilePicker.platform.pickFiles();
                        setState(() {
                          if (result != null) {
                            file = result!.files.first;
                            print(file);
                          } else {
                            print('No file');
                          }
                        });
                      },
                      child: Container(
                        width: size.width * 0.60,
                        height: size.height * 0.12,
                        color: file != null ? Colors.blueAccent : Colors.grey,
                        child: Center(
                            child: Text(
                          'อัพโหลดรูป',
                          style: TextStyle(fontSize: 16),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.hardEdge,
        //shape: CircularNotchedRectangle(),
        elevation: 25,
        child: Container(
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
                                    onPressed: () =>
                                        Navigator.pop(context, true),
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
                      'บันทึก',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
