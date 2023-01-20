import 'package:allserve/Screen/Allserve/AllserveHome/Logistic/AddLogistic/AddLogisticPage.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/Logistic/LogisticController.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/Logistic/Quotation/QuotationLogisticPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../appTheme.dart';
import '../../../Widgets/SearchTextField.dart';
import '../../../app/AppController.dart';
import '../AddTransport.dart';
import '../AllServeController.dart';
import '../DetailVendor/DetailVendorPage.dart';
import 'DetailTransport.dart';

class LogisticPage extends StatefulWidget {
  const LogisticPage({super.key});

  @override
  State<LogisticPage> createState() => _LogisticPageState();
}

class _LogisticPageState extends State<LogisticPage> with TickerProviderStateMixin {
  late TabController _tabController;
  final _controller = ScrollController();
  List companydata = [
    // {
    //   "title": "Amazon.com",
    //   "imageUrl": "assets/icons/amazon.png",
    //   "rating": "4.8",
    //   "location": "New york, USA",
    //   "vacancy": "1 Vacancy",
    //   "price": "8,000 - 23,000"
    // },
    {
      "title": "Bank of America",
      "imageUrl": "assets/icons/bankofamerica.png",
      "rating": "4.3",
      "location": "Birmngham, UK",
      "vacancy": "3 Vacancy",
      "price": "18,000 - 35,000"
    },
    {
      "title": "Comcast",
      "imageUrl": "assets/icons/comcast.png",
      "rating": "4.1",
      "location": "Montreal,Quebec",
      "vacancy": "1 Vacancy",
      "price": "28,000 - 45,000"
    },
    {
      "title": "Dell Technologies",
      "imageUrl": "assets/icons/dell.jpeg",
      "rating": "3.9",
      "location": "New york, USA",
      "vacancy": "2 Vacancy",
      "price": "38,000 - 75,000"
    },
    {
      "title": "Emerson Electric",
      "imageUrl": "assets/icons/electric.png",
      "rating": "3.8",
      "location": "Liverpool, UK",
      "vacancy": "0 Vacancy",
      "price": "18,000 - 27,000"
    },
    {
      "title": "FedEx",
      "imageUrl": "assets/icons/finder.png",
      "rating": "2.6",
      "location": "New york, USA",
      "vacancy": "1 Vacancy",
      "price": "15,000 - 35,000"
    },
    {
      "title": "Starbucks",
      "imageUrl": "assets/icons/starbucks.png",
      "rating": "1.7",
      "location": "Toronto,Ontario",
      "vacancy": "1 Vacancy",
      "price": "18,000 - 25,000"
    },
  ];
  @override
  void initState() {
    super.initState();
    _loadItem();
    _tabController = TabController(length: 2, vsync: this);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _loadItem();
      }
    });
  }

  Future _loadItem() async {
    // await context.read<JobController>().loadLogoCompay();
    await context.read<LogisticController>().loadCompanyLogistic();
    final userId = await context.read<AppController>().user!.id;
    await context.read<LogisticController>().detailLogisticCompany(userId!);
  }

  @override
  Widget build(BuildContext context) {
    final appFontSize = AppFontSize.of(context);
    final size = MediaQuery.of(context).size;
    return Consumer2<JobController, LogisticController>(
      builder: (context, controller, controllerLogistic, child) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Logistic',
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
                Tab(text: 'ผู้ให้บริการ'),
                Tab(text: 'รายการขนส่ง'),
                // Tab(text: 'Test'),
              ],
            ),
          ),
          body: SafeArea(
            child: TabBarView(
              controller: _tabController,
              children: [
                //Tab1
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: SearchTextField(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: controllerLogistic.listCompanyLogistic.isEmpty
                            ? Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                controller: _controller,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controllerLogistic.listCompanyLogistic.length + 1,
                                itemBuilder: (_, index) {
                                  if (index < controllerLogistic.listCompanyLogistic.length) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => DetailVendorPage(
                                                        id: controllerLogistic.listCompanyLogistic[index].id!,
                                                      )));
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
                                                //   child: controllerLogistic.listCompanyLogistic[index].image != null
                                                //       ? Image.network(
                                                //           "${controllerLogistic.listCompanyLogistic[index].image}",
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
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          controllerLogistic.listCompanyLogistic[index].name ?? '',
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold, fontSize: appFontSize?.body),
                                                        ),
                                                        SizedBox(height: 5),
                                                        Text(
                                                          'เบอร์โทร ${controllerLogistic.listCompanyLogistic[index].phone ?? ''}',
                                                          style: TextStyle(fontSize: appFontSize?.body2),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                        SizedBox(height: 4),
                                                        Text(
                                                          'อีเมลล์ ${controllerLogistic.listCompanyLogistic[index].email ?? ''} ',
                                                          style: TextStyle(fontSize: appFontSize?.body2),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                        SizedBox(height: 4),
                                                        // Text(
                                                        //   'ลักษณะงาน ${controller.logoCompay[index].type ?? ''}',
                                                        //   style: TextStyle(fontSize: appFontSize?.body2),
                                                        //   // overflow: TextOverflow.ellipsis,
                                                        // ),
                                                        // SizedBox(height: 4),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 30),
                                      child: Center(
                                        child: controllerLogistic.hasmore
                                            ? const CircularProgressIndicator()
                                            : const Text(''),
                                      ),
                                    );
                                  }
                                }),
                      ),
                    ],
                  ),
                ),
                // Tab2
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: size.height * 0.07,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddLogisticPage()));
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Container(
                                    height: size.height * 0.05,
                                    width: size.width * 0.20,
                                    //color: Colors.red,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'เพิ่มรายการ',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 3,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: controllerLogistic.logisticCompanyDetail.isEmpty
                              ? Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  // controller: _controller,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: controllerLogistic.logisticCompanyDetail[0].logistics!.length,
                                  itemBuilder: (_, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => QuotationLogisticPage(
                                                        id: controllerLogistic
                                                            .logisticCompanyDetail[0].logistics![index].id!,
                                                      )));
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
                                                //   child: controller.scrapCompanyDetail[0].scraps![index].image != null
                                                //       ? Image.network(
                                                //           "${controller.scrapCompanyDetail[0].scraps![index].image}",
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
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          controllerLogistic
                                                                  .logisticCompanyDetail[0].logistics![index].name ??
                                                              '',
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold, fontSize: appFontSize?.body),
                                                        ),
                                                        SizedBox(height: 5),
                                                        Text(
                                                          'คำอธืบาย ${controllerLogistic.logisticCompanyDetail[0].logistics![index].description ?? ''}',
                                                          style: TextStyle(fontSize: appFontSize?.body2),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                        SizedBox(height: 4),
                                                        Text(
                                                          'จำนวน ${controllerLogistic.logisticCompanyDetail[0].logistics![index].qty ?? ''} ',
                                                          style: TextStyle(fontSize: appFontSize?.body2),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                        SizedBox(height: 4),
                                                        // Text(
                                                        //   'ลักษณะงาน ${controller.logoCompay[index].type ?? ''}',
                                                        //   style: TextStyle(fontSize: appFontSize?.body2),
                                                        //   // overflow: TextOverflow.ellipsis,
                                                        // ),
                                                        // SizedBox(height: 4),
                                                      ],
                                                    ),
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
                ),
                // //Tab3
                // SingleChildScrollView(
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                //     child: Column(
                //       children: [
                //         SizedBox(
                //           height: size.height * 0.60,
                //           child: Column(
                //             children: [
                //               SizedBox(
                //                 height: size.height * 0.05,
                //               ),
                //               ListTile(
                //                 title: Text('1. ขนส่งสินค้า 200 กิโล'),
                //                 subtitle: Column(
                //                   mainAxisAlignment: MainAxisAlignment.start,
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text('วันที่ 19/08/2565'),
                //                     Text('บริษัท A ขนส่ง จำกัด'),
                //                   ],
                //                 ),
                //                 trailing: IconButton(
                //                     onPressed: () {
                //                       Navigator.push(
                //                           context, MaterialPageRoute(builder: (context) => DetailTransport()));
                //                     },
                //                     icon: Icon(Icons.remove_red_eye)),
                //               ),
                //               Divider(
                //                 thickness: 2,
                //               ),
                //               ListTile(
                //                 title: Text('2. ขนส่งเหล็กเส้น 5000 กิโล'),
                //                 subtitle: Column(
                //                   mainAxisAlignment: MainAxisAlignment.start,
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text('วันที่ 19/08/2565'),
                //                     Text('บริษัท B ขนส่ง จำกัด'),
                //                   ],
                //                 ),
                //                 trailing: IconButton(
                //                     onPressed: () {
                //                       Navigator.push(
                //                           context, MaterialPageRoute(builder: (context) => DetailTransport()));
                //                     },
                //                     icon: Icon(Icons.remove_red_eye)),
                //               ),
                //               Divider(
                //                 thickness: 2,
                //               ),
                //               SizedBox(
                //                 height: size.height * 0.05,
                //               ),
                //             ],
                //           ),
                //         ),
                //         Container(
                //           alignment: Alignment.bottomCenter,
                //           height: size.height * 0.10,
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               InkWell(
                //                 onTap: () {
                //                   Navigator.push(context, MaterialPageRoute(builder: (context) => AddTransport()));
                //                 },
                //                 child: Padding(
                //                   padding: EdgeInsets.symmetric(horizontal: 10),
                //                   child: Container(
                //                     height: size.height * 0.06,
                //                     width: size.width * 0.32,
                //                     //color: Colors.red,
                //                     decoration: BoxDecoration(
                //                       color: Colors.blue,
                //                       borderRadius: BorderRadius.all(Radius.circular(30)),
                //                     ),
                //                     child: Center(
                //                         child: Text(
                //                       'เพิ่มรายการ',
                //                       style: TextStyle(color: Colors.white),
                //                     )),
                //                   ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
