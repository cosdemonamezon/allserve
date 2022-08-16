import 'package:allserve/Screen/Allserve/Search/Widgets/ListMicrosoft.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchAllservScreen extends StatefulWidget {
  SearchAllservScreen({Key? key}) : super(key: key);

  @override
  State<SearchAllservScreen> createState() => _SearchAllservScreenState();
}

class _SearchAllservScreenState extends State<SearchAllservScreen> {
  final GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();
  final TextEditingController searchController = TextEditingController();
  List allservlist = [
    {
      "imgurl": "assets/icons/1.png",
      "title": "Microsoft Word",
      "subtitle": " Connector Microsoft Ltd",
    },
    {
      "imgurl": "assets/icons/2.png",
      "title": "Microsoft Excel",
      "subtitle": " Connector Microsoft Ltd",
    },
    {
      "imgurl": "assets/icons/3.png",
      "title": "Microsoft PowerPoint",
      "subtitle": " Connector Microsoft Ltd",
    },
    {
      "imgurl": "assets/icons/4.png",
      "title": "Microsoft Outlook",
      "subtitle": " Connector Microsoft Ltd",
    },
    {
      "imgurl": "assets/icons/5.png",
      "title": "Microsoft Access",
      "subtitle": " Connector Microsoft Ltd",
    },
    {
      "imgurl": "assets/icons/6.png",
      "title": "Microsoft Publisher",
      "subtitle": " Connector Microsoft Ltd",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Microsoft',
          //style: TextStyle(color: Colors.deepOrange),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: allservlist
                  .map((data) => ListMicrosoft(
                        companydata: data,
                        press: () {
                          launchUrl(Uri.parse('https://www.microsoft.com/th-th/microsoft-365/free-office-online-for-the-web'));
                        },
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return Hero(
      tag: 'tag',
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 16),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12, left: 0),
              child: Icon(Icons.search, color: Colors.deepOrange),
            ),
            Expanded(
              child: Material(
                color: Colors.white,
                child: TextField(
                  controller: searchController,
                  style: TextStyle(color: Colors.black),
                  onSubmitted: (value) {},
                  autofocus: false,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    hintText: 'Search for home service...',
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.only(
                    right: 10, left: 10, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 4,
                  children: [
                    Text(
                      "Filter",
                      style: TextStyle(
                          color: Colors
                              .black), //TextStyle(color: Get.theme.hintColor),
                    ),
                    Icon(
                      Icons.filter_list,
                      color: Colors.black,
                      size: 21,
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
