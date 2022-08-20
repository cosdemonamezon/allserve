import 'package:allserve/Screen/Allserve/AllserveHome/AddTransport.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/DetailTransport.dart';
import 'package:allserve/Screen/Widgets/SearchTextField.dart';
import 'package:flutter/material.dart';

class LogisticScreen extends StatefulWidget {
  LogisticScreen({Key? key}) : super(key: key);

  @override
  State<LogisticScreen> createState() => _LogisticScreenState();
}

class _LogisticScreenState extends State<LogisticScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
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
          title: Text('ขนส่ง'),
          bottom: TabBar(
            //isScrollable: true,
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'NotoSansThai'),
            tabs: [
              Tab(text: 'ผู้ให้บริการ'),
              Tab(text: 'รายการขนส่ง'),
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
                          onPressed: () {}, icon: Icon(Icons.remove_red_eye)),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    ListTile(
                      title: Text('2. บริษัท B ขนส่ง'),
                      trailing: IconButton(
                          onPressed: () {}, icon: Icon(Icons.remove_red_eye)),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    ListTile(
                      title: Text('3. บริษัท C ขนส่ง'),
                      trailing: IconButton(
                          onPressed: () {}, icon: Icon(Icons.remove_red_eye)),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    ListTile(
                      title: Text('4. บริษัท D ขนส่ง'),
                      trailing: IconButton(
                          onPressed: () {}, icon: Icon(Icons.remove_red_eye)),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    ListTile(
                      title: Text('5. บริษัท E ขนส่ง'),
                      trailing: IconButton(
                          onPressed: () {}, icon: Icon(Icons.remove_red_eye)),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                  ],
                ),
              ),
            ),
            //Tav2
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailTransport()));
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailTransport()));
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddTransport()));
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
      ),
    );
  }
}
