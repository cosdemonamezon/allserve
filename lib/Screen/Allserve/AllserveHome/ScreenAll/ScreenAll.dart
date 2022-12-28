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
      padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
      color: Color.fromARGB(255, 255, 255, 255),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'เมนูทั้งหมด',
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
                  name: "Scrap & Environment",
                  image: "assets/icons/ScrapEnvironment.png",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) {
                      return CompanyScrapPage();
                    })));
                  },
                ),
                Manu(
                  name: "Logistic",
                  image: 'assets/Logistic_B_512px.png',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return LogisticPage();
                    }));
                  },
                ),
                Manu(
                  name: "Recruit",
                  image: 'assets/icons/Recruit.png',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) {
                      return RecruitScreen();
                    })));
                  },
                ),
                Manu(
                  name: "Sales & CRM",
                  image: "assets/icons/SalesCRM.png",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) {
                      return PurchasePage();
                    })));
                  },
                ),
                Manu(
                  name: "Purchase",
                  image: 'assets/Purchase_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Locla to the city",
                  image: 'assets/Local to the City_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "city to the Locla",
                  image: 'assets/City to the Local_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Share",
                  image: 'assets/Share_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Govt Link",
                  image: 'assets/Govt Link_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Express",
                  image: 'assets/Express_C_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Warehouse & DC",
                  image: 'assets/Warehouse & DC_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Pay",
                  image: 'assets/Pay_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Meeting Conference",
                  image: 'assets/Meeting Conference_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Seach",
                  image: 'assets/Seach_A_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Creditpay",
                  image: 'assets/Creditpay_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Loan & Refinance",
                  image: 'assets/Loan & Refinance_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Legal & Consult",
                  image: 'assets/Legal & Consult_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Investment",
                  image: 'assets/Investment_A_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Import & Export",
                  image: 'assets/Import & Export_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Certified & Trust Brand",
                  image: 'assets/Certified & Trust Brand_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "All Subcription",
                  image: 'assets/All_Subcription_A_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "CSR & Social Enterpise",
                  image: 'assets/CSR & Social Enterprise_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "E - Catalogue",
                  image: 'assets/E - Catalogue_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Cloud Service",
                  image: 'assets/Cloud Service_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Event & Exhibition",
                  image: 'assets/Event & Exhibition_A_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Energy & Gas",
                  image: 'assets/Energy & Gas_B_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "RFQ & Bidding",
                  image: 'assets/RFQ& BIDDING_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Bank Ganruntee",
                  image: 'assets/Bank Ganruntee_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Second Hand Products",
                  image: 'assets/Second Hand Products_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Security",
                  image: 'assets/Security_A_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Quota",
                  image: 'assets/Quota_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Insurance",
                  image: 'assets/Insurance_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Ticket",
                  image: 'assets/Ticket_A_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Food",
                  image: 'assets/Food_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "Trip & Vacation",
                  image: 'assets/Trip & Vacation_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "ALLZ for Developer",
                  image: 'assets/ALLZ for Developer_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "ALLZ Game",
                  image: 'assets/ALLZ Game_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "ALLZ Music",
                  image: 'assets/ALLZ Music_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "ALLZ Entertainment",
                  image: 'assets/ALLZ Entertainment_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "ALLZ Trade & Investment",
                  image: 'assets/ALLZ Trade & Investment_512px.png',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ComingSoon(),
                    );
                  },
                ),
                Manu(
                  name: "All Fullfillment",
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
