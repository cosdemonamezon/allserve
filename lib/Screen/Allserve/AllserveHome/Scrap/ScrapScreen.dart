import 'package:allserve/Screen/Allserve/AllserveHome/Widgets/AppTextForm.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class ScrapScreen extends StatefulWidget {
  ScrapScreen({Key? key}) : super(key: key);

  @override
  State<ScrapScreen> createState() => _ScrapScreenState();
}

class _ScrapScreenState extends State<ScrapScreen> {
  int a = 1;
  FilePickerResult? result;
  PlatformFile? file;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('รายการของเสีย (Scrap)'),
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                children: List.generate(
                    a,
                    (index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                          child: Card(
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
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('${index + 1}.'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      Text('ชื่อสินค้า'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  AppTextForm(
                                    hintText: 'ใส่ชื่อสินค้า',
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      Text('จำนวน'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  AppTextForm(
                                    hintText: '',
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      Text('รูป'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Container(
                                    height: size.height * 0.05,
                                    width: size.width,
                                    color: file != null ? Colors.blueAccent : Color.fromARGB(255, 124, 124, 124),
                                    child: InkWell(
                                      onTap: () async {
                                        result = await FilePicker.platform.pickFiles();
                                        setState(() {
                                          if (result != null) {
                                            file = result!.files.first;
                                            print(file);
                                          } else {
                                            print('No file');
                                          }
                                        });
                                      },
                                      child: Center(
                                          child: Text(
                                        'อัพโหลด',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    a = a + 1;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * 0.32,
                    //color: Colors.red,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                        child: Text(
                      'เพิ่ม',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.22,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.hardEdge,
        //shape: CircularNotchedRectangle(),
        elevation: 25,
        child: Container(
          height: size.height * 0.10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ScrapDetailScreen()));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * 0.32,
                    //color: Colors.red,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Center(
                        child: Text(
                      'ยืนยัน',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
