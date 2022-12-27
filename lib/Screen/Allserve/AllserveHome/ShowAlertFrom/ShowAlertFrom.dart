import 'package:allserve/Screen/Allserve/AllserveHome/AllServeService.dart';
import 'package:allserve/extension/dateExtension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../appTheme.dart';
import '../../../Register/Widgets/RegisTextField.dart';
import '../../../Widgets/LoadingDialog.dart';
import '../../../app/AppController.dart';
import '../Widgets/TextFieldWidget.dart';

class ShowAlertFrom extends StatefulWidget {
  ShowAlertFrom({super.key, this.idUser, this.idPosition});
  int? idUser;
  int? idPosition;
  @override
  State<ShowAlertFrom> createState() => _ShowAlertFromState();
}

class _ShowAlertFromState extends State<ShowAlertFrom> {
  final TextEditingController? topic = TextEditingController();
  final TextEditingController? recruitment = TextEditingController();
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstInstall();
  }

  Future<void> _firstInstall() async {
    await context.read<AppController>().initialize();
  }

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
    return Consumer<AppController>(
      builder: (context, controller, child) {
        final size = MediaQuery.of(context).size;
        final appFontSize = AppFontSize.of(context);
        final user = context.read<AppController>().user;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'รายละเอียดการนัดหมาย',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'วันที่',
                  style: TextStyle(fontSize: appFontSize?.body),
                ),
                SizedBox(height: 10),
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    fillColor: Color.fromARGB(255, 219, 228, 235),
                    filled: true,
                    hintText: date.formatTo('dd-MM-yyyy'),
                    hintStyle: TextStyle(
                      fontSize: appFontSize?.body2,
                      color: Color.fromARGB(255, 71, 70, 70),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                              context: context, initialDate: date, firstDate: DateTime(1900), lastDate: DateTime(2100));

                          // Cancel
                          if (newDate == null) return;

                          setState(() {
                            date = newDate;
                          });
                          print(date);
                        },
                        icon: Icon(
                          Icons.calendar_month,
                          color: Colors.black,
                        )),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'หัวข้อ',
                  style: TextStyle(fontSize: appFontSize?.body),
                ),
                SizedBox(height: 10),
                RegisTextField(
                  controller: topic,
                  hintText: '',
                ),
                SizedBox(height: 10),
                // Text(
                //   'ตำแหน่งงาน',
                //   style: TextStyle(fontSize: appFontSize?.body),
                // ),
                // SizedBox(height: 10),
                // RegisTextField(
                //   controller: recruitment,
                //   hintText: '',ห
                // ),
                SizedBox(height: 10),
                Text(
                  'เวลา',
                  style: TextStyle(fontSize: appFontSize?.body),
                ),
                SizedBox(height: 10),
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    fillColor: Color.fromARGB(255, 219, 228, 235),
                    filled: true,
                    hintText: time.format(context),
                    hintStyle: TextStyle(
                      fontSize: appFontSize?.body2,
                      color: Color.fromARGB(255, 71, 70, 70),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () async {
                          TimeOfDay? newTime = await showTimePicker(
                            context: context,
                            initialTime: time,
                          );

                          // Cancel
                          if (newTime == null) return;

                          setState(() {
                            time = newTime;
                          });
                          print(date);
                        },
                        icon: Icon(
                          Icons.timer,
                          color: Colors.black,
                        )),
                  ),
                ),
                SizedBox(height: 10),
                // Text(
                //   'อีเมล',
                //   style: TextStyle(fontSize: appFontSize?.body),
                // ),
                // SizedBox(height: 10),
                // RegisTextField(
                //   // controller: email,
                //   hintText: 'กรอก อีเมล',
                // ),
                // SizedBox(height: 10),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            clipBehavior: Clip.hardEdge,
            //shape: CircularNotchedRectangle(),
            elevation: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              height: size.height * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      // try {
                      // LoadingDialog.open(context);
                      await JobService.meetings(
                        user_id: user!.id.toString(),
                        user_job_id: widget.idUser.toString(),
                        recruitment_companie_id: widget.idPosition.toString(),
                        topic: topic!.text,
                        duration: 1,
                        agenda: time.format(context),
                        start_time: date.formatTo('dd-MM-yyyy'),
                      );
                      if (mounted) {
                        // LoadingDialog.close(context);
                        Navigator.of(context)
                          ..pop()
                          ..pop();
                      }
                      // } catch (e) {
                      //   LoadingDialog.close(context);
                      //   showDialog(
                      //     context: context,
                      //     builder: (context) => AlertDialog(
                      //       backgroundColor: Colors.blueAccent,
                      //       title: Text("Error", style: TextStyle(color: Colors.white)),
                      //       content: Text(e.toString(), style: TextStyle(color: Colors.white)),
                      //       actions: [
                      //         TextButton(
                      //             onPressed: () {
                      //               Navigator.pop(context);
                      //             },
                      //             child: Text('OK', style: TextStyle(color: Colors.white)))
                      //       ],
                      //     ),
                      //   );
                      // }

                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   return ShowAlertFrom();
                      // }));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


// import 'package:allserve/extension/dateExtension.dart';
// import 'package:flutter/material.dart';

// import '../../../Alljob/Job/Widgets/RecordTexForm.dart';
// import '../Widgets/TextFieldWidget.dart';

// class ShowAlertFrom extends StatefulWidget {
//   const ShowAlertFrom({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<ShowAlertFrom> createState() => _ShowAlertFromState();
// }

// class _ShowAlertFromState extends State<ShowAlertFrom> {
//   String dayvalue = 'วัน';
//   String mounthvalue = 'เดือน';
//   String yearvalue = 'ปี';
//   DateTime date = DateTime.now();

//   var dropdownDay = [
//     'วัน',
//     '1',
//     '2',
//     '3',
//     '4',
//     '5',
//     '6',
//     '7',
//     '8',
//     '9',
//     '10',
//     '11',
//     '12',
//     '13',
//     '14',
//     '15',
//     '16',
//     '17',
//     '18',
//     '19',
//     '20',
//     '21',
//     '22',
//     '23',
//     '24',
//     '25',
//     '26',
//     '27',
//     '28',
//     '29',
//     '30',
//     '31'
//   ];
//   List<String> dropdownMounth = [
//     'เดือน',
//     'มกราคม',
//     'กุมภาพันธุ์.',
//     'มีนาคม',
//     'เมษายน',
//     'พฤษภาคม',
//     'มิถุนายน',
//     'กรกฎาคม',
//     'สิงหาคม',
//     'กันยายน',
//     'ตุลาคม',
//     'พฤศจิกายน',
//     'ธันวาคม',
//   ];
//   List<String> dropdownYear = [
//     'ปี',
//     '2018',
//     '2019',
//     '2020',
//     '2022',
//     '2023',
//     '2024',
//     '2025',
//     '2026',
//     '2027',
//   ];

//   Color getColor(Set<MaterialState> states) {
//     const Set<MaterialState> interactiveStates = <MaterialState>{
//       MaterialState.pressed,
//       MaterialState.hovered,
//       MaterialState.focused,
//     };
//     if (states.any(interactiveStates.contains)) {
//       return Colors.blue;
//     }
//     return Colors.blue;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return AlertDialog(
//       title: Text(
//         'เลือกวันที่',
//         //style: TextStyle(fontFamily: fontFamily),
//       ),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             children: [
//               // SizedBox(
//               //   width: size.width * 0.15,
//               //   child: DropdownButton(
//               //     value: dayvalue,
//               //     isExpanded: true,
//               //     icon: const Icon(Icons.keyboard_arrow_down),
//               //     elevation: 16,
//               //     style: const TextStyle(color: Colors.black),
//               //     underline: Container(
//               //       height: 2,
//               //       color: Colors.grey,
//               //     ),
//               //     items: dropdownDay.map((String items) {
//               //       return DropdownMenuItem(
//               //         value: items,
//               //         child: Text(items),
//               //       );
//               //     }).toList(),
//               //     onChanged: (String? newValue) {
//               //       setState(() {
//               //         dayvalue = newValue!;
//               //       });
//               //     },
//               //   ),
//               // ),
//               TextFieldRegisterWidget(
//                 readOnly: true,
//                 // onSaved: (input) => firstname.text = input!,
//                 hintText: date.formatTo('dd-MM-yyyy'),
//                 // '${date.day}/${date.month}/${date.year}',
//                 style: TextStyle(
//                   fontSize: 16,
//                   // fontWeight: FontWeight.bold,
//                 ),
//                 labelText: "วันเกิด(วว/ดด/ปปปป)*",
//                 suffixIcon: IconButton(
//                     onPressed: () async {
//                       DateTime? newDate = await showDatePicker(
//                           context: context, initialDate: date, firstDate: DateTime(1900), lastDate: DateTime(2100));

//                       // Cancel
//                       if (newDate == null) return;

//                       setState(() {
//                         date = newDate;
//                       });
//                       print(date);
//                     },
//                     icon: Icon(
//                       Icons.calendar_month,
//                       color: Colors.black,
//                     )),
//               ),
//               SizedBox(
//                 width: size.width * 0.01,
//               ),
//               SizedBox(
//                 width: size.width * 0.20,
//                 child: DropdownButton(
//                   value: mounthvalue,
//                   isExpanded: true,
//                   icon: const Icon(Icons.keyboard_arrow_down),
//                   elevation: 16,
//                   style: const TextStyle(color: Colors.black),
//                   underline: Container(
//                     height: 2,
//                     color: Colors.grey,
//                   ),
//                   items: dropdownMounth.map((String items2) {
//                     return DropdownMenuItem(
//                       value: items2,
//                       child: Text(items2),
//                     );
//                   }).toList(),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       mounthvalue = newValue!;
//                     });
//                   },
//                 ),
//               ),
//               SizedBox(
//                 width: size.width * 0.01,
//               ),
//               SizedBox(
//                 width: size.width * 0.20,
//                 child: DropdownButton(
//                   value: yearvalue,
//                   isExpanded: true,
//                   icon: const Icon(Icons.keyboard_arrow_down),
//                   elevation: 16,
//                   style: const TextStyle(color: Colors.black),
//                   underline: Container(
//                     height: 2,
//                     color: Color.fromARGB(255, 207, 205, 205),
//                   ),
//                   items: dropdownYear.map((String items3) {
//                     return DropdownMenuItem(
//                       value: items3,
//                       child: Text(items3),
//                     );
//                   }).toList(),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       yearvalue = newValue!;
//                     });
//                   },
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
//             child: Row(
//               children: [
//                 Text(
//                   'โน๊ต',
//                   style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
//                 ),
//               ],
//             ),
//           ),
//           RecordTextForm(
//             hintText: '',
//             maxLine: 4,
//           ),
//         ],
//       ),
//       actions: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             TextButton(
//               child: const Text('ยกเลิก'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: const Text('ตกลง'),
//               onPressed: () => Navigator.of(context)
//                 ..pop()
//                 ..pop(),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
