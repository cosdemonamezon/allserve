import 'package:allserve/Screen/Allserve/Search/Widgets/RecordTexForm.dart';
import 'package:flutter/material.dart';

class DetailsApplicant extends StatefulWidget {
  DetailsApplicant({Key? key}) : super(key: key);

  @override
  State<DetailsApplicant> createState() => _DetailsApplicantState();
}

class _DetailsApplicantState extends State<DetailsApplicant> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'รายละเอียดผู้สมัคร',
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
                height: 20,
              ),
              Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                color: Color.fromARGB(255, 224, 224, 224),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color(0xFFF3F3F3),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.height * 0.02,
                      vertical: size.width * 0.02),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              height: size.height * 0.07,
                              width: size.width * 0.15,
                              child: Image.asset('assets/icons/user.png')),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ชื่อ: นายอานน ธง'),
                              Text('ชื่อเล่น: อานน')
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.height * 0.05,
                      ),
                      Row(
                        children: [
                          Text('อายุ: 20 ปี'),
                        ],
                      ),
                      SizedBox(
                        width: size.height * 0.05,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                                  'ที่อยู่: เลขที่ 6/4 ชั้น 2 ปาก ซ.13 4 ถนน ลาดกระบัง ลาดกระบัง เขตลาดกระบัง กรุงเทพมหานคร 10520')),
                        ],
                      ),
                      SizedBox(
                        width: size.height * 0.05,
                      ),
                      Divider(
                        thickness: 3,
                      ),
                      Row(
                        children: [
                          Text('การศึกษา: ปริญญาตรี.'),
                        ],
                      ),
                      SizedBox(
                        width: size.height * 0.05,
                      ),
                      Row(
                        children: [
                          Text('สาขา: เทคโนโลยีสาระสนเทศ'),
                        ],
                      ),
                      SizedBox(
                        width: size.height * 0.05,
                      ),
                      Row(
                        children: [
                          Text('จบปี: 2554 - 2559'),
                        ],
                      ),
                      SizedBox(
                        width: size.height * 0.05,
                      ),
                      Row(
                        children: [
                          Text('เกรดเฉลี่ย: 3.12'),
                        ],
                      ),
                      SizedBox(
                        width: size.height * 0.05,
                      ),
                    ],
                  ),
                ),
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
                  showDialog(
                    context: context,
                    builder: (context) => ShowAlertFrom(),
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
                      'เชิญ',
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

class ShowAlertFrom extends StatefulWidget {
  const ShowAlertFrom({
    Key? key,
  }) : super(key: key);

  @override
  State<ShowAlertFrom> createState() => _ShowAlertFromState();
}

class _ShowAlertFromState extends State<ShowAlertFrom> {
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
                    color: Color.fromARGB(255, 207, 205, 205),
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
            padding: EdgeInsets.symmetric(vertical: size.height*0.02),
            child: Row(
              children: [
                Text(
                  'โน๊ต',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
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
      ],
    );
  }
}
