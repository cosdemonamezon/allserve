import 'dart:developer';

import 'package:allserve/Screen/Allserve/AllserveHome/purchase/purchaseService.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

import '../../../../../appTheme.dart';
import '../../../../Login/Widgets/AppTextForm.dart';
import '../../../../Widgets/LoadingDialog.dart';
import '../../../../app/AppController.dart';
import '../purchaseController.dart';

class AddPurchasePage extends StatefulWidget {
  const AddPurchasePage({super.key});

  @override
  State<AddPurchasePage> createState() => _AddPurchasePageState();
}

class _AddPurchasePageState extends State<AddPurchasePage> {
  final TextEditingController title = TextEditingController();
  final TextEditingController qty = TextEditingController();
  final TextEditingController remark = TextEditingController();
  final TextEditingController time = TextEditingController();
  int a = 1;
  FilePickerResult? result;
  // PlatformFile? _selectedFile;
  final _controller = ScrollController();
  List<PlatformFile>? _selectedFile;
  List<String> ListChacked = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstInstall();
  }

  Future<void> _firstInstall() async {
    await context.read<AppController>().initialize();
    await context.read<PurchaseController>().loadDetailVendorPurchase();
  }

  @override
  Widget build(BuildContext context) {
    final appFontSize = AppFontSize.of(context);
    final size = MediaQuery.of(context).size;
    final user = context.read<AppController>().user;
    return Consumer<PurchaseController>(
      builder: (context, controller, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'เพิ่มรายการ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: appFontSize?.appBarFont,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  children: List.generate(
                      a,
                      (index) => Padding(
                            padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
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
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('${index + 1}.'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text('ชื่อสินค้า'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    AppTextForm(
                                      controller: title,
                                      hintText: 'ใส่ชื่อสินค้า',
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text('จำนวน'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    AppTextForm(
                                      controller: qty,
                                      hintText: '',
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text('รายละเอียด'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    AppTextForm(
                                      controller: remark,
                                      hintText: '',
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text('ระยะเวลาการปิดรับขอเสนอ'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    AppTextForm(
                                      controller: time,
                                      hintText: 'ชั่วโมง',
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
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
                                          itemCount: controller.detailPurchase.length,
                                          itemBuilder: (_, index) {
                                            return CheckboxListTile(
                                              controlAffinity: ListTileControlAffinity.leading,
                                              value: controller.detailPurchase[index].isChecked,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  controller.detailPurchase[index].isChecked = value!;
                                                  print(controller.detailPurchase[index].isChecked);
                                                  if (controller.detailPurchase[index].isChecked == true) {
                                                    // 'รถกระบะ';
                                                    ListChacked.add(controller.detailPurchase[index].name!);
                                                    print(ListChacked);
                                                  } else if (controller.detailPurchase[index].isChecked == false) {
                                                    ListChacked.remove(controller.detailPurchase[index].name!);
                                                    print(ListChacked);
                                                  }
                                                });
                                              },
                                              title: Text(controller.detailPurchase[index].name!),
                                            );
                                          }),
                                    ),
                                    Row(
                                      children: [
                                        Text('รูป'),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    // _selectedFile != null ? Center(child: buildFille(_selectedFile!)) : SizedBox.shrink(),
                                    _selectedFile != null
                                        ? GridView.builder(
                                            shrinkWrap: true,
                                            controller: _controller,
                                            padding: EdgeInsets.all(15),
                                            scrollDirection: Axis.vertical,
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 4,
                                              mainAxisSpacing: 2,
                                              crossAxisSpacing: 2,
                                            ),
                                            itemCount: _selectedFile!.length,
                                            itemBuilder: (context, index) {
                                              final file = _selectedFile![index];
                                              inspect(file);

                                              return buildFille(file);
                                            })
                                        : SizedBox.shrink(),
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
                                                  final result = await FilePicker.platform
                                                      .pickFiles(allowMultiple: true, type: FileType.image);
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
                                  ],
                                ),
                              ),
                            ),
                          )),
                ),

                // InkWell(
                //   onTap: () {
                //     setState(() {
                //       a = a + 1;
                //     });
                //   },
                //   child: Container(
                //     height: 40,
                //     width: 40,
                //     decoration: BoxDecoration(
                //       color: Colors.grey,
                //       borderRadius: BorderRadius.all(Radius.circular(30)),
                //     ),
                //     child: Center(child: Icon(Icons.plus_one)),
                //   ),
                // ),

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
                                'ยืนยัน',
                                //style: TextStyle(fontFamily: fontFamily),
                              ),
                              content: Text(
                                'เพิ่มความต้องการ',
                                //style: TextStyle(fontFamily: fontFamily),
                              ),
                              actions: <CupertinoDialogAction>[
                                CupertinoDialogAction(
                                  child: Text(
                                    'ยกเลิก',
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                CupertinoDialogAction(
                                  child: Text(
                                    'ตกลง',
                                  ),
                                  onPressed: () async {
                                    try {
                                      LoadingDialog.open(context);
                                      await PurchaseSrevice().postListPurchase(
                                        user_id: user!.id.toString(),
                                        name: title.text,
                                        qty: qty.text,
                                        description: remark.text,
                                        expire_hour: time.text,
                                        images: _selectedFile!,
                                      );
                                      if (mounted) {
                                        await context.read<PurchaseController>().detailPurchaseCompany(user.id!);
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
                              'ยืนยัน',
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
