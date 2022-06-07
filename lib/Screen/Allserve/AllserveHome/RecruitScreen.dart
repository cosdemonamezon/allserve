import 'package:allserve/Screen/Allserve/AllserveHome/AddRecruitScreen.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/Widgets/PeopleWidget.dart';
import 'package:allserve/Screen/Widgets/SearchTextField.dart';
import 'package:flutter/material.dart';

class RecruitScreen extends StatefulWidget {
  RecruitScreen({Key? key}) : super(key: key);

  @override
  State<RecruitScreen> createState() => _RecruitScreenState();
}

class _RecruitScreenState extends State<RecruitScreen> {
  List peoplelist = [
    {
      "img": "assets/icons/user.png",
      "name": "thawatchai AAAA",
      "study": "การศึกษาระดับปริญญาตรี",
      "jobtitle": "Programmer"
    },
    {
      "img": "assets/icons/user.png",
      "name": "thawatchai BBBB",
      "study": "การศึกษาระดับปริญญาตรี",
      "jobtitle": "HR"
    },
    {
      "img": "assets/icons/user.png",
      "name": "thawatchai CCCC",
      "study": "การศึกษาระดับปริญญาตรี",
      "jobtitle": "Sale"
    },
    {
      "img": "assets/icons/user.png",
      "name": "thawatchai DDDD",
      "study": "การศึกษาระดับปริญญาตรี",
      "jobtitle": "Engineer"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recruit',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SearchTextField(),
              ),
              SizedBox(
                height: 10,
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: peoplelist
                    .map((data) => PeopleWidget(
                          listdata: data,
                          use: true,
                          press: () {},
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddRecruitScreen()));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
