import 'package:allserve/Screen/Allserve/AllserveHome/purchase/purchaseController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../appTheme.dart';
import '../../../Alljob/Companies/Widgets/CompaniesList.dart';
import '../../../Widgets/SearchTextField.dart';
import '../AllServeController.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({super.key});

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> with TickerProviderStateMixin {
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
    await context.read<PurchaseController>().loadCompanyPurchase();
  }

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
              'Purchase',
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
                Tab(text: 'รายการ'),
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
                        child: controller.listCompanyPurchase.isEmpty
                            ? Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                controller: _controller,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.listCompanyPurchase.length + 1,
                                itemBuilder: (_, index) {
                                  if (index < controller.listCompanyPurchase.length) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) => DetailCompany(
                                          //               id: controller.logoCompay[index].id!,
                                          //               name: controller.logoCompay[index].name!,
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
                                                Expanded(
                                                  flex: 2,
                                                  child: controller.listCompanyPurchase[index].image != null
                                                      ? Image.network(
                                                          "${controller.listCompanyPurchase[index].image}",
                                                          height: size.height / 17,
                                                          errorBuilder: (context, error, stackTrace) =>
                                                              Image.asset('assets/No_Image_Available.jpg'),
                                                        )
                                                      : Image.asset('assets/No_Image_Available.jpg'),
                                                ),
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
                                                          controller.listCompanyPurchase[index].name ?? '',
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold, fontSize: appFontSize?.body),
                                                        ),
                                                        SizedBox(height: 5),
                                                        Text(
                                                          'เบอร์โทร ${controller.listCompanyPurchase[index].phone ?? ''}',
                                                          style: TextStyle(fontSize: appFontSize?.body2),
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                        SizedBox(height: 4),
                                                        Text(
                                                          'อีเมลล์ ${controller.listCompanyPurchase[index].email ?? ''} ',
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
                                        child: controller.hasmore ? const CircularProgressIndicator() : const Text(''),
                                      ),
                                    );
                                  }
                                }),
                      ),
                    ],
                  ),
                ),
                //Tab2
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                        // Container(
                        //   padding: EdgeInsets.all(15),
                        //   child: ListView.builder(
                        //       // controller: _controller,
                        //       shrinkWrap: true,
                        //       scrollDirection: Axis.vertical,
                        //       physics: NeverScrollableScrollPhysics(),
                        //       itemCount: controller.logoCompay.length,
                        //       itemBuilder: (_, index) {
                        //         return Padding(
                        //           padding: const EdgeInsets.all(5),
                        //           child: GestureDetector(
                        //             onTap: () {
                        //               Navigator.push(
                        //                   context,
                        //                   MaterialPageRoute(
                        //                       builder: (context) => DetailCompany(
                        //                             id: controller.logoCompay[index].id!,
                        //                             name: controller.logoCompay[index].name!,
                        //                           )));
                        //             },
                        //             child: Container(
                        //               width: size.width,
                        //               decoration: BoxDecoration(
                        //                 image: DecorationImage(
                        //                   image: AssetImage('assets/images/promotionBG.png'),
                        //                   fit: BoxFit.fill,
                        //                 ),
                        //                 boxShadow: const [
                        //                   BoxShadow(offset: Offset(0, 2), color: Color.fromRGBO(0, 78, 179, 0.05), blurRadius: 10)
                        //                 ],
                        //               ),
                        //               child: Padding(
                        //                 padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        //                 child: Row(
                        //                   children: [
                        //                     Expanded(
                        //                         flex: 2,
                        //                         child: Image.network(
                        //                           "${controller.logoCompay[index].image}",
                        //                           height: size.height / 17,
                        //                           errorBuilder: (context, error, stackTrace) =>
                        //                               Image.asset('assets/images/No_Image_Available.jpg'),
                        //                         )
                        //                         // : Image.asset(
                        //                         //     'assets/images/No_Image_Available.jpg'),
                        //                         ),
                        //                     SizedBox(
                        //                       width: 10,
                        //                     ),
                        //                     Expanded(
                        //                       flex: 8,
                        //                       child: Padding(
                        //                         padding: const EdgeInsets.symmetric(horizontal: 5),
                        //                         child: Column(
                        //                           crossAxisAlignment: CrossAxisAlignment.start,
                        //                           children: [
                        //                             Text(
                        //                               controller.logoCompay[index].name ?? '',
                        //                               style: TextStyle(fontWeight: FontWeight.bold, fontSize: appFontSize?.body),
                        //                             ),
                        //                             SizedBox(height: 5),
                        //                             Text(
                        //                               'เบอร์โทรศัพท์ ${controller.logoCompay[index].phone ?? ''}',
                        //                               style: TextStyle(fontSize: appFontSize?.body2),
                        //                               overflow: TextOverflow.ellipsis,
                        //                             ),
                        //                             SizedBox(height: 4),
                        //                             Text(
                        //                               'อีเมลล์ ${controller.logoCompay[index].email ?? ''} ',
                        //                               style: TextStyle(fontSize: appFontSize?.body2),
                        //                               overflow: TextOverflow.ellipsis,
                        //                             ),
                        //                             SizedBox(height: 4),
                        //                             // Text(
                        //                             //   'ลักษณะงาน ${controller.logoCompay[index].type ?? ''}',
                        //                             //   style: TextStyle(fontSize: appFontSize?.body2),
                        //                             //   // overflow: TextOverflow.ellipsis,
                        //                             // ),
                        //                             // SizedBox(height: 4),
                        //                           ],
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         );
                        //       }),
                        // ),
                        ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: companydata
                              .map((data) => CompaniesList(
                                    companydata: data,
                                    use: true,
                                    press: () {
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => JobCompanyScreen()));
                                    },
                                  ))
                              .toList(),
                        )
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
  }
}
