import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../appTheme.dart';
import '../Scrap/ScrapController.dart';

class ScceedQuotationScrap extends StatefulWidget {
  const ScceedQuotationScrap({super.key, required this.id});
  final int id;

  @override
  State<ScceedQuotationScrap> createState() => _ScceedQuotationScrapState();
}

class _ScceedQuotationScrapState extends State<ScceedQuotationScrap> with TickerProviderStateMixin {
  late TabController _tabController;
  final _controller = ScrollController();
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
    await context.read<ScrapController>().detailScrapQuotation(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final appFontSize = AppFontSize.of(context);
    final size = MediaQuery.of(context).size;
    return Consumer<ScrapController>(
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
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Image.asset(
                              'assets/No_Image_Available.jpg',
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.fill,
                            ),
                            Divider(
                              thickness: 3,
                            ),
                            Text(controller.quotationScrapDetail?.name ?? '',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Text('คำอธิบาย: ${controller.quotationScrapDetail?.description ?? ' '}',
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text('จำนวน: ${controller.quotationScrapDetail?.qty ?? ' '}',
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                          ]),
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
                      child: controller.quotationScrapDetail?.quotations?.isEmpty ?? true
                          ? SizedBox.shrink()
                          : ListView.builder(
                              controller: _controller,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.quotationScrapDetail!.quotations!.length,
                              itemBuilder: (_, index) {
                                return controller.quotationScrapDetail?.quotations?[index].status != 'Approve'
                                    ? SizedBox.shrink()
                                    : Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: GestureDetector(
                                          onTap: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) => DetailVendorPage(
                                            //               id: controller.quotationScrapDetail!.quotations![index].id!,
                                            //             )));
                                          },
                                          child: Container(
                                            width: size.width,
                                            height: 300,
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
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
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

                                                  Expanded(
                                                    flex: 8,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                        Text(
                                                          "บริษัท:${controller.quotationScrapDetail?.quotations?[index].parther?.name ?? ''}",
                                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                                          overflow: TextOverflow.fade,
                                                          maxLines: 5,
                                                        ),
                                                        Text(
                                                          controller.quotationScrapDetail!.quotations![index].title ??
                                                              '',
                                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                                        ),
                                                        Text(
                                                          controller.quotationScrapDetail!.quotations![index].remark ??
                                                              '',
                                                          style: TextStyle(fontSize: 15),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                        SizedBox(height: 4),
                                                        // Center(child: buildFille(path)),
                                                        InkWell(
                                                            onTap: () {
                                                              final url = controller
                                                                  .quotationScrapDetail!.quotations![index].path;

                                                              openBrowserURL(url: url!, inApp: true);
                                                            },
                                                            child: Icon(
                                                              Icons.file_open,
                                                              size: 100,
                                                            )),
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
                              }),
                    ),
                  ],
                ),
              ),
            ]))),
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
