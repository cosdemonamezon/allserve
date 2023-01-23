import 'package:allserve/Screen/Allserve/AllserveHome/Logistic/LogisticPage.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/purchase/purchasePage.dart';
import 'package:flutter/material.dart';

import '../RecruitScreen.dart';
import '../Scrap/companyScrapPage.dart';

class ScreenAll extends StatefulWidget {
  const ScreenAll({super.key});

  @override
  State<ScreenAll> createState() => _ScreenAllState();
}

class _ScreenAllState extends State<ScreenAll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      color: Color.fromARGB(255, 255, 255, 255),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'เมนูทั้งหมด',
            //   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // GridView.count(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   scrollDirection: Axis.vertical,
            //   crossAxisCount: 4,
            //   children: [
            //     Manu(
            //       name: "จัดซื้อ จัดจ้าง",
            //       image: 'assets/icons/Recruit.png',
            //       onTap: () {
            //         Navigator.push(context, MaterialPageRoute(builder: ((context) {
            //           return RecruitScreen();
            //         })));
            //       },
            //     ),
            //     Manu(
            //       name: "กำจัดของเสีย",
            //       image: "assets/icons/ScrapEnvironment.png",
            //       onTap: () {
            //         Navigator.push(context, MaterialPageRoute(builder: ((context) {
            //           return CompanyScrapPage();
            //         })));
            //       },
            //     ),
            //     Manu(
            //       name: "ขนส่ง",
            //       image: 'assets/Logistic_B_512px.png',
            //       onTap: () {
            //         Navigator.push(context, MaterialPageRoute(builder: (context) {
            //           return LogisticPage();
            //         }));
            //       },
            //     ),
            //     Manu(
            //       name: "จัดซื้อ จัดจ้าง",
            //       image: 'assets/Purchase_512px.png',
            //       onTap: () {
            //         Navigator.push(context, MaterialPageRoute(builder: ((context) {
            //           return PurchasePage();
            //         })));
            //       },
            //     ),
            //     Manu(
            //       name: "ขายและการตลาด",
            //       image: "assets/icons/SalesCRM.png",
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "สินค้าชุมชนสู่เมือง",
            //       image: 'assets/Local to the City_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "City to the locla",
            //       image: 'assets/City to the Local_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "แบ่งปัน",
            //       image: 'assets/Share_B_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "หน่วยงานรัฐ",
            //       image: 'assets/Govt Link_B_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "รับส่งพัสดุ",
            //       image: 'assets/Express_C_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "คลังสินค้า",
            //       image: 'assets/Warehouse & DC_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "การจ่ายแบบเครดิต",
            //       image: 'assets/Pay_B_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "การประชุม",
            //       image: 'assets/Meeting Conference_B_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "ค้นหา",
            //       image: 'assets/Seach_A_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "การจ่ายแบบเครดิต",
            //       image: 'assets/Creditpay_B_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "กู้ยืมและรีไฟแนนซ์ ",
            //       image: 'assets/Loan & Refinance_B_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "กฎหมาย",
            //       image: 'assets/Legal & Consult_B_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "การลงทุน",
            //       image: 'assets/Investment_A_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "นำเข้า ส่งออก",
            //       image: 'assets/Import & Export_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "เครื่องหมายรับประกัน",
            //       image: 'assets/Certified & Trust Brand_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "บริการรายเดือน",
            //       image: 'assets/All_Subcription_A_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "กิจกรรมเพื่อสังคม",
            //       image: 'assets/CSR & Social Enterprise_B_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "สินค้าและบริการ ",
            //       image: 'assets/E - Catalogue_B_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "บริการคลาด์",
            //       image: 'assets/Cloud Service_B_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "บูทและอีเว้นท์ ",
            //       image: 'assets/Event & Exhibition_A_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "น้ำมันและก๊าซ",
            //       image: 'assets/Energy & Gas_B_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "การประมูล",
            //       image: 'assets/RFQ& BIDDING_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "แบงก์กันรันตี ",
            //       image: 'assets/Bank Ganruntee_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: " สินค้ามือสอง",
            //       image: 'assets/Second Hand Products_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "ความปลอดภัย",
            //       image: 'assets/Security_A_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "ซื้อสินค้าแบบกลุ่ม",
            //       image: 'assets/Quota_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "ประกันภัย",
            //       image: 'assets/Insurance_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "ตั๋ว",
            //       image: 'assets/Ticket_A_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "อาหาร",
            //       image: 'assets/Food_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "ทริปท่องเที่ยว",
            //       image: 'assets/Trip & Vacation_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "นักพัฒนา",
            //       image: 'assets/ALLZ for Developer_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "เกมส์",
            //       image: 'assets/ALLZ Game_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "เพลง",
            //       image: 'assets/ALLZ Music_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "สื่อบันเทิง",
            //       image: 'assets/ALLZ Entertainment_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "การค้าและลงทุน",
            //       image: 'assets/ALLZ Trade & Investment_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //     Manu(
            //       name: "อื่นๆ",
            //       image: 'assets/All_Fullfillment_D_512px.png',
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => ComingSoon(),
            //         );
            //       },
            //     ),
            //   ],
            // ),
            Text(
              'Sales & Marketing',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              crossAxisCount: 4,
              children: [
                Manu(
                  name: "ขายและการตลาด",
                  image: "assets/icons/SalesCRM.png",
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
              ],
            ),
            Text(
              'HR',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              crossAxisCount: 4,
              children: [
                Manu(
                  name: "สรรหาบุคลากร",
                  image: 'assets/icons/Recruit.png',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) {
                      return RecruitScreen();
                    })));
                  },
                ),
              ],
            ),
            Text(
              'Purchase',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              crossAxisCount: 4,
              children: [
                Manu(
                  name: "จัดซื้อ จัดจ้าง",
                  image: 'assets/Purchase_512px.png',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) {
                      return PurchasePage();
                    })));
                  },
                ),
                Manu(
                  name: "กำจัดของเสีย",
                  image: "assets/icons/ScrapEnvironment.png",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) {
                      return CompanyScrapPage();
                    })));
                  },
                ),
                Manu(
                  name: "นำเข้า ส่งออก",
                  image: 'assets/Import & Export_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "บริการรายเดือน",
                  image: 'assets/All_Subcription_A_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "สินค้าและบริการ ",
                  image: 'assets/E - Catalogue_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "บริการคลาด์",
                  image: 'assets/Cloud Service_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "บูทและอีเว้นท์ ",
                  image: 'assets/Event & Exhibition_A_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "การประมูล",
                  image: 'assets/RFQ& BIDDING_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: " สินค้ามือสอง",
                  image: 'assets/Second Hand Products_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "ซื้อสินค้าแบบกลุ่ม",
                  image: 'assets/Quota_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
              ],
            ),
            Text(
              'Accounting',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              crossAxisCount: 4,
              children: [
                Manu(
                  name: "การชำระเงิน",
                  image: 'assets/Pay_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "การจ่ายแบบเครดิต",
                  image: 'assets/Creditpay_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "กู้ยืมและรีไฟแนนซ์ ",
                  image: 'assets/Loan & Refinance_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "น้ำมันและก๊าซ",
                  image: 'assets/Energy & Gas_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "แบงก์กันรันตี ",
                  image: 'assets/Bank Ganruntee_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
              ],
            ),
            Text(
              'Logistic and Store',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              crossAxisCount: 4,
              children: [
                Manu(
                  name: "ขนส่ง",
                  image: 'assets/Logistic_B_512px.png',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return LogisticPage();
                    }));
                  },
                ),
                Manu(
                  name: "รับส่งพัสดุ",
                  image: 'assets/Express_C_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "คลังสินค้า",
                  image: 'assets/Warehouse & DC_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
              ],
            ),
            Text(
              'PR Department',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              crossAxisCount: 4,
              children: [
                Manu(
                  name: "สินค้าชุมชนสู่เมือง",
                  image: 'assets/Local to the City_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "แบ่งปัน",
                  image: 'assets/Share_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "หน่วยงานรัฐ",
                  image: 'assets/Govt Link_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "กิจกรรมเพื่อสังคม",
                  image: 'assets/CSR & Social Enterprise_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
              ],
            ),
            Text(
              'Investment',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              crossAxisCount: 4,
              children: [
                Manu(
                  name: "การลงทุน",
                  image: 'assets/Investment_A_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "การค้าและลงทุน",
                  image: 'assets/ALLZ Trade & Investment_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
              ],
            ),
            Text(
              'Meeting',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              crossAxisCount: 4,
              children: [
                Manu(
                  name: "การประชุม",
                  image: 'assets/Meeting Conference_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
              ],
            ),
            Text(
              'Privilege & Fulfillment',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              crossAxisCount: 4,
              children: [
                Manu(
                  name: "ค้นหา",
                  image: 'assets/Seach_A_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "กฎหมาย",
                  image: 'assets/Legal & Consult_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "เครื่องหมายรับประกัน",
                  image: 'assets/Certified & Trust Brand_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "ความปลอดภัย",
                  image: 'assets/Security_A_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "ประกันภัย",
                  image: 'assets/Insurance_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "ตั๋ว",
                  image: 'assets/Ticket_A_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "อาหาร",
                  image: 'assets/Food_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "ทริปท่องเที่ยว",
                  image: 'assets/Trip & Vacation_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "นักพัฒนา",
                  image: 'assets/ALLZ for Developer_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "เกมส์",
                  image: 'assets/ALLZ Game_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "เพลง",
                  image: 'assets/ALLZ Music_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "สื่อบันเทิง",
                  image: 'assets/ALLZ Entertainment_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "อื่นๆ",
                  image: 'assets/All_Fullfillment_D_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ComingSoon extends StatelessWidget {
  const ComingSoon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
      elevation: 0,
      content: Image.asset(
        'assets/—Pngtree—coming soon yellow offer details_6530248.png',
        fit: BoxFit.cover,
        height: 400,
        width: 400,
      ),
      actions: [
        Center(
          child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.cancel_outlined,
                size: 100,
                color: Colors.white,
              )),
        )
      ],
    );
  }
}

class Manu extends StatelessWidget {
  Manu({Key? key, this.name, this.image, this.onTap}) : super(key: key);
  String? name;
  String? image;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name!,
          style: TextStyle(fontSize: 12, color: Colors.black),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        InkWell(
          onTap: onTap,
          child: SizedBox(
            child: Image.asset(
              image!,
              //color: Colors.blue,
              height: 60,
            ),
          ),
        ),
      ],
    );
  }
}
