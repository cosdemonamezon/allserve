import 'dart:developer';
import 'dart:io';

import 'package:allserve/Screen/Allserve/AllserveHome/Logistic/LogisiticSrevicer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

import '../../../../Alljob/Job/Widgets/RecordTexForm.dart';
import '../../../../Widgets/LoadingDialog.dart';
import '../../../../app/AppController.dart';
import '../LogisticController.dart';

class AddLogisticPage extends StatefulWidget {
  const AddLogisticPage({super.key});

  @override
  State<AddLogisticPage> createState() => _AddLogisticPageState();
}

class _AddLogisticPageState extends State<AddLogisticPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController width = TextEditingController();
  final TextEditingController height = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController qty = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController startlocation = TextEditingController();
  final TextEditingController endlocation = TextEditingController();
  final TextEditingController time = TextEditingController();

  bool isChecked = false;
  String selectedItem = 'มอเอต์ไซด์';

  FilePickerResult? result;
  // PlatformFile? _selectedFile;
  List<PlatformFile>? _selectedFile;
  final _controller = ScrollController();
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

  List<String> ListChacked = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstInstall();
  }

  Future<void> _firstInstall() async {
    await context.read<AppController>().initialize();
    await context.read<LogisticController>().loadDetailVendorLogistic();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = context.read<AppController>().user;
    return Consumer<LogisticController>(
      builder: (context, controller, child) => Scaffold(
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
        body: controller.detailLogistic.isEmpty
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
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
                                SizedBox(width: size.width * 0.10, child: Text('ชื่อ')),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.60,
                            child: RecordTextForm(
                              controller: name,
                              hintText: 'หัวข้อ',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                            child: Row(
                              children: [
                                Text(''),
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
                                SizedBox(width: size.width * 0.10, child: Text('รายละเอียด')),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.60,
                            child: RecordTextForm(
                              controller: description,
                              hintText: '',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                            child: Row(
                              children: [
                                Text(''),
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
                              controller: startlocation,
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
                              controller: endlocation,
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
                              controller: width,
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
                                SizedBox(width: size.width * 0.10, child: Text('สูง')),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.60,
                            child: RecordTextForm(
                              controller: height,
                              hintText: 'ระบุความสูง',
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
                              controller: weight,
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
                              controller: qty,
                              hintText: 'ระบุจำนวน',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                            child: Row(
                              children: [
                                Text('ชิ้น'),
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
                            Text('ระยะเวลาการปิดรับขอเสนอ'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                            child: Row(
                              children: [
                                SizedBox(width: size.width * 0.10, child: Text('')),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.60,
                            child: RecordTextForm(
                              controller: time,
                              hintText: '',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                            child: Row(
                              children: [
                                Text('ชั่วโมง'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('ความต้องการ'),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      SizedBox(
                        child: ListView.builder(
                            // controller: _controller,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.detailLogistic.length,
                            itemBuilder: (_, index) {
                              return CheckboxListTile(
                                controlAffinity: ListTileControlAffinity.leading,
                                value: controller.detailLogistic[index].isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    controller.detailLogistic[index].isChecked = value!;
                                    print(controller.detailLogistic[index].isChecked);
                                    if (controller.detailLogistic[index].isChecked == true) {
                                      // 'รถกระบะ';
                                      ListChacked.add(controller.detailLogistic[index].name!);
                                      print(ListChacked);
                                    } else if (controller.detailLogistic[index].isChecked == false) {
                                      ListChacked.remove(controller.detailLogistic[index].name!);
                                      print(ListChacked);
                                    }
                                  });
                                },
                                title: Text(controller.detailLogistic[index].name!),
                              );
                            }),
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
                      _selectedFile != null
                          ? GridView.builder(
                              shrinkWrap: true,
                              controller: _controller,
                              padding: EdgeInsets.all(15),
                              scrollDirection: Axis.vertical,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 2,
                                crossAxisSpacing: 2,
                              ),
                              itemCount: _selectedFile!.length,
                              itemBuilder: (context, index) {
                                final file = _selectedFile![index];
                                final File fileImage = File(file.path!);
                                final extension = file.extension ?? 'none';
                                inspect(file);

                                // return buildFille(file);
                                return InkWell(
                                  onTap: () => OpenFile.open(file.path),
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: Stack(clipBehavior: Clip.none, children: [
                                          file.path == null ? Image.asset('No_Image_Available') : Image.file(fileImage),
                                          // Container(
                                          //   alignment: Alignment.center,
                                          //   width: double.infinity,
                                          //   decoration: BoxDecoration(
                                          //       color: Colors.orange, borderRadius: BorderRadius.circular(12)),
                                          //   child: Text(
                                          //     '.$extension',
                                          //     style: TextStyle(
                                          //         fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                                          //   ),
                                          // ),
                                          Positioned(
                                            top: -8,
                                            right: -8,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _selectedFile!.removeAt(index);
                                                  print(file);
                                                });
                                              },
                                              child: Icon(
                                                Icons.remove_circle,
                                              ),
                                            ),
                                          ),
                                        ])),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          file.name,
                                          style:
                                              TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              })
                          : SizedBox.shrink(),
                      // _selectedFile != null ? Center(child: buildFille(_selectedFile!)) : SizedBox.shrink(),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      // _selectedFile != null
                      //     ? Center(
                      //         child: Container(
                      //           height: size.height * 0.05,
                      //           width: size.width * 0.25,
                      //           color: Colors.redAccent,
                      //           child: InkWell(
                      //             onTap: () async {
                      //               setState(() {
                      //                 _selectedFile = null;
                      //               });
                      //             },
                      //             child: Center(
                      //                 child: Text(
                      //               'ลบไฟล์',
                      //               style: TextStyle(color: Colors.white),
                      //             )),
                      //           ),
                      //         ),
                      //       )
                      Center(
                        child: Container(
                          height: size.height * 0.05,
                          width: size.width * 0.25,
                          color: Colors.blueAccent,
                          child: InkWell(
                            onTap: () async {
                              final result =
                                  await FilePicker.platform.pickFiles(allowMultiple: true, type: FileType.image);
                              setState(() {
                                if (result == null) return;

                                _selectedFile = result.files;
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
                                        onPressed: () async {
                                          try {
                                            LoadingDialog.open(context);
                                            await LogisticSrevice().postListLogistic(
                                              user_id: user!.id.toString(),
                                              name: name.text,
                                              description: description.text,
                                              width: width.text,
                                              weight: weight.text,
                                              height: height.text,
                                              qty: qty.text,
                                              transport_type: selectedItem,
                                              start_lat: '1',
                                              start_lon: '1',
                                              start_location: startlocation.text,
                                              end_lat: '1',
                                              end_lon: '1',
                                              end_location: endlocation.text,
                                              expire_hour: time.text,
                                              images: _selectedFile!,
                                            );
                                            if (mounted) {
                                              await context.read<LogisticController>().detailLogisticCompany(user.id!);
                                              LoadingDialog.close(context);
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
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            )),
            SizedBox(
              height: 8,
            ),
            Text(
              file.name,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
