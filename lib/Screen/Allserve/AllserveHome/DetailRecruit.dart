import 'package:allserve/Screen/Allserve/AllserveHome/Detailsapplicant.dart';
import 'package:allserve/Screen/Allserve/Search/Widgets/RecordTexForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailRecruit extends StatefulWidget {
  DetailRecruit({Key? key}) : super(key: key);

  @override
  State<DetailRecruit> createState() => _DetailRecruitState();
}

class _DetailRecruitState extends State<DetailRecruit>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'หาโปรแกรมเมอร์',
            //style: TextStyle(color: Colors.deepOrange),
          ),
          bottom: TabBar(
            //isScrollable: true,
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'NotoSansThai'),
            tabs: [
              Tab(text: 'ผู้น่าสนใจ'),
              Tab(text: 'ผู้ยื่นสมัคร'),
            ],
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
        body: TabBarView(
          controller: _tabController,
          children: [
            //Tab1
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1. นายอานน ธง'),
                          Text('อายุ 20 ปี'),
                        ],
                      ),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                              Text('ปริญญาตรี เทคโนโลยีสาระสนเทศ'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('เอเบค'),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailsApplicant()));
                                  },
                                  icon: Icon(Icons.remove_red_eye)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('2. นายพินัย ไกลบุตร'),
                          Text('อายุ 25 ปี'),
                        ],
                      ),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                              Text('ปริญญาตรี เทคโนโลยีสาระสนเทศ'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('รามคำแหง'),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailsApplicant()));
                                  },
                                  icon: Icon(Icons.remove_red_eye)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                  ],
                ),
              ),
            ),
            //Tab2
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1. นายสมชาย สายชม'),
                          Text('อายุ 20 ปี'),
                        ],
                      ),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                              Text('การศึกษา: ปริญญาตรี.'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('เทคโนโลยีลาดกระบัง'),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => ShowAlert(),
                                    );
                                  },
                                  icon: Icon(Icons.calendar_today)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('2. นายประวุธ ไกลบุตร'),
                          Text('อายุ 25 ปี'),
                        ],
                      ),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                              Text('การศึกษา: ปริญญาตรี.'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('เทคโนโลยี-ปทุม'),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => ShowAlert(),
                                    );
                                  },
                                  icon: Icon(Icons.calendar_today)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
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

class ShowAlert extends StatefulWidget {
  const ShowAlert({
    Key? key,
  }) : super(key: key);

  @override
  State<ShowAlert> createState() => _ShowAlertState();
}

class _ShowAlertState extends State<ShowAlert> {
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

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      title: Text(
        'เลือกวันที่',
        //style: TextStyle(fontFamily: fontFamily),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
                width: size.width * 0.01,
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
                width: size.width * 0.01,
              ),
              SizedBox(
                width: size.width * 0.20,
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
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
            child: Row(
              children: [
                Text(
                  'โน๊ต',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          RecordTextForm(
            hintText: '',
            maxLine: 4,
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: const Text('ยกเลิก'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('ตกลง'),
              onPressed: () => Navigator.of(context)
                ..pop()
                ..pop(),
            ),
          ],
        ),
        // CupertinoDialogAction(
        //   child: Text(
        //     'ยกเลิก',
        //     // style: TextStyle(
        //     //   color: kThemeTextColor,
        //     //   fontFamily: fontFamily,
        //     //   fontWeight: FontWeight.bold,
        //     // ),
        //   ),
        //   onPressed: () =>
        //       Navigator.pop(context, true),
        // ),
        // CupertinoDialogAction(
        //   child: Text(
        //     'ตกลง',
        //     // style: TextStyle(
        //     //   color: kThemeTextColor,
        //     //   fontFamily: fontFamily,
        //     // ),
        //   ),
        //   onPressed: () =>
        //       Navigator.of(context)
        //         ..pop()
        //         ..pop(),
        // )
      ],
    );
  }
}
