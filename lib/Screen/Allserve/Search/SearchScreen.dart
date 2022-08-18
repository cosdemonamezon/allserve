import 'package:allserve/Screen/Allserve/Search/DetailProducts.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();
  final TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> comtlist = [
    {
      "title": "บริษัท อาชาเทค สาขา A",
      "subtitle": "ขายคอมพิวเตอร์ราคาถูก พร้อมซอฟแวร์แท้",
    },
    {
      "title": "บริษัท อาชาเทค สาขา B",
      "subtitle": "ขายส่งตรง ส่งทั่วประเทศ",
    },
    {
      "title": "บริษัท อาชาเทค สาขา C",
      "subtitle": "ขายทุกอย่าง พร้อมส่งทุกอย่าง",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ค้นหา ผู้ขาย',
          //style: TextStyle(color: Colors.deepOrange),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                children: [
                  buildSearchBar(),
                  searchController.text != ''
                      ? ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const ClampingScrollPhysics(),
                          children: List.generate(
                              comtlist.length,
                              (index) => CardSearchCompany(
                                    size: size,
                                    comtlist: comtlist,
                                    index: index,
                                  )),
                        )
                      : SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return Hero(
      tag: 'tag',
      child: Container(
        margin: EdgeInsets.only(left: 1, right: 1, bottom: 1),
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
              padding: const EdgeInsets.only(right: 10, left: 0),
              child: Icon(Icons.search, color: Colors.deepOrange),
            ),
            Expanded(
              child: Material(
                color: Colors.white,
                child: TextField(
                  controller: searchController,
                  style: TextStyle(color: Colors.black),
                  onSubmitted: (value) {
                    setState(() {
                      searchController.text = value;
                    });
                  },
                  // onChanged: (value){
                  //   setState(() {
                  //     searchController.text = value;
                  //   });
                  // },
                  autofocus: false,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    hintText: 'ค้นหา...',
                  ),
                ),
              ),
            ),
            // SizedBox(width: 8),
            // GestureDetector(
            //   onTap: () {},
            //   child: Container(
            //     padding: const EdgeInsets.only(
            //         right: 10, left: 10, top: 10, bottom: 10),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(8)),
            //       color: Colors.grey.withOpacity(0.1),
            //     ),
            //     child: Wrap(
            //       crossAxisAlignment: WrapCrossAlignment.center,
            //       spacing: 4,
            //       children: [
            //         Text(
            //           "Filter",
            //           style: TextStyle(
            //               color: Colors
            //                   .black), //TextStyle(color: Get.theme.hintColor),
            //         ),
            //         Icon(
            //           Icons.filter_list,
            //           color: Colors.black,
            //           size: 21,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class CardSearchCompany extends StatelessWidget {
  const CardSearchCompany({
    Key? key,
    required this.size,
    required this.comtlist,
    required this.index,
  }) : super(key: key);

  final Size size;
  final int index;
  final List<Map<String, dynamic>> comtlist;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailProducts()));
      },
      child: Container(
        width: size.width,
        margin: EdgeInsets.only(right: 10, left: 10, top: 10),
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
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: ListTile(
            title: Text(comtlist[index]['title']),
            subtitle: Text(comtlist[index]['subtitle']),
            trailing: Container(
              height: size.height * 0.05,
              width: size.width * 0.26,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Text(
                'ขอใบเสนอราคา',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
