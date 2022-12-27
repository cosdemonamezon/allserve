import 'package:flutter/material.dart';

import '../../../../appTheme.dart';
import '../../../Alljob/Companies/Widgets/CompaniesList.dart';
import '../../../Widgets/SearchTextField.dart';
import '../../About/AboutScreen.dart';
import '../AddTransport.dart';
import 'DetailTransport.dart';

class LogisticPage extends StatefulWidget {
  const LogisticPage({super.key});

  @override
  State<LogisticPage> createState() => _LogisticPageState();
}

class _LogisticPageState extends State<LogisticPage> with TickerProviderStateMixin {
  late TabController _tabController;
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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final appFontSize = AppFontSize.of(context);
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
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
              Tab(text: 'รายชื่อบริษัท'),
              Tab(text: 'ผู้ให้บริการ'),
              Tab(text: 'รายการขนส่ง'),
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
              //Tab2
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: SearchTextField(),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      ListTile(
                        title: Text('1. บริษัท A ขนส่ง'),
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
                            },
                            icon: Icon(Icons.remove_red_eye)),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      ListTile(
                        title: Text('2. บริษัท B ขนส่ง'),
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
                            },
                            icon: Icon(Icons.remove_red_eye)),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      ListTile(
                        title: Text('3. บริษัท C ขนส่ง'),
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
                            },
                            icon: Icon(Icons.remove_red_eye)),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      ListTile(
                        title: Text('4. บริษัท D ขนส่ง'),
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
                            },
                            icon: Icon(Icons.remove_red_eye)),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      ListTile(
                        title: Text('5. บริษัท E ขนส่ง'),
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
                            },
                            icon: Icon(Icons.remove_red_eye)),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                    ],
                  ),
                ),
              ),
              //Tab3
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.70,
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            ListTile(
                              title: Text('1. ขนส่งสินค้า 200 กิโล'),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('วันที่ 19/08/2565'),
                                  Text('บริษัท A ขนส่ง จำกัด'),
                                ],
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailTransport()));
                                  },
                                  icon: Icon(Icons.remove_red_eye)),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            ListTile(
                              title: Text('2. ขนส่งเหล็กเส้น 5000 กิโล'),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('วันที่ 19/08/2565'),
                                  Text('บริษัท B ขนส่ง จำกัด'),
                                ],
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailTransport()));
                                  },
                                  icon: Icon(Icons.remove_red_eye)),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: size.height * 0.10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AddTransport()));
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: size.height * 0.06,
                                  width: size.width * 0.32,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
