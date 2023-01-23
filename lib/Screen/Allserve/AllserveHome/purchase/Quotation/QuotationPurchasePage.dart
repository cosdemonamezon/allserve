import 'package:allserve/Screen/Allserve/AllserveHome/purchase/purchaseController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../appTheme.dart';
import '../../ApproveQuotation/ApproveQuotationPage.dart';

class QuotationPurchasePage extends StatefulWidget {
  const QuotationPurchasePage({super.key, required this.id});
  final int id;

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
    print(widget.id);
  }

  Future _loadItem() async {
    await context.read<PurchaseController>().detailQuotationPurchase(widget.id);
  }

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
                SingleChildScrollView(
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
                                Image.asset(
                                  'assets/No_Image_Available.jpg',
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.fill,
                                ),
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
                          ))
                    ],
                  ),
                ),
                //Tap2
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: controller.quotationPurchaseDetail?.quotations?.isEmpty ?? true
                            ? SizedBox.shrink()
                            : ListView.builder(
                                controller: _controller,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.quotationPurchaseDetail!.quotations!.length,
                                itemBuilder: (_, index) {
                                  // if (index < controller.quotationPurchaseDetail!.quotations!.length) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) => DetailVendorPage(
                                        //               id: controller.quotationPurchaseDetail!.quotations![index].id!,
                                        //             )));
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
                                              //   child: controller.quotationPurchaseDetail!.quotations![index].image != null
                                              //       ? Image.network(
                                              //           "${controller.quotationPurchaseDetail!.quotations![index].image}",
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
                                                      "บริษัท:${controller.quotationPurchaseDetail?.quotations?[index].parther?.name ?? ''}",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold, fontSize: appFontSize?.body),
                                                      overflow: TextOverflow.fade,
                                                      maxLines: 5,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              controller.quotationPurchaseDetail!.quotations![index]
                                                                      .title ??
                                                                  '',
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: appFontSize?.body),
                                                            ),
                                                            Text(
                                                              controller.quotationPurchaseDetail!.quotations![index]
                                                                      .remark ??
                                                                  '',
                                                              style: TextStyle(fontSize: appFontSize?.body2),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                            SizedBox(height: 4),
                                                            // Center(child: buildFille(path)),
                                                            InkWell(
                                                                onTap: () {
                                                                  final url = controller
                                                                      .quotationPurchaseDetail!.quotations![index].path;

                                                                  openBrowserURL(url: url!, inApp: true);
                                                                },
                                                                child: Icon(Icons.file_open)),
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
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.push(context,
                                                                MaterialPageRoute(builder: (context) {
                                                              return ApproveQuotationPage(
                                                                page: 'Purchase',
                                                                id: controller
                                                                    .quotationPurchaseDetail!.quotations![index].id!,
                                                                company: controller.quotationPurchaseDetail!
                                                                    .quotations![index].parther!.name!,
                                                                titer: controller
                                                                    .quotationPurchaseDetail!.quotations![index].title!,
                                                                remark: controller.quotationPurchaseDetail!
                                                                    .quotations![index].remark!,
                                                                file: controller
                                                                    .quotationPurchaseDetail!.quotations![index].path!,
                                                              );
                                                            }));
                                                          },
                                                          child: Container(
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
