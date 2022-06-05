import 'package:allserve/Screen/Allserve/AllserveHome/RecruitScreen.dart';
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
    {
      "name": "City to the Local",
      "imgurl": "assets/icons/CitytotheLocal.png",
    },
    {"name": "Recruit", "imgurl": "assets/icons/Recruit.png"},
    {"name": "Sales and CRM", "imgurl": "assets/icons/SalesCRM.png"},
    {"name": "Scrap Environment", "imgurl": "assets/icons/ScrapEnvironment.png"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AllServe Page'),
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
                      "AllServe of services",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.format_list_bulleted,
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.apps,
                          color: Colors.deepOrangeAccent,
                        ),
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
