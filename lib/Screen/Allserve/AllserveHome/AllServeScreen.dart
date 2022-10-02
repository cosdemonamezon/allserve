import 'package:allserve/Screen/Allserve/AllserveHome/ResponseListScreen.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/Widgets/GridItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
  @override
  Widget build(BuildContext context) {
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
        child: ListView(
          primary: true,
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
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ResponseListScreen()));
                            },
                            icon: Icon(
                              Icons.notifications,
                              color: Colors.blueAccent,
                            ),
                          ),
                          Positioned(
                              right: 4,
                              top: 5,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.redAccent,
                                child: Center(child: Text('4')),
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            MasonryGridView.count(
              primary: false,
              shrinkWrap: true,
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 2
                      : 4,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: listall.length,
              itemBuilder: (BuildContext context, int index) {
                return GridItemWidget(
                  data: listall[index],
                  press: () {},
                );
              },
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
