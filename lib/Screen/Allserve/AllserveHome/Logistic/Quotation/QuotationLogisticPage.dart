import 'dart:developer';

import 'package:allserve/Models/imagesCpmpanie/imagesLogistic.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/Logistic/LogisiticSrevicer.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/Logistic/LogisticController.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Models/addService.dart';
import '../../../../../appTheme.dart';
import '../../../../Widgets/ButtonRounded.dart';
import '../../../../Widgets/LoadingDialog.dart';
import '../../ApproveQuotation/ApproveQuotationPage.dart';

class QuotationLogisticPage extends StatefulWidget {
  QuotationLogisticPage({super.key, required this.id, this.images});
  final int id;
  final List<ImagesLogistic>? images;

  @override
  State<QuotationLogisticPage> createState() => _QuotationLogisticPageState();
}

class _QuotationLogisticPageState extends State<QuotationLogisticPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _loadItem();
    _tabController = TabController(length: 2, vsync: this);
    // _controller.addListener(() {
    //   if (_controller.position.pixels == _controller.position.maxScrollExtent) {
    //     _loadItem();
    //   }
    // });
    print(widget.id);
    inspect(widget.images);
  }

  Future _loadItem() async {
    await context.read<LogisticController>().detailQuotation(widget.id);
    await context.read<LogisticController>().loadDetailVendorLogistic();
    // // Logistic
    final alllogistic = context.read<LogisticController>().detailLogistic;
    final vendorlogistic = context.read<LogisticController>().quotationDetailLogistic!.services;
    final logisticselected = vendorlogistic!.where((element) => alllogistic.contains(element.service_id));
    for (var logisticDetail in vendorlogistic) {
      for (var logistic in alllogistic) {
        print("${logisticDetail.service_id} = ${logistic.id}");
        if (logisticDetail.service_id == logistic.id.toString()) {
          final datalogistic = AddService(service_type: 'logistic', service_id: int.parse(logisticDetail.service_id!));
          print("object");
          setState(() {
            logistic.isChecked = true;
            ListChacked.add(datalogistic);
          });
        }
      }
    }
  }

  List<AddService> ListChacked = [];
  late TabController _tabController;
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final appFontSize = AppFontSize.of(context);
    final size = MediaQuery.of(context).size;
    return Consumer<LogisticController>(
      builder: (context, controller, child) => DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'รายละเอียด',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: appFontSize?.appBarFont,
                  ),
                ),
                bottom: TabBar(
                  //isScrollable: true,
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.blue,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'NotoSansThai'),
                  tabs: [
                    Tab(text: 'รายละเอียดสินค้า'),
                    Tab(text: 'ใบเสนอราคา'),
                  ],
                ),
              ),
              body: SafeArea(
                  child: TabBarView(controller: _tabController, children: [
                //Tap1
                controller.quotationDetailLogistic == null
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 10),
                            //   child: SearchTextField(),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
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
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      widget.images?.isEmpty ?? true
                                          ? Image.asset('assets/No_Image_Available.jpg')
                                          : GridView.builder(
                                              shrinkWrap: true,
                                              // controller: _controller,
                                              physics: NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                              ),
                                              itemCount: widget.images!.length,
                                              itemBuilder: (context, index) {
                                                return widget.images![index].image != null
                                                    ? InkWell(
                                                        onTap: () {
                                                          final url = widget.images![index].image;

                                                          openBrowserURL(url: url!, inApp: false);
                                                        },
                                                        child: Image.network(widget.images![index].image!))
                                                    : Image.asset('assets/No_Image_Available.jpg');
                                              }),
                                      Divider(
                                        thickness: 3,
                                      ),
                                      Text(controller.quotationDetailLogistic?.name ?? ' ',
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('คำอธิบาย: ${controller.quotationDetailLogistic?.description ?? ' '}',
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('จำนวน: ${controller.quotationDetailLogistic?.qty ?? ' '}',
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('สถานที่รับ: ${controller.quotationDetailLogistic?.start_location ?? ' '}',
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('สถานที่ส่ง: ${controller.quotationDetailLogistic?.end_location ?? ' '}',
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          'ประเภทการขนส่ง: ${controller.quotationDetailLogistic?.transport_type ?? ' '}',
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('ความกว้าง: ${controller.quotationDetailLogistic?.width ?? ' '}',
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('ความสูง: ${controller.quotationDetailLogistic?.height ?? ' '}',
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('น้ำหนัก: ${controller.quotationDetailLogistic?.weight ?? ' '}',
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(
                              child: controller.detailLogistic.isEmpty
                                  ? Center(child: CircularProgressIndicator())
                                  : ListView.builder(
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
                                            final dataLogistic = AddService(
                                                service_id: controller.detailLogistic[index].id!,
                                                service_type: 'logistic');
                                            setState(() {
                                              controller.detailLogistic[index].isChecked = value!;
                                              print(controller.detailLogistic[index].isChecked);
                                              if (value) {
                                                // 'รถกระบะ';
                                                ListChacked.add(dataLogistic);
                                                inspect(ListChacked);
                                              } else {
                                                // ListChacked.remove(controller.detailLogistic[index].name!);
                                                ListChacked.removeWhere(
                                                  (element) =>
                                                      element.service_id == dataLogistic.service_id &&
                                                      element.service_type == 'logistic',
                                                );
                                                inspect(ListChacked);
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
                              padding: const EdgeInsets.all(20),
                              child: ButtonRounded(
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
                                              await LogisticSrevice().setServiceOrder(
                                                order_id: widget.id,
                                                order_type: 'logistic',
                                                services: ListChacked,
                                              );
                                              // await context
                                              //     .read<ProfileController>()
                                              //     .vendorDetailService(user.partner_detail!.id!);
                                              if (mounted) {
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
                              ),
                            ),
                          ],
                        ),
                      ),
                //Tap2
                controller.quotationDetailLogistic == null
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              child: controller.quotationDetailLogistic?.quotations?.isEmpty ?? true
                                  ? SizedBox.shrink()
                                  : ListView.builder(
                                      controller: _controller,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: controller.quotationDetailLogistic!.quotations!.length,
                                      itemBuilder: (_, index) {
                                        // final String? selectedFile = controller.quotationDetailLogistic!.quotations![index].path;
                                        // final File path = selectedFile as File;
                                        // if (index < controller.quotationDetailLogistic!.quotations!.length) {
                                        return Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                return ApproveQuotationPage(
                                                  page: 'Logistic',
                                                  company: controller
                                                      .quotationDetailLogistic!.quotations![index].parther!.name!,
                                                  id: controller.quotationDetailLogistic!.quotations![index].id!,
                                                  titer: controller.quotationDetailLogistic!.quotations![index].title!,
                                                  remark:
                                                      controller.quotationDetailLogistic!.quotations![index].remark!,
                                                  file: controller.quotationDetailLogistic!.quotations![index].path!,
                                                );
                                              }));
                                            },
                                            child: Container(
                                              width: size.width,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage('assets/images/promotionBG.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      offset: Offset(0, 2),
                                                      color: Color.fromRGBO(0, 78, 179, 0.05),
                                                      blurRadius: 10)
                                                ],
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                                                child: Row(
                                                  children: [
                                                    // Expanded(
                                                    //   flex: 2,
                                                    //   child: controller.quotationDetailLogistic!.quotations![index].image != null
                                                    //       ? Image.network(
                                                    //           "${controller.quotationDetailLogistic!.quotations![index].image}",
                                                    //           height: size.height / 17,
                                                    //           errorBuilder: (context, error, stackTrace) =>
                                                    //               Image.asset('assets/No_Image_Available.jpg'),
                                                    //         )
                                                    //       : Image.asset('assets/No_Image_Available.jpg'),
                                                    // ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      flex: 8,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "บริษัท:${controller.quotationDetailLogistic?.quotations?[index].parther?.name ?? ''}",
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: appFontSize?.body),
                                                            overflow: TextOverflow.fade,
                                                            maxLines: 5,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    controller.quotationDetailLogistic!
                                                                            .quotations![index].title ??
                                                                        '',
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: appFontSize?.body),
                                                                  ),
                                                                  Text(
                                                                    controller.quotationDetailLogistic!
                                                                            .quotations![index].remark ??
                                                                        '',
                                                                    style: TextStyle(fontSize: appFontSize?.body2),
                                                                    overflow: TextOverflow.ellipsis,
                                                                  ),
                                                                  SizedBox(height: 4),
                                                                  // Center(child: buildFille(path)),
                                                                  Column(
                                                                    children: [
                                                                      Text('ดาวน์โหลด'),
                                                                      InkWell(
                                                                          onTap: () {
                                                                            final url = controller
                                                                                .quotationDetailLogistic!
                                                                                .quotations![index]
                                                                                .path;

                                                                            openBrowserURL(url: url!, inApp: false);
                                                                          },
                                                                          child: Icon(Icons.file_open)),
                                                                    ],
                                                                  ),
                                                                  // Text(
                                                                  //   selectedFile!,
                                                                  //   style: TextStyle(fontSize: appFontSize?.body2),
                                                                  //   overflow: TextOverflow.ellipsis,
                                                                  // ),
                                                                  SizedBox(height: 4),
                                                                  // Text(
                                                                  //   'ลักษณะงาน ${controller.logoCompay[index].type ?? ''}',
                                                                  //   style: TextStyle(fontSize: appFontSize?.body2),
                                                                  //   // overflow: TextOverflow.ellipsis,
                                                                  // ),
                                                                  // SizedBox(height: 4),
                                                                ],
                                                              ),
                                                              Container(
                                                                height: size.height * 0.04,
                                                                width: size.width * 0.08,
                                                                color: Colors.blueAccent,
                                                                child: Center(
                                                                    child: Icon(
                                                                  Icons.arrow_forward_ios,
                                                                  size: 20,
                                                                  color: Colors.white,
                                                                )),
                                                              ),
                                                              // InkWell(
                                                              //   onTap: () async {
                                                              //     // final result2 =
                                                              //     await showCupertinoDialog<bool>(
                                                              //       context: context,
                                                              //       builder: (context) {
                                                              //         return CupertinoAlertDialog(
                                                              //           title: Text(
                                                              //             'ยืนยัน',
                                                              //           ),
                                                              //           content: Text(
                                                              //             'ยืนยันรับใบเสนอราคา',
                                                              //           ),
                                                              //           actions: [
                                                              //             CupertinoDialogAction(
                                                              //                 child: Text(
                                                              //                   'ยืนยัน',
                                                              //                 ),
                                                              //                 onPressed: () async {}),
                                                              //             CupertinoDialogAction(
                                                              //               child: Text(
                                                              //                 'ยกเลิก',
                                                              //               ),
                                                              //               onPressed: () => Navigator.pop(context, false),
                                                              //             ),
                                                              //           ],
                                                              //         );
                                                              //       },
                                                              //     );
                                                              //     // if (result2 == true) {
                                                              //     //   setState(() {
                                                              //     //     controller.meetings[i].isAccept = true;
                                                              //     //   });
                                                              //     //   print(controller.meetings[i].isAccept);
                                                              //     // }
                                                              //   },
                                                              //   child: Container(
                                                              //     width: MediaQuery.of(context).size.width * 0.18,
                                                              //     height: MediaQuery.of(context).size.height * 0.1,
                                                              //     decoration: BoxDecoration(
                                                              //       color: Colors.blue,
                                                              //       borderRadius: BorderRadius.circular(20),
                                                              //     ),
                                                              //     child: Row(
                                                              //       mainAxisAlignment: MainAxisAlignment.center,
                                                              //       children: [
                                                              //         Text(
                                                              //           'Accept',
                                                              //           style: TextStyle(
                                                              //               fontWeight: FontWeight.bold, fontSize: 15),
                                                              //         )
                                                              //       ],
                                                              //     ),
                                                              //   ),
                                                              // )
                                                            ],
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
                                        // }
                                        // else {
                                        //   return Padding(
                                        //     padding: const EdgeInsets.symmetric(vertical: 30),
                                        //     child: Center(
                                        //       child: controllerLogistic.hasmore
                                        //           ? const CircularProgressIndicator()
                                        //           : const Text(''),
                                        //     ),
                                        //   );
                                        // }
                                      }),
                            ),
                          ],
                        ),
                      ),
              ])))),
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
