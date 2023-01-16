import 'dart:developer';

import 'package:allserve/Screen/Allserve/AllserveHome/ResponseListScreen.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/purchase/purchasePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/AppController.dart';
import 'Logistic/LogisticPage.dart';
import 'RecruitScreen.dart';
import 'Scrap/companyScrapPage.dart';
import 'ScreenAll/ScreenAll.dart';

class AllServeScreen extends StatefulWidget {
  AllServeScreen({Key? key}) : super(key: key);

  @override
  State<AllServeScreen> createState() => _AllServeScreenState();
}

class _AllServeScreenState extends State<AllServeScreen> {
  List<Map<String, dynamic>> listall = [
    {"name": "สรรหาคน", "imgurl": "assets/icons/Recruit.png"},
    {"name": "การขายและการตลาด", "imgurl": "assets/icons/SalesCRM.png"},
    {"name": "จำหน่ายของเสีย", "imgurl": "assets/icons/ScrapEnvironment.png"},
    {"name": "ขนส่ง", "imgurl": "assets/icons/LogisticB.png"}
  ];
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstInstall();
  }

  Future<void> _firstInstall() async {
    await context.read<AppController>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(
      builder: (context, controller, child) {
        context.read<AppController>().user;
        return Scaffold(
          appBar: AppBar(
            title: Text('AllZerve'),
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              print('object');
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "บริการหลักของเรา",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // IconButton(
                            //   onPressed: () {},
                            //   icon: Icon(
                            //     Icons.format_list_bulleted,
                            //     color: Colors.grey,
                            //   ),
                            // ),
                            Stack(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => ResponseListScreen()));
                                  },
                                  icon: Icon(
                                    Icons.notifications,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                Positioned(
                                    right: 8,
                                    top: 6,
                                    child: CircleAvatar(
                                      radius: 8,
                                      backgroundColor: Colors.redAccent,
                                      // child: Center(child: Text('4')),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            'สรรหาคน',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            softWrap: false,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                                return RecruitScreen();
                              })));
                            },
                            child: SizedBox(
                              child: Image.asset(
                                "assets/icons/Recruit.png",
                                //color: Colors.blue,
                                height: 150,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'การขายและการตลาด',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            softWrap: false,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                                return PurchasePage();
                              })));
                            },
                            child: SizedBox(
                              child: Image.asset(
                                "assets/Purchase_512px.png",
                                //color: Colors.blue,
                                height: 150,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            'จำหน่ายของเสีย',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            softWrap: false,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                                return CompanyScrapPage();
                              })));
                            },
                            child: SizedBox(
                              child: Image.asset(
                                "assets/icons/ScrapEnvironment.png",
                                //color: Colors.blue,
                                height: 150,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'ขนส่ง',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            softWrap: false,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                                return LogisticPage();
                              })));
                            },
                            child: SizedBox(
                              child: Image.asset(
                                "assets/icons/LogisticB.png",
                                //color: Colors.blue,
                                height: 150,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => ScreenAll(),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.32,
                              //color: Colors.red,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Center(
                                  child: Text(
                                'เมนูทั้งหมด',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  //   decoration: BoxDecoration(),
                  //   child: Wrap(
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsets.symmetric(
                  //           horizontal: 12,
                  //         ),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.stretch,
                  //           children: [
                  //             Text(
                  //               'สรรหาคน',
                  //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  //               softWrap: false,
                  //               maxLines: 3,
                  //               overflow: TextOverflow.ellipsis,
                  //               textAlign: TextAlign.center,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       InkWell(
                  //         onTap: () {
                  //           Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  //             return RecruitScreen();
                  //           })));
                  //         },
                  //         child: Container(
                  //           width: double.infinity,
                  //           padding: EdgeInsets.symmetric(vertical: 10),
                  //           decoration: BoxDecoration(
                  //             gradient: LinearGradient(
                  //                 colors: [Colors.blue.withOpacity(1), Colors.blueAccent.withOpacity(0.1)],
                  //                 begin: AlignmentDirectional.topStart,
                  //                 //const FractionalOffset(1, 0),
                  //                 end: AlignmentDirectional.bottomEnd,
                  //                 stops: [0.1, 0.9],
                  //                 tileMode: TileMode.clamp),
                  //             borderRadius:
                  //                 BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                  //           ),
                  //           child: Image.asset(
                  //             "assets/icons/ScrapEnvironment.png",
                  //             //color: Colors.blue,
                  //             height: 100,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   padding: EdgeInsets.all(15),
                  //   decoration: BoxDecoration(),
                  //   child: Wrap(
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsets.symmetric(
                  //           horizontal: 12,
                  //         ),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.stretch,
                  //           children: [
                  //             Text(
                  //               'การขายและการตลาด',
                  //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  //               softWrap: false,
                  //               maxLines: 3,
                  //               overflow: TextOverflow.ellipsis,
                  //               textAlign: TextAlign.center,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       InkWell(
                  //         onTap: () {
                  //           Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  //             return PurchasePage();
                  //           })));
                  //         },
                  //         child: Container(
                  //           width: double.infinity,
                  //           padding: EdgeInsets.symmetric(vertical: 10),
                  //           decoration: BoxDecoration(
                  //             gradient: LinearGradient(
                  //                 colors: [Colors.blue.withOpacity(1), Colors.blueAccent.withOpacity(0.1)],
                  //                 begin: AlignmentDirectional.topStart,
                  //                 //const FractionalOffset(1, 0),
                  //                 end: AlignmentDirectional.bottomEnd,
                  //                 stops: [0.1, 0.9],
                  //                 tileMode: TileMode.clamp),
                  //             borderRadius:
                  //                 BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                  //           ),
                  //           child: Image.asset(
                  //             "assets/icons/SalesCRM.png",
                  //             //color: Colors.blue,
                  //             height: 100,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   padding: EdgeInsets.all(15),
                  //   decoration: BoxDecoration(),
                  //   child: Wrap(
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsets.symmetric(
                  //           horizontal: 12,
                  //         ),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.stretch,
                  //           children: [
                  //             Text(
                  //               'จำหน่ายของเสีย',
                  //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  //               softWrap: false,
                  //               maxLines: 3,
                  //               overflow: TextOverflow.ellipsis,
                  //               textAlign: TextAlign.center,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       InkWell(
                  //         onTap: () {
                  //           Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  //             return CompanyScrapPage();
                  //           })));
                  //         },
                  //         child: Container(
                  //           width: double.infinity,
                  //           padding: EdgeInsets.symmetric(vertical: 10),
                  //           decoration: BoxDecoration(
                  //             gradient: LinearGradient(
                  //                 colors: [Colors.blue.withOpacity(1), Colors.blueAccent.withOpacity(0.1)],
                  //                 begin: AlignmentDirectional.topStart,
                  //                 //const FractionalOffset(1, 0),
                  //                 end: AlignmentDirectional.bottomEnd,
                  //                 stops: [0.1, 0.9],
                  //                 tileMode: TileMode.clamp),
                  //             borderRadius:
                  //                 BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                  //           ),
                  //           child: Image.asset(
                  //             "assets/icons/ScrapEnvironment.png",
                  //             //color: Colors.blue,
                  //             height: 100,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   padding: EdgeInsets.all(15),
                  //   decoration: BoxDecoration(),
                  //   child: Wrap(
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsets.symmetric(
                  //           horizontal: 12,
                  //         ),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.stretch,
                  //           children: [
                  //             Text(
                  //               'ขนส่ง',
                  //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  //               softWrap: false,
                  //               maxLines: 3,
                  //               overflow: TextOverflow.ellipsis,
                  //               textAlign: TextAlign.center,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       InkWell(
                  //         onTap: () {
                  //           Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  //             return LogisticPage();
                  //           })));
                  //         },
                  //         child: Container(
                  //           width: double.infinity,
                  //           padding: EdgeInsets.symmetric(vertical: 10),
                  //           decoration: BoxDecoration(
                  //             gradient: LinearGradient(
                  //                 colors: [Colors.blue.withOpacity(1), Colors.blueAccent.withOpacity(0.1)],
                  //                 begin: AlignmentDirectional.topStart,
                  //                 //const FractionalOffset(1, 0),
                  //                 end: AlignmentDirectional.bottomEnd,
                  //                 stops: [0.1, 0.9],
                  //                 tileMode: TileMode.clamp),
                  //             borderRadius:
                  //                 BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                  //           ),
                  //           child: Image.asset(
                  //             "assets/icons/LogisticB.png",
                  //             //color: Colors.blue,
                  //             height: 100,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // MasonryGridView.count(
                  //   primary: false,
                  //   shrinkWrap: true,
                  //   crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 4,
                  //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  //   itemCount: listall.length,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return GridItemWidget(
                  //       data: listall[index],
                  //       press: () {},
                  //     );
                  //   },
                  //   mainAxisSpacing: 15.0,
                  //   crossAxisSpacing: 15.0,
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
