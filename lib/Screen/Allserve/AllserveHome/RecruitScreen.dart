import 'package:allserve/Screen/Allserve/AllserveHome/AddJobScreen.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/AddRecruitScreen.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/DetailRecruit.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/Widgets/PeopleWidget.dart';
import 'package:allserve/Screen/Widgets/SearchTextField.dart';
import 'package:flutter/material.dart';

class RecruitScreen extends StatefulWidget {
  RecruitScreen({Key? key}) : super(key: key);

  @override
  State<RecruitScreen> createState() => _RecruitScreenState();
}

class _RecruitScreenState extends State<RecruitScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List peoplelist = [
    {
      "img": "assets/icons/user.png",
      "name": "thawatchai AAAA",
      "study": "การศึกษาระดับปริญญาตรี",
      "jobtitle": "Programmer"
    },
    {
      "img": "assets/icons/user.png",
      "name": "thawatchai BBBB",
      "study": "การศึกษาระดับปริญญาตรี",
      "jobtitle": "HR"
    },
    {
      "img": "assets/icons/user.png",
      "name": "thawatchai CCCC",
      "study": "การศึกษาระดับปริญญาตรี",
      "jobtitle": "Sale"
    },
    {
      "img": "assets/icons/user.png",
      "name": "thawatchai DDDD",
      "study": "การศึกษาระดับปริญญาตรี",
      "jobtitle": "Engineer"
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Recruit',
            //style: TextStyle(color: Colors.deepOrange),
          ),
          bottom: TabBar(
            //isScrollable: true,
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'NotoSansThai'),
            tabs: [
              Tab(text: 'รายชื่อผู้หางาน'),
              Tab(text: 'รายการหาพนักงาน'),
            ],
          ),
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            //Tab1
            SingleChildScrollView(
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
                    height: 10,
                  ),
                  ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: peoplelist
                        .map((data) => PeopleWidget(
                              listdata: data,
                              use: true,
                              press: () {},
                            ))
                        .toList(),
                  )
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
                      height: size.height * 0.70,
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('1. หาโปรแกรมเมอร์.'),
                                Text('2 ตำแหน่ง'),
                              ],
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('ประสบการณ์ 2-5 ปี'),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailRecruit()));
                                    },
                                    icon: Icon(Icons.remove_red_eye)),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('2. หาจัดซื้อ'),
                                Text('5 ตำแหน่ง'),
                              ],
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('ประสบการณ์ 7+ ปี'),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailRecruit()));
                                    },
                                    icon: Icon(Icons.remove_red_eye)),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 2,
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddJobScreen()));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                height: size.height * 0.06,
                                width: size.width * 0.32,
                                //color: Colors.red,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddRecruitScreen()));
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
