import 'package:allserve/Models/imagesCpmpanie/imagesLogistic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../appTheme.dart';
import '../Logistic/LogisticController.dart';

class ScceedQuotationLogistic extends StatefulWidget {
  ScceedQuotationLogistic({super.key, required this.id, this.images});
  final int id;
  List<ImagesLogistic>? images;

  @override
  State<ScceedQuotationLogistic> createState() => _ScceedQuotationLogisticState();
}

class _ScceedQuotationLogisticState extends State<ScceedQuotationLogistic> with TickerProviderStateMixin {
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
                                          // ? Center(child: CircularProgressIndicator())
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
                                ))
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
                              child: controller.quotationDetailLogistic?.qoutations?.isEmpty ?? true
                                  ? SizedBox.shrink()
                                  : ListView.builder(
                                      controller: _controller,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: controller.quotationDetailLogistic!.qoutations!.length,
                                      itemBuilder: (_, index) {
                                        return controller.quotationDetailLogistic?.qoutations?[index].status !=
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
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              children: [
                                                                // Text(
                                                                //   "บริษัท:${controller.quotationDetailLogistic?.qoutations?[index].vendor?[index].name ?? ''}",
                                                                //   style: TextStyle(
                                                                //       fontWeight: FontWeight.bold, fontSize: 20),
                                                                //   overflow: TextOverflow.fade,
                                                                //   maxLines: 5,
                                                                // ),
                                                                Text(
                                                                  controller.quotationDetailLogistic!.qoutations![index]
                                                                          .title ??
                                                                      '',
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.bold, fontSize: 20),
                                                                ),
                                                                Text(
                                                                  controller.quotationDetailLogistic!.qoutations![index]
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
                                                                              .quotationDetailLogistic!
                                                                              .qoutations![index]
                                                                              .path;

                                                                          openBrowserURL(url: url!, inApp: false);
                                                                        },
                                                                        child: Icon(
                                                                          Icons.file_open,
                                                                          size: 100,
                                                                        )),
                                                                  ],
                                                                ),

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
