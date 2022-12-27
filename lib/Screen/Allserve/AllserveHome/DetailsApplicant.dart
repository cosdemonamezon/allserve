import 'dart:developer';

import 'package:allserve/Screen/Allserve/Search/Widgets/RecordTexForm.dart';
import 'package:allserve/extension/dateExtension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AllServeController.dart';
import 'ShowAlertFrom/ShowAlertFrom.dart';
import 'Widgets/TextFieldWidget.dart';

class DetailsApplicant extends StatefulWidget {
  DetailsApplicant({Key? key, required this.id, required this.titie, this.idPosition}) : super(key: key);
  final int id;
  int? idPosition;
  final String titie;

  @override
  State<DetailsApplicant> createState() => _DetailsApplicantState();
}

class _DetailsApplicantState extends State<DetailsApplicant> {
  DateTime date = DateTime.now();
  @override
  void initState() {
    super.initState();
    _loadItem();
  }

  Future _loadItem() async {
    await context.read<JobController>().detailUser(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<JobController>(
      builder: (context, controller, child) {
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
                padding: EdgeInsets.fromLTRB(16, 10, 16, 20),
                child: Column(
                  children: [
                    controller.userDetail == null
                        ? Center(child: CircularProgressIndicator())
                        : Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.blue.withOpacity(1), Colors.blueAccent.withOpacity(0.1)],
                                  begin: AlignmentDirectional.topStart,
                                  //const FractionalOffset(1, 0),
                                  end: AlignmentDirectional.bottomEnd,
                                  stops: [0.1, 0.9],
                                  tileMode: TileMode.clamp),
                              borderRadius:
                                  BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: controller.userDetail!.image != null
                                        ? CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            radius: 60,
                                            child: ClipOval(
                                              child: Image.network(
                                                controller.userDetail!.image!,
                                                width: 130,
                                                height: 130,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        : Image.asset(
                                            'assets/icons/user.png',
                                            width: 130,
                                            height: 130,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                  Center(
                                    child: Text(
                                      controller.userDetail?.name ?? '',
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                    ),
                                  ),
                                  Center(
                                      child: Text('ชื่อเล่น: อานน',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('เพศ: ${controller.userDetail?.gender ?? '-'} '),
                                  Text('วันเกิด: ${controller.userDetail?.birthday ?? '-'} '),
                                  Text('อายุ: ${controller.userDetail?.birthday!.agenow() ?? '-'} ปี'),
                                  Text('เบอร์: ${controller.userDetail?.phone ?? '-'} '),
                                  Text('สถานะ: ${controller.userDetail?.marital ?? '-'} '),
                                  Text('ที่อยู่: ${controller.userDetail?.address ?? '-'} '),
                                  SizedBox(
                                    width: size.height * 0.05,
                                  ),
                                  Divider(
                                    thickness: 3,
                                  ),
                                  controller.userDetail!.user_job_detail!.isNotEmpty
                                      ? Text(
                                          'สถานศึกษา: ${controller.userDetail?.user_job_detail?[0].location_of_educate ?? ''}')
                                      : Text('สถานศึกษา:'),
                                  SizedBox(
                                    width: size.height * 0.05,
                                  ),
                                  controller.userDetail!.user_job_detail!.isNotEmpty
                                      ? Text('การศึกษา: ${controller.userDetail?.user_job_detail?[0].degree ?? ''}')
                                      : Text('การศึกษา:'),
                                  SizedBox(
                                    width: size.height * 0.05,
                                  ),
                                  controller.userDetail!.user_job_detail!.isNotEmpty
                                      ? Text('สาขา: ${controller.userDetail?.user_job_detail?[0].major ?? ''}')
                                      : Text('สาขา:'),
                                  SizedBox(
                                    width: size.height * 0.05,
                                  ),
                                  controller.userDetail!.user_job_detail!.isNotEmpty
                                      ? Text('จบปี: ${controller.userDetail?.user_job_detail?[0].finished ?? ''}')
                                      : Text('จบปี:'),
                                  SizedBox(
                                    width: size.height * 0.05,
                                  ),
                                  controller.userDetail!.user_job_detail!.isNotEmpty
                                      ? Text('เกรดเฉลี่ย: ${controller.userDetail?.user_job_detail?[0].grade ?? ''}')
                                      : Text('เกรดเฉลี่ย:'),
                                  controller.userDetail!.user_job_detail!.isNotEmpty
                                      ? Text(
                                          'ตำแหน่งที่ต้องการ: ${controller.userDetail?.user_job_detail?[0].position ?? ''}')
                                      : Text('ตำแหน่งที่ต้องการ:'),
                                  controller.userDetail!.user_job_detail!.isNotEmpty
                                      ? Text('ระดับภาษาไทย: ${controller.userDetail?.user_job_detail?[0].thai ?? ''}')
                                      : SizedBox.shrink(),
                                  controller.userDetail!.user_job_detail!.isNotEmpty
                                      ? Text(
                                          'ระดับภาษาอังกฤษ: ${controller.userDetail?.user_job_detail?[0].english ?? ''}')
                                      : SizedBox.shrink(),
                                  controller.userDetail!.user_job_detail!.isNotEmpty
                                      ? Text('ระดับภาษาจีน: ${controller.userDetail?.user_job_detail?[0].china ?? ''}')
                                      : SizedBox.shrink(),
                                  controller.userDetail!.user_job_detail!.isNotEmpty
                                      ? Text(
                                          'ระดับภาษาญี่ปุ่น: ${controller.userDetail?.user_job_detail?[0].japan ?? ''}')
                                      : SizedBox.shrink(),
                                  SizedBox(
                                    width: size.height * 0.05,
                                  ),
                                  controller.userDetail!.user_job_detail!.isNotEmpty
                                      ? Text('ประสบการณ์: ${controller.userDetail?.user_job_detail?[0].exp ?? ''}')
                                      : Text('ประสบการณ์:'),
                                  SizedBox(
                                    width: size.height * 0.05,
                                  ),
                                  controller.userDetail!.user_job_detail!.isNotEmpty
                                      ? Text('แนะนำ: ${controller.userDetail?.user_job_detail?[0].remark ?? ''}')
                                      : Text('แนะนำ:'),
                                  Divider(
                                    thickness: 3,
                                  ),
                                ],
                              ),
                            ),
                          )
                    // Card(
                    //     margin: EdgeInsets.zero,
                    //     elevation: 30,
                    //     color: Color.fromARGB(255, 130, 194, 246),
                    //     shape: RoundedRectangleBorder(
                    //       side: BorderSide(
                    //         color: Colors.lightBlueAccent,
                    //         width: 2.0,
                    //       ),
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     child: Padding(
                    //       padding: EdgeInsets.symmetric(horizontal: size.height * 0.03, vertical: size.width * 0.05),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Row(
                    //             children: [
                    //               SizedBox(
                    //                   height: size.height * 0.07,
                    //                   width: size.width * 0.15,
                    //                   child: controller.userDetail!.image != null
                    //                       ? CircleAvatar(
                    //                           backgroundColor: Colors.transparent,
                    //                           radius: 80,
                    //                           child: ClipOval(
                    //                             child: Image.network(
                    //                               controller.userDetail!.image!,
                    //                               width: 60,
                    //                               height: 60,
                    //                               fit: BoxFit.cover,
                    //                             ),
                    //                           ),
                    //                         )
                    //                       : Image.asset('assets/icons/user.png')),
                    //               SizedBox(
                    //                 width: size.width * 0.03,
                    //               ),
                    //               Column(
                    //                 crossAxisAlignment: CrossAxisAlignment.start,
                    //                 children: [
                    //                   Text(
                    //                     controller.userDetail?.name ?? '',
                    //                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    //                   ),
                    //                   Text('ชื่อเล่น: อานน')
                    //                 ],
                    //               ),
                    //             ],
                    //           ),
                    //           SizedBox(
                    //             height: 15,
                    //           ),
                    //           Text('เพศ: ${controller.userDetail?.gender ?? '-'} '),
                    //           Text('วันเกิด: ${controller.userDetail?.birthday ?? '-'} '),
                    //           Text('อายุ: ${controller.userDetail?.age ?? '-'} ปี'),
                    //           Text('เบอร์: ${controller.userDetail?.phone ?? '-'} '),
                    //           Text('สถานะ: ${controller.userDetail?.marital ?? '-'} '),
                    //           SizedBox(
                    //             width: size.height * 0.05,
                    //           ),
                    //           Row(
                    //             children: [
                    //               Expanded(child: Text('ที่อยู่: ${controller.userDetail?.address ?? '-'} ')),
                    //             ],
                    //           ),
                    //           SizedBox(
                    //             width: size.height * 0.05,
                    //           ),
                    //           Divider(
                    //             thickness: 3,
                    //           ),
                    //           controller.userDetail!.user_job_detail!.isNotEmpty
                    //               ? Text(
                    //                   'สถานศึกษา: ${controller.userDetail?.user_job_detail?[0].location_of_educate ?? ''}')
                    //               : Text('สถานศึกษา:'),
                    //           SizedBox(
                    //             width: size.height * 0.05,
                    //           ),
                    //           controller.userDetail!.user_job_detail!.isNotEmpty
                    //               ? Text('การศึกษา: ${controller.userDetail?.user_job_detail?[0].degree ?? ''}')
                    //               : Text('การศึกษา:'),
                    //           SizedBox(
                    //             width: size.height * 0.05,
                    //           ),
                    //           controller.userDetail!.user_job_detail!.isNotEmpty
                    //               ? Text('สาขา: ${controller.userDetail?.user_job_detail?[0].major ?? ''}')
                    //               : Text('สาขา:'),
                    //           SizedBox(
                    //             width: size.height * 0.05,
                    //           ),
                    //           controller.userDetail!.user_job_detail!.isNotEmpty
                    //               ? Text('จบปี: ${controller.userDetail?.user_job_detail?[0].finished ?? ''}')
                    //               : Text('จบปี:'),
                    //           SizedBox(
                    //             width: size.height * 0.05,
                    //           ),
                    //           controller.userDetail!.user_job_detail!.isNotEmpty
                    //               ? Text('เกรดเฉลี่ย: ${controller.userDetail?.user_job_detail?[0].grade ?? ''}')
                    //               : Text('เกรดเฉลี่ย:'),
                    //           controller.userDetail!.user_job_detail!.isNotEmpty
                    //               ? Text(
                    //                   'ตำแหน่งที่ต้องการ: ${controller.userDetail?.user_job_detail?[0].position ?? ''}')
                    //               : Text('ตำแหน่งที่ต้องการ:'),
                    //           controller.userDetail!.user_job_detail!.isNotEmpty
                    //               ? Text('ระดับภาษาไทย: ${controller.userDetail?.user_job_detail?[0].thai ?? ''}')
                    //               : SizedBox.shrink(),
                    //           controller.userDetail!.user_job_detail!.isNotEmpty
                    //               ? Text('ระดับภาษาอังกฤษ: ${controller.userDetail?.user_job_detail?[0].english ?? ''}')
                    //               : SizedBox.shrink(),
                    //           controller.userDetail!.user_job_detail!.isNotEmpty
                    //               ? Text('ระดับภาษาจีน: ${controller.userDetail?.user_job_detail?[0].china ?? ''}')
                    //               : SizedBox.shrink(),
                    //           controller.userDetail!.user_job_detail!.isNotEmpty
                    //               ? Text('ระดับภาษาญี่ปุ่น: ${controller.userDetail?.user_job_detail?[0].japan ?? ''}')
                    //               : SizedBox.shrink(),
                    //           SizedBox(
                    //             width: size.height * 0.05,
                    //           ),
                    //           controller.userDetail!.user_job_detail!.isNotEmpty
                    //               ? Text('ประสบการณ์: ${controller.userDetail?.user_job_detail?[0].exp ?? ''}')
                    //               : Text('ประสบการณ์:'),
                    //           SizedBox(
                    //             width: size.height * 0.05,
                    //           ),
                    //           controller.userDetail!.user_job_detail!.isNotEmpty
                    //               ? Text('แนะนำ: ${controller.userDetail?.user_job_detail?[0].remark ?? ''}')
                    //               : Text('แนะนำ:'),
                    //           SizedBox(
                    //             width: size.height * 0.05,
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: widget.titie == 'meetings'
                ? BottomAppBar(
                    clipBehavior: Clip.hardEdge,
                    //shape: CircularNotchedRectangle(),
                    elevation: 25,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      height: size.height * 0.07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return ShowAlertFrom(
                                  idUser: widget.id,
                                  idPosition: widget.idPosition,
                                );
                              }));
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
                  )
                : SizedBox.shrink());
      },
    );
  }
}

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
