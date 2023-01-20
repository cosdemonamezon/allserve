import 'package:allserve/Screen/Allserve/AllserveHome/Logistic/LogisticController.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../appTheme.dart';

class QuotationLogisticPage extends StatefulWidget {
  const QuotationLogisticPage({super.key, required this.id});
  final int id;

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
  }

  Future _loadItem() async {
    await context.read<LogisticController>().detailQuotation(widget.id);
  }

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
                                Text(controller.quotationDetail?.name ?? ' ',
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('คำอธิบาย: ${controller.quotationDetail?.description ?? ' '}',
                                    style: TextStyle(
                                      fontSize: 15,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('จำนวน: ${controller.quotationDetail?.qty ?? ' '}',
                                    style: TextStyle(
                                      fontSize: 15,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('สถานที่รับ: ${controller.quotationDetail?.start_location ?? ' '}',
                                    style: TextStyle(
                                      fontSize: 15,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('สถานที่ส่ง: ${controller.quotationDetail?.end_location ?? ' '}',
                                    style: TextStyle(
                                      fontSize: 15,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('ประเภทของรถ: ${controller.quotationDetail?.transport_type ?? ' '}',
                                    style: TextStyle(
                                      fontSize: 15,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('ความกว้าง: ${controller.quotationDetail?.width ?? ' '}',
                                    style: TextStyle(
                                      fontSize: 15,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('ความสูง: ${controller.quotationDetail?.height ?? ' '}',
                                    style: TextStyle(
                                      fontSize: 15,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('น้ำหนัก: ${controller.quotationDetail?.weight ?? ' '}',
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
                        child: controller.quotationDetail?.quotations?.isEmpty ?? true
                            ? Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                controller: _controller,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.quotationDetail!.quotations!.length,
                                itemBuilder: (_, index) {
                                  // final String? selectedFile = controller.quotationDetail!.quotations![index].path;
                                  // final File path = selectedFile as File;
                                  // if (index < controller.quotationDetail!.quotations!.length) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) => DetailVendorPage(
                                        //               id: controller.quotationDetail!.quotations![index].id!,
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
                                              //   child: controller.quotationDetail!.quotations![index].image != null
                                              //       ? Image.network(
                                              //           "${controller.quotationDetail!.quotations![index].image}",
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
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              controller.quotationDetail!.quotations![index].title ??
                                                                  '',
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: appFontSize?.body),
                                                            ),
                                                            Text(
                                                              controller.quotationDetail!.quotations![index].remark ??
                                                                  '',
                                                              style: TextStyle(fontSize: appFontSize?.body2),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                            SizedBox(height: 4),
                                                            // Center(child: buildFille(path)),
                                                            InkWell(
                                                                onTap: () {
                                                                  final url = controller
                                                                      .quotationDetail!.quotations![index].path;

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
                                                          onTap: () async {
                                                            // final result2 =
                                                            await showCupertinoDialog<bool>(
                                                              context: context,
                                                              builder: (context) {
                                                                return CupertinoAlertDialog(
                                                                  title: Text(
                                                                    'ยืนยัน',
                                                                  ),
                                                                  content: Text(
                                                                    'ยืนยันรับใบเสนอราคา',
                                                                  ),
                                                                  actions: [
                                                                    CupertinoDialogAction(
                                                                        child: Text(
                                                                          'ยืนยัน',
                                                                        ),
                                                                        onPressed: () async {}),
                                                                    CupertinoDialogAction(
                                                                      child: Text(
                                                                        'ยกเลิก',
                                                                      ),
                                                                      onPressed: () => Navigator.pop(context, false),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                            // if (result2 == true) {
                                                            //   setState(() {
                                                            //     controller.meetings[i].isAccept = true;
                                                            //   });
                                                            //   print(controller.meetings[i].isAccept);
                                                            // }
                                                          },
                                                          child: Container(
                                                            width: MediaQuery.of(context).size.width * 0.18,
                                                            height: MediaQuery.of(context).size.height * 0.1,
                                                            decoration: BoxDecoration(
                                                              color: Colors.blue,
                                                              borderRadius: BorderRadius.circular(20),
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  'Accept',
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.bold, fontSize: 15),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        )
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
