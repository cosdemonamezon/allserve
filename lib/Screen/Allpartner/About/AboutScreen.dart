import 'package:allserve/Screen/Alljob/Job/Widgets/ListJobCompanies.dart';
import 'package:allserve/Screen/Login/Widgets/AppTextForm.dart';
import 'package:allserve/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final GlobalKey<FormState> editFormKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  void launchEmailSubmission() async {
    final Uri params = Uri(
        scheme: 'mailto',
        path: 'demonridercos@gmail.com',
        queryParameters: {
          'subject': 'Default Subject',
          'body': 'Default body'
        });
    String url = params.toString();
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  void launchTel() async {
    String url = 'tel://0922568260';
    if (url != '') {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เกี่ยวกับบริษัท',
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
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              // Center(
              //     child: Text(
              //   'ข้อมูลบริษัท',
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // )),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 230,
                //color: Colors.blue,
                child: Stack(
                  children: [
                    Positioned(
                        top: 35,
                        left: 10,
                        child: Material(
                          child: Container(
                            height: 180.0,
                            width: size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: Offset(0, 0),
                                    blurRadius: 20.0,
                                    spreadRadius: 4.0,
                                  ),
                                ]),
                          ),
                        )),
                    Positioned(
                      top: 0,
                      left: 20,
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.grey.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "assets/images/gettyimages.png")),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 180,
                      child: Container(
                        height: 170,
                        width: 190,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "บริษัท อาชาเทค",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF363f93)),
                                ),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.edit)),
                              ],
                            ),
                            Text(
                              "รับเขียนโปแกรม แอพพลิเคชั่น โมบาย, งานไอทีและเทคโนโลยีทุกรูปแบบ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      launchEmailSubmission();
                                    },
                                    icon: Icon(Icons.email)),
                                SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                    onPressed: () {
                                      launchTel();
                                    },
                                    icon: Icon(Icons.phone)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('การกำกับดูแลกิจการ'),
                          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                        ],
                      ),
                      subtitle: Text(
                        comData,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: jobCom
                    .map((data) => ListJobCompanies(
                          companydata: data,
                          use: true,
                          press: () {},
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
