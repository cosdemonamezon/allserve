import 'package:allserve/Screen/Widgets/CardList.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();
  final TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> productlist = [
    {
      "imgurl":"assets/images/p1.png",
      "title":"Dock Cleanning tooooo",
      "subtitle":" Connector Gussikowski Ltd",
      "address":"Spandauer Str. 1. 10178 Berlin",
      "total":"105.5s",
      "createAt":"2022-05-06 18:31:50.133920",
      "hh":"18:31",
      "dd":"06",
      "mm":"Feb"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: ListView(
        children: [
          buildSearchBar(),
          CardList(list: productlist[0]),
        ],
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
                padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
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
                      style: TextStyle(color: Colors.black), //TextStyle(color: Get.theme.hintColor),
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