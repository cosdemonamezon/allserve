import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../appTheme.dart';
import '../../../../Widgets/SearchTextField.dart';
import '../ScrapController.dart';

class DetailScrapPage extends StatefulWidget {
  DetailScrapPage({super.key, required this.id, required this.name});
  int id;
  String name;

  @override
  State<DetailScrapPage> createState() => _DetailScrapPageState();
}

class _DetailScrapPageState extends State<DetailScrapPage> {
  @override
  void initState() {
    _loadItem();
    super.initState();
  }

  Future _loadItem() async {
    await context.read<ScrapController>().detailScrapCompany(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appFontSize = AppFontSize.of(context);
    return Consumer<ScrapController>(
      builder: (context, controller, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            widget.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: appFontSize?.appBarFont,
            ),
          ),
        ),
        body: Column(
          children: [
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
                    child: controller.scrapCompanyDetail.isEmpty
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            // controller: _controller,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.scrapCompanyDetail[0].scraps!.length,
                            itemBuilder: (_, index) {
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
                                          // Expanded(
                                          //   flex: 2,
                                          //   child: controller.scrapCompanyDetail[0].scraps![index].image != null
                                          //       ? Image.network(
                                          //           "${controller.scrapCompanyDetail[0].scraps![index].image}",
                                          //           height: size.height / 17,
                                          //           errorBuilder: (context, error, stackTrace) =>
                                          //               Image.asset('assets/No_Image_Available.jpg'),
                                          //         )
                                          //       : Image.asset('assets/No_Image_Available.jpg'),
                                          // ),
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
                                                    controller.scrapCompanyDetail[0].scraps![index].name ?? '',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold, fontSize: appFontSize?.body),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    'คำอธืบาย ${controller.scrapCompanyDetail[0].scraps![index].description ?? ''}',
                                                    style: TextStyle(fontSize: appFontSize?.body2),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    'จำนวน ${controller.scrapCompanyDetail[0].scraps![index].qty ?? ''} ',
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
                            }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
