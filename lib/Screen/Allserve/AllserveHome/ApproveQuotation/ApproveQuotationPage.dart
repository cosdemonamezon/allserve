import 'package:allserve/Screen/Allserve/AllserveHome/AllServeService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../appTheme.dart';
import '../../../Login/Widgets/AppTextForm.dart';
import '../../../Widgets/LoadingDialog.dart';
import '../Widgets/TextFieldWidget.dart';

class ApproveQuotationPage extends StatefulWidget {
  const ApproveQuotationPage(
      {super.key, required this.id, required this.titer, required this.remark, required this.file, required this.page});
  final int id;
  final String titer;
  final String remark;
  final String file;
  final String page;

  @override
  State<ApproveQuotationPage> createState() => _ApproveQuotationPageState();
}

class _ApproveQuotationPageState extends State<ApproveQuotationPage> {
  final TextEditingController remark = TextEditingController();
  String selectedItem = 'Approve';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final appFontSize = AppFontSize.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'รายละเอียด',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: appFontSize?.appBarFont,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.titer, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(widget.remark,
                        style: TextStyle(
                          fontSize: 15,
                        ))
                  ],
                ),
                Column(
                  children: [
                    Text('clickme'),
                    InkWell(
                      onTap: () {
                        final url = widget.file;

                        openBrowserURL(url: url, inApp: true);
                      },
                      child: Icon(
                        Icons.file_open,
                        size: 80,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                      width: size.width * 0.25,
                      height: size.height * 0.1,
                      child: Row(
                        children: [
                          Radio<String>(
                            fillColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                            value: 'Approve',
                            groupValue: selectedItem,
                            onChanged: (value) {
                              setState(() {
                                selectedItem = value!;
                              });
                            },
                          ),
                          SizedBox(height: size.height * 0.08, width: size.width * 0.18, child: Icon(Icons.check)),
                          Text('ตกลงรับข้อเสนอ', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.25,
                      height: size.height * 0.1,
                      child: Row(
                        children: [
                          Radio<String>(
                            fillColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                            value: 'Cancel',
                            groupValue: selectedItem,
                            onChanged: (value) {
                              setState(() {
                                selectedItem = value!;
                              });
                            },
                          ),
                          SizedBox(
                              height: size.height * 0.08, width: size.width * 0.18, child: Icon(Icons.cancel_outlined)),
                          Text('ไม่ต้องรับข้อเสนอ', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ]),
            ),
            Text('เพราะเหตุใด', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            SizedBox(
              height: size.height * 0.01,
            ),
            AppTextForm(
              controller: remark,
              keyboardType: TextInputType.multiline,
              hintText: 'รายละเอียด',
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SizedBox(
              height: size.height * 0.10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
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
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            CupertinoDialogAction(
                              child: Text(
                                'ตกลง',
                              ),
                              onPressed: () async {
                                switch (widget.page) {
                                  case "Logistic":
                                    {
                                      await JobService().postApproveScrap(
                                          id: widget.id.toString(), remark: remark.text, status: selectedItem);
                                      if (mounted) {
                                        Navigator.of(context)
                                          ..pop()
                                          ..pop();
                                      }
                                      break;
                                    }
                                  case "Scrap":
                                    {
                                      await JobService().postApproveScrap(
                                          id: widget.id.toString(), remark: remark.text, status: selectedItem);
                                      if (mounted) {
                                        Navigator.of(context)
                                          ..pop()
                                          ..pop();
                                      }
                                      break;
                                    }
                                  case "Purchase":
                                    {
                                      await JobService().postApprovePurchase(
                                          id: widget.id.toString(), remark: remark.text, status: selectedItem);
                                      if (mounted) {
                                        Navigator.of(context)
                                          ..pop()
                                          ..pop();
                                      }
                                      break;
                                    }
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
    );
  }

  Future openBrowserURL({
    required String url,
    bool inApp = false,
  }) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(
        url,
        forceSafariVC: inApp,
        forceWebView: inApp,
        enableJavaScript: true,
        enableDomStorage: true,
      );
    }
  }
}
