import 'dart:developer';

import 'package:allserve/Screen/Allserve/AllserveHome/purchase/purchaseController.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/purchase/purchaseService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Models/addService.dart';
import '../../../../../Models/imagesCpmpanie/imagesPurchase.dart';
import '../../../../../appTheme.dart';
import '../../../../Widgets/ButtonRounded.dart';
import '../../../../Widgets/LoadingDialog.dart';
import '../../ApproveQuotation/ApproveQuotationPage.dart';

class QuotationPurchasePage extends StatefulWidget {
  QuotationPurchasePage({super.key, required this.id, this.images});
  final int id;
  final List<ImagesPurchase>? images;

  @override
  State<QuotationPurchasePage> createState() => _QuotationPurchasePageState();
}

class _QuotationPurchasePageState extends State<QuotationPurchasePage> with TickerProviderStateMixin {
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
    inspect(widget.images);
    print(widget.id);
  }

  Future _loadItem() async {
    await context.read<PurchaseController>().detailQuotationPurchase(widget.id);
    await context.read<PurchaseController>().loadDetailVendorPurchase();
    // Purchase
    final allpurchase = context.read<PurchaseController>().detailPurchase;
    final vendorpurchase = context.read<PurchaseController>().quotationPurchaseDetail!.services;
    final purchaseselected = vendorpurchase!.where((element) => allpurchase.contains(element.service_id));
    for (var purchaseDetail in vendorpurchase) {
      for (var purchase in allpurchase) {
        print("${purchaseDetail.service_id} = ${purchase.id}");
        if (purchaseDetail.service_id == purchase.id.toString()) {
          final datapurchase = AddService(service_type: 'purchase', service_id: int.parse(purchaseDetail.service_id!));
          setState(() {
            purchase.isChecked = true;
            ListChacked.add(datapurchase);
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
    return Consumer<PurchaseController>(
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
                controller.quotationPurchaseDetail == null
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
                                              physics: NeverScrollableScrollPhysics(),
                                              // controller: _controller,
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
                                      Text(controller.quotationPurchaseDetail?.name ?? ' ',
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('คำอธิบาย: ${controller.quotationPurchaseDetail?.description ?? ' '}',
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('จำนวน: ${controller.quotationPurchaseDetail?.qty ?? ' '}',
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
                              child: controller.detailPurchase.isEmpty
                                  ? Center(child: CircularProgressIndicator())
                                  : ListView.builder(
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
                                            final dataPurchase = AddService(
                                                service_id: controller.detailPurchase[index].id!,
                                                service_type: 'purchase');
                                            setState(() {
                                              controller.detailPurchase[index].isChecked = value!;
                                              print(controller.detailPurchase[index].isChecked);
                                              if (value) {
                                                // 'รถกระบะ';
                                                ListChacked.add(dataPurchase);
                                                inspect(ListChacked);
                                              } else {
                                                // ListChacked.remove(controller.detailPurchase[index].name!);
                                                ListChacked.removeWhere(
                                                  (element) =>
                                                      element.service_id == dataPurchase.service_id &&
                                                      element.service_type == 'purchase',
                                                );
                                                inspect(ListChacked);
                                              }
                                            });
                                          },
                                          title: Text(controller.detailPurchase[index].name!),
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
                                              await PurchaseSrevice().setServiceOrder(
                                                order_id: widget.id,
                                                order_type: 'purchase',
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
                controller.quotationPurchaseDetail == null
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(15),
                              child: controller.quotationPurchaseDetail?.qoutations?.isEmpty ?? true
                                  ? SizedBox.shrink()
                                  : ListView.builder(
                                      controller: _controller,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: controller.quotationPurchaseDetail!.qoutations!.length,
                                      itemBuilder: (_, index) {
                                        // if (index < controller.quotationPurchaseDetail!.qoutations!.length) {
                                        return Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                return ApproveQuotationPage(
                                                  page: 'Purchase',
                                                  id: controller.quotationPurchaseDetail!.qoutations![index].id!,
                                                  // company: controller
                                                  //     .quotationPurchaseDetail!.qoutations![index].vendor![index].name!,
                                                  titer: controller.quotationPurchaseDetail!.qoutations![index].title!,
                                                  remark:
                                                      controller.quotationPurchaseDetail!.qoutations![index].remark!,
                                                  file: controller.quotationPurchaseDetail!.qoutations![index].path!,
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
                                                    //   child: controller.quotationPurchaseDetail!.qoutations![index].image != null
                                                    //       ? Image.network(
                                                    //           "${controller.quotationPurchaseDetail!.qoutations![index].image}",
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
                                                          // controller.quotationPurchaseDetail!.qoutations![index].vendor!
                                                          //             .isEmpty &&
                                                          //         controller.quotationPurchaseDetail?.qoutations?[index]
                                                          //                 .vendor ==
                                                          //             null
                                                          //     ? SizedBox.shrink()
                                                          //     : Text(
                                                          //         "บริษัท:${controller.quotationPurchaseDetail?.qoutations?[index].vendor?[index].name}",
                                                          //         style: TextStyle(
                                                          //             fontWeight: FontWeight.bold,
                                                          //             fontSize: appFontSize?.body),
                                                          //         overflow: TextOverflow.fade,
                                                          //         maxLines: 5,
                                                          //       ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    controller.quotationPurchaseDetail!
                                                                            .qoutations![index].title ??
                                                                        '',
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: appFontSize?.body),
                                                                  ),
                                                                  Text(
                                                                    controller.quotationPurchaseDetail!
                                                                            .qoutations![index].remark ??
                                                                        '',
                                                                    style: TextStyle(fontSize: appFontSize?.body2),
                                                                    overflow: TextOverflow.ellipsis,
                                                                  ),
                                                                  SizedBox(height: 4),
                                                                  // Center(child: buildFille(path)),
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text('ดาวน์โหลด'),
                                                                      InkWell(
                                                                          onTap: () {
                                                                            final url = controller
                                                                                .quotationPurchaseDetail!
                                                                                .qoutations![index]
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
}
