import 'package:allserve/Screen/Allserve/AllserveHome/Scrap/AddScrap/AddScrapPage.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/Scrap/Quotation/QuotationScrapPage.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/Scrap/ScrapController.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../appTheme.dart';
import '../../../Alljob/Companies/Widgets/CompaniesList.dart';
import '../../../Login/Widgets/AppTextForm.dart';
import '../../../Widgets/SearchTextField.dart';
import '../../../app/AppController.dart';
import '../AllServeController.dart';
import '../DetailVendor/DetailVendorPage.dart';
import 'DetailScrap/detailScrapPage.dart';
import 'ScrapDetailScreen.dart';

class CompanyScrapPage extends StatefulWidget {
  const CompanyScrapPage({super.key});

  @override
  State<CompanyScrapPage> createState() => _CompanyScrapPageState();
}

class _CompanyScrapPageState extends State<CompanyScrapPage> with TickerProviderStateMixin {
  late TabController _tabController;
  final _controller = ScrollController();
  int a = 1;
  FilePickerResult? result;
  PlatformFile? file;
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
      if (_controller.position.maxScrollExtent == _controller.offset) {
        _loadItem();
      }
    });
  }

  Future _loadItem() async {
    // await context.read<ScrapController>().loadScrap();
    await context.read<ScrapController>().loadCompanyScrap();
    final userId = await context.read<AppController>().user!.id;
    await context.read<ScrapController>().detailScrapCompany(userId!);
  }

  // @override
  // void dispose() {
  //   _loadItem();
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final appFontSize = AppFontSize.of(context);
    final size = MediaQuery.of(context).size;
    return Consumer2<JobController, ScrapController>(
      builder: (context, controller, controllerScrap, child) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Scrap',
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
                Tab(text: 'รายชื่อบริษัท'),
                Tab(text: 'รายการของเสีย'),
                // Tab(text: 'เพิ่มรายการเสีย'),
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
                          child: controllerScrap.listCompanyScrap.isEmpty
                              ? Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  physics: NeverScrollableScrollPhysics(),
                                  controller: _controller,
                                  itemCount: controllerScrap.listCompanyScrap.length + 1,
                                  itemBuilder: (_, index) {
                                    if (index < controllerScrap.listCompanyScrap.length) {
                                      return Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => DetailVendorPage(
                                                          id: controllerScrap.listCompanyScrap[index].id!,
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
                                                  //   child: controllerScrap.listCompanyScrap[index].image != null
                                                  //       ? Image.network(
                                                  //           "${controllerScrap.listCompanyScrap[index].image}",
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
                                                            controllerScrap.listCompanyScrap[index].name ?? '',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: appFontSize?.body),
                                                          ),
                                                          SizedBox(height: 5),
                                                          Text(
                                                            'เบอร์โทร ${controllerScrap.listCompanyScrap[index].phone ?? ''}',
                                                            style: TextStyle(fontSize: appFontSize?.body2),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                          SizedBox(height: 4),
                                                          Text(
                                                            'อีเมลล์ ${controllerScrap.listCompanyScrap[index].email ?? ''} ',
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
                                          child: controllerScrap.hasmore
                                              ? const CircularProgressIndicator()
                                              : const Text(''),
                                        ),
                                      );
                                    }
                                  })),
                    ],
                  ),
                ),
                //Tab2
                SingleChildScrollView(
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
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: size.height * 0.07,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AddScrapPage()));
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
                        child: controllerScrap.scrapCompanyDetail.isEmpty
                            ? Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                // controller: _controller,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controllerScrap.scrapCompanyDetail[0].scraps!.length,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => QuotationScrapPage(
                                                      id: controllerScrap.scrapCompanyDetail[0].scraps![index].id!,
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
                                                        controllerScrap.scrapCompanyDetail[0].scraps![index].name ?? '',
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold, fontSize: appFontSize?.body),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text(
                                                        'คำอธืบาย ${controllerScrap.scrapCompanyDetail[0].scraps![index].description ?? ''}',
                                                        style: TextStyle(fontSize: appFontSize?.body2),
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                      SizedBox(height: 4),
                                                      Text(
                                                        'จำนวน ${controllerScrap.scrapCompanyDetail[0].scraps![index].qty ?? ''} ',
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
                // //Tab3
                // SingleChildScrollView(
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         SizedBox(
                //           height: size.height * 0.03,
                //         ),
                //         ListView(
                //           shrinkWrap: true,
                //           scrollDirection: Axis.vertical,
                //           physics: const ClampingScrollPhysics(),
                //           children: List.generate(
                //               a,
                //               (index) => Padding(
                //                     padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                //                     child: Card(
                //                       margin: EdgeInsets.zero,
                //                       elevation: 0,
                //                       color: Colors.white,
                //                       shape: RoundedRectangleBorder(
                //                         side: BorderSide(
                //                           color: Color(0xFFF3F3F3),
                //                           width: 2.0,
                //                         ),
                //                         borderRadius: BorderRadius.circular(8),
                //                       ),
                //                       child: Padding(
                //                         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                //                         child: Column(
                //                           children: [
                //                             Row(
                //                               children: [
                //                                 Text('${index + 1}.'),
                //                               ],
                //                             ),
                //                             SizedBox(
                //                               height: size.height * 0.01,
                //                             ),
                //                             Row(
                //                               children: [
                //                                 Text('ชื่อสินค้า'),
                //                               ],
                //                             ),
                //                             SizedBox(
                //                               height: size.height * 0.01,
                //                             ),
                //                             AppTextForm(
                //                               hintText: 'ใส่ชื่อสินค้า',
                //                             ),
                //                             SizedBox(
                //                               height: size.height * 0.01,
                //                             ),
                //                             Row(
                //                               children: [
                //                                 Text('จำนวน'),
                //                               ],
                //                             ),
                //                             SizedBox(
                //                               height: size.height * 0.01,
                //                             ),
                //                             AppTextForm(
                //                               hintText: '',
                //                             ),
                //                             SizedBox(
                //                               height: size.height * 0.01,
                //                             ),
                //                             Row(
                //                               children: [
                //                                 Text('รูป'),
                //                               ],
                //                             ),
                //                             SizedBox(
                //                               height: size.height * 0.01,
                //                             ),
                //                             Container(
                //                               height: size.height * 0.05,
                //                               width: size.width,
                //                               color:
                //                                   file != null ? Colors.blueAccent : Color.fromARGB(255, 124, 124, 124),
                //                               child: InkWell(
                //                                 onTap: () async {
                //                                   result = await FilePicker.platform.pickFiles();
                //                                   setState(() {
                //                                     if (result != null) {
                //                                       file = result!.files.first;
                //                                       print(file);
                //                                     } else {
                //                                       print('No file');
                //                                     }
                //                                   });
                //                                 },
                //                                 child: Center(
                //                                     child: Text(
                //                                   'อัพโหลด',
                //                                   style: TextStyle(color: Colors.white),
                //                                 )),
                //                               ),
                //                             ),
                //                             SizedBox(
                //                               height: size.height * 0.02,
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                     ),
                //                   )),
                //         ),
                //         SizedBox(
                //           height: size.height * 0.02,
                //         ),
                //         InkWell(
                //           onTap: () {
                //             setState(() {
                //               a = a + 1;
                //             });
                //           },
                //           child: Container(
                //             height: 40,
                //             width: 40,
                //             decoration: BoxDecoration(
                //               color: Colors.grey,
                //               borderRadius: BorderRadius.all(Radius.circular(30)),
                //             ),
                //             child: Center(child: Icon(Icons.plus_one)),
                //           ),
                //         ),
                //         SizedBox(
                //           height: size.height * 0.1,
                //         ),
                //         SizedBox(
                //           height: size.height * 0.10,
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               InkWell(
                //                 onTap: () {
                //                   Navigator.push(context, MaterialPageRoute(builder: (context) => ScrapDetailScreen()));
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
                //                       'ยืนยัน',
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
