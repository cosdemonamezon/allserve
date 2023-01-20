import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../appTheme.dart';
import '../../../Widgets/SearchTextField.dart';
import '../Scrap/ScrapController.dart';

class DetailVendorPage extends StatefulWidget {
  const DetailVendorPage({super.key, required this.id});
  final int id;

  @override
  State<DetailVendorPage> createState() => _DetailVendorPageState();
}

class _DetailVendorPageState extends State<DetailVendorPage> {
  void initState() {
    _loadItem();
    super.initState();
  }

  Future _loadItem() async {
    await context.read<ScrapController>().detailVendor(widget.id);
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
            'รายละเอียด',
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
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 10),
                  //   child: SearchTextField(),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Card(
                      margin: EdgeInsets.zero,
                      elevation: 0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color(0xFFF3F3F3),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 40,
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/No_Image_Available.jpg',
                                      width: 65,
                                      height: 55,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                controller.vendorDetail?.name != null
                                    ? Text(
                                        controller.vendorDetail!.name!,
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                        maxLines: 3,
                                      )
                                    : Text('')
                              ],
                            ),
                            Divider(
                              thickness: 3,
                            ),
                            Text('Email: ${controller.vendorDetail?.email ?? ''}',
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Phone: ${controller.vendorDetail?.phone ?? ''}',
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Tax: ${controller.vendorDetail?.tax ?? ''}',
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Fax: ${controller.vendorDetail?.fax ?? ''}',
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Address1: ${controller.vendorDetail?.address1 ?? ''}',
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Address2: ${controller.vendorDetail?.address2 ?? ''}',
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Address3: ${controller.vendorDetail?.address3 ?? ''}',
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Country: ${controller.vendorDetail?.country ?? ''}',
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Postcode: ${controller.vendorDetail?.postcode ?? ''}',
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
