import 'package:allserve/Models/imagesCpmpanie/imagesPurchase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../appTheme.dart';
import '../purchase/purchaseController.dart';

class ScceedQuotationPurchae extends StatefulWidget {
  ScceedQuotationPurchae({super.key, required this.id, this.images});
  final int id;
  List<ImagesPurchase>? images;

  @override
  State<ScceedQuotationPurchae> createState() => _ScceedQuotationPurchaeState();
}

class _ScceedQuotationPurchaeState extends State<ScceedQuotationPurchae> with TickerProviderStateMixin {
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
                  'สำเร็จ',
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
                                          // ? Image.asset('assets/No_Image_Available.jpg')
                                          ? Center(child: CircularProgressIndicator())
                                          : GridView.builder(
                                              shrinkWrap: true,
                                              // controller: _controller,
                                              padding: EdgeInsets.all(15),
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
                                ))
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
                              child: controller.quotationPurchaseDetail?.quotations?.isEmpty ?? true
                                  ? SizedBox.shrink()
                                  : ListView.builder(
                                      controller: _controller,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: controller.quotationPurchaseDetail!.quotations!.length,
                                      itemBuilder: (_, index) {
                                        return controller.quotationPurchaseDetail?.quotations?[index].status !=
                                                'Approve'
                                            ? SizedBox.shrink()
                                            : Padding(
                                                padding: const EdgeInsets.all(5),
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    width: size.width,
                                                    height: 350,
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
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Expanded(
                                                            flex: 8,
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  "บริษัท:${controller.quotationPurchaseDetail?.quotations?[index].parther?.name ?? ''}",
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.bold, fontSize: 20),
                                                                  overflow: TextOverflow.fade,
                                                                  maxLines: 5,
                                                                ),

                                                                Text(
                                                                  controller.quotationPurchaseDetail!.quotations![index]
                                                                          .title ??
                                                                      '',
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.bold, fontSize: 20),
                                                                ),
                                                                Text(
                                                                  controller.quotationPurchaseDetail!.quotations![index]
                                                                          .remark ??
                                                                      '',
                                                                  style: TextStyle(fontSize: 15),
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
                                                                              .quotationPurchaseDetail!
                                                                              .quotations![index]
                                                                              .path;

                                                                          openBrowserURL(url: url!, inApp: false);
                                                                        },
                                                                        child: Icon(
                                                                          Icons.file_open,
                                                                          size: 100,
                                                                        )),
                                                                  ],
                                                                ),
                                                                // Text(
                                                                //   selectedFile!,
                                                                //   style: TextStyle(fontSize: appFontSize?.body2),
                                                                //   overflow: TextOverflow.ellipsis,
                                                                // ),
                                                                SizedBox(height: 4),
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
