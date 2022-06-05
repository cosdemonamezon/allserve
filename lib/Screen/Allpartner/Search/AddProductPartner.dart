import 'package:allserve/Screen/Login/Widgets/AppTextForm.dart';
import 'package:flutter/material.dart';

class AddProductPartner extends StatefulWidget {
  AddProductPartner({Key? key}) : super(key: key);

  @override
  State<AddProductPartner> createState() => _AddProductPartnerState();
}

class _AddProductPartnerState extends State<AddProductPartner> {
  final GlobalKey<FormState> editFormKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เพิ่มสินค้า',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: editFormKey,
                  child: Wrap(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Card(
                        margin: EdgeInsets.zero,
                        elevation: 0,
                        color: Color.fromARGB(255, 218, 216, 216),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xFFF3F3F3),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'ใส่ชื่อสินค้า',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              AppTextForm(
                                controller: username,
                                hintText: 'ใส่ชื่อสินค้า',
                              ),
                            ],
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
      ),
    );
  }
}
