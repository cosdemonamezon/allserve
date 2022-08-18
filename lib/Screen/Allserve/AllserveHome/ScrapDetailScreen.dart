import 'package:flutter/material.dart';

class ScrapDetailScreen extends StatefulWidget {
  ScrapDetailScreen({Key? key}) : super(key: key);

  @override
  State<ScrapDetailScreen> createState() => _ScrapDetailScreenState();
}

class _ScrapDetailScreenState extends State<ScrapDetailScreen> {
  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
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
    return Scaffold(
      appBar: AppBar(
        title: Text('รายชื่อ Partner ในบริเวณ'),
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
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
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
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('1. บริษัท A'),
                            Row(
                              children: [
                                Container(
                                  height: size.height * 0.05,
                                  width: size.width * 0.26,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'ขอใบเสนอราคา',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                                Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('2. บริษัท B'),
                            Row(
                              children: [
                                Container(
                                  height: size.height * 0.05,
                                  width: size.width * 0.26,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'ขอใบเสนอราคา',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                                Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isChecked1,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked1 = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('3. บริษัท C'),
                            Row(
                              children: [
                                Container(
                                  height: size.height * 0.05,
                                  width: size.width * 0.26,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'ขอใบเสนอราคา',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                                Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isChecked2,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked2 = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('4. บริษัท D'),
                            Row(
                              children: [
                                Container(
                                  height: size.height * 0.05,
                                  width: size.width * 0.26,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'ขอใบเสนอราคา',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                                Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isChecked3,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked3 = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('5. บริษัท E'),
                            Row(
                              children: [
                                Container(
                                  height: size.height * 0.05,
                                  width: size.width * 0.26,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'ขอใบเสนอราคา',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                                Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isChecked4,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked4 = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)..pop()..pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: size.height*0.04),
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
            ],
          ),
        ),
      ),
    );
  }
}
