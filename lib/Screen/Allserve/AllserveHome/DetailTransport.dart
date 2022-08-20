import 'package:allserve/Screen/Allserve/AllserveHome/DetailStatus.dart';
import 'package:allserve/Screen/Allserve/Search/Widgets/RecordTexForm.dart';
import 'package:flutter/material.dart';

class DetailTransport extends StatefulWidget {
  DetailTransport({Key? key}) : super(key: key);

  @override
  State<DetailTransport> createState() => _DetailTransportState();
}

class _DetailTransportState extends State<DetailTransport> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'รายการขนส่ง',
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Row(
                  children: [
                    Text('ขนาด'),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        SizedBox(
                            width: size.width * 0.10, child: Text('กว้าง')),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.60,
                    child: RecordTextForm(
                      hintText: '200',
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        Text('เมตร'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        SizedBox(width: size.width * 0.10, child: Text('ยาว')),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.60,
                    child: RecordTextForm(
                      hintText: '100',
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        Text('เมตร'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        SizedBox(width: size.width * 0.10, child: Text('หนัก')),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.60,
                    child: RecordTextForm(
                      hintText: '2000',
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        Text('กิโล..'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        SizedBox(
                            width: size.width * 0.10, child: Text('จำนวน')),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.60,
                    child: RecordTextForm(
                      hintText: '5',
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: Row(
                      children: [
                        Text('กล่อง'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Row(
                  children: [Text('รูป')],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SizedBox(
                height: size.height * 0.15,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Container(
                      width: size.width * 0.25,
                      height: size.height * 0.15,
                      child: Column(
                        children: [
                          SizedBox(
                              height: size.height * 0.08,
                              width: size.width * 0.18,
                              child: Image.asset(
                                'assets/icons/box1.png',
                                fit: BoxFit.fill,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.25,
                      height: size.height * 0.15,
                      child: Column(
                        children: [
                          SizedBox(
                              height: size.height * 0.08,
                              width: size.width * 0.18,
                              child: Image.asset(
                                'assets/icons/box2.png',
                                fit: BoxFit.fill,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.25,
                      height: size.height * 0.15,
                      child: Column(
                        children: [
                          SizedBox(
                              height: size.height * 0.08,
                              width: size.width * 0.18,
                              child: Image.asset(
                                'assets/icons/box3.png',
                                fit: BoxFit.fill,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.25,
                      height: size.height * 0.15,
                      child: Column(
                        children: [
                          SizedBox(
                              height: size.height * 0.08,
                              width: size.width * 0.18,
                              child: Image.asset(
                                'assets/icons/box3.png',
                                fit: BoxFit.fill,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.25,
                      height: size.height * 0.15,
                      child: Column(
                        children: [
                          SizedBox(
                              height: size.height * 0.08,
                              width: size.width * 0.18,
                              child: Image.asset(
                                'assets/icons/box3.png',
                                fit: BoxFit.fill,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SizedBox(
                height: size.height * 0.03,
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailStatus()));
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
                      'ดูสถานะ',
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
