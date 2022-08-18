import 'package:allserve/Screen/Allserve/Search/Widgets/RecordTexForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailProducts extends StatefulWidget {
  DetailProducts({Key? key}) : super(key: key);

  @override
  State<DetailProducts> createState() => _DetailProductsState();
}

class _DetailProductsState extends State<DetailProducts> {
  final GlobalKey<FormState> recordFormKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController username1 = TextEditingController();
  int val = 0;
  String dayvalue = 'วัน';
  String mounthvalue = 'เดือน';
  String yearvalue = 'ปี';
  var dropdownDay = [
    'วัน',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31'
  ];
  List<String> dropdownMounth = [
    'เดือน',
    'มกราคม',
    'กุมภาพันธุ์.',
    'มีนาคม',
    'เมษายน',
    'พฤษภาคม',
    'มิถุนายน',
    'กรกฎาคม',
    'สิงหาคม',
    'กันยายน',
    'ตุลาคม',
    'พฤศจิกายน',
    'ธันวาคม',
  ];
  List<String> dropdownYear = [
    'ปี',
    '2018',
    '2019',
    '2020',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'รายละเอียดสินค้าที่ต้องการซื้อ',
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
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('กรอกข้อมูล'),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text('ชื่อ :'),
                          ),
                          SizedBox(
                            width: size.width*0.77,
                            child: RecordTextForm(
                              controller: username,
                              hintText: 'กรุณากรอกชื่อ',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text('จำนวน :'),
                          ),
                          SizedBox(
                            width: size.width*0.70,
                            child: RecordTextForm(
                              controller: username1,
                              hintText: 'กรุณากรอกจำนวน',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text('วันที่ใช้งาน :'),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.15,
                                child: DropdownButton(
                                  value: dayvalue,
                                  isExpanded: true,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.black),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.grey,
                                  ),
                                  items: dropdownDay.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dayvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              SizedBox(
                                width: size.width * 0.20,
                                child: DropdownButton(
                                  value: mounthvalue,
                                  isExpanded: true,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.black),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.grey,
                                  ),
                                  items: dropdownMounth.map((String items2) {
                                    return DropdownMenuItem(
                                      value: items2,
                                      child: Text(items2),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      mounthvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              SizedBox(
                                width: size.width * 0.18,
                                child: DropdownButton(
                                  value: yearvalue,
                                  isExpanded: true,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.black),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.grey,
                                  ),
                                  items: dropdownYear.map((String items3) {
                                    return DropdownMenuItem(
                                      value: items3,
                                      child: Text(items3),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      yearvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
                  showCupertinoDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                          title: Text(
                            'ดำเนินการเรียบร้อย',
                            //style: TextStyle(fontFamily: fontFamily),
                          ),
                          content: Text(
                            'ต้องการออกจากหน้านี้หรือไม่',
                            //style: TextStyle(fontFamily: fontFamily),
                          ),
                          actions: <CupertinoDialogAction>[
                            CupertinoDialogAction(
                              child: Text(
                                'ยกเลิก',
                                // style: TextStyle(
                                //   color: kThemeTextColor,
                                //   fontFamily: fontFamily,
                                //   fontWeight: FontWeight.bold,
                                // ),
                              ),
                              onPressed: () => Navigator.pop(context, true),
                            ),
                            CupertinoDialogAction(
                              child: Text(
                                'ตกลง',
                                // style: TextStyle(
                                //   color: kThemeTextColor,
                                //   fontFamily: fontFamily,
                                // ),
                              ),
                              onPressed: () => Navigator.of(context)
                                ..pop()
                                ..pop(),
                            )
                          ],
                        ),
                      );
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
