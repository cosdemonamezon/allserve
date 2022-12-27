import 'package:allserve/Screen/Allserve/AllserveHome/AddJobScreen.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/AddRecruitScreen.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/DetailRecruit.dart';
import 'package:allserve/Screen/Allserve/AllserveHome/Widgets/PeopleWidget.dart';
import 'package:allserve/Screen/Widgets/SearchTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../appTheme.dart';
import '../../app/AppController.dart';
import 'AllServeController.dart';
import 'DetailsApplicant.dart';

class RecruitScreen extends StatefulWidget {
  RecruitScreen({Key? key}) : super(key: key);

  @override
  State<RecruitScreen> createState() => _RecruitScreenState();
}

class _RecruitScreenState extends State<RecruitScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  List peoplelist = [
    {
      "img": "assets/icons/user.png",
      "name": "thawatchai AAAA",
      "study": "การศึกษาระดับปริญญาตรี",
      "jobtitle": "Programmer"
    },
    {"img": "assets/icons/user.png", "name": "thawatchai BBBB", "study": "การศึกษาระดับปริญญาตรี", "jobtitle": "HR"},
    {"img": "assets/icons/user.png", "name": "thawatchai CCCC", "study": "การศึกษาระดับปริญญาตรี", "jobtitle": "Sale"},
    {
      "img": "assets/icons/user.png",
      "name": "thawatchai DDDD",
      "study": "การศึกษาระดับปริญญาตรี",
      "jobtitle": "Engineer"
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadItem();
  }

  Future _loadItem() async {
    final userId = await context.read<AppController>().user!.id;
    await context.read<JobController>().loadUserAllJob();
    await context.read<JobController>().loadPositionCompay(Id: userId!);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appFontSize = AppFontSize.of(context);
    final userId = context.read<AppController>().user!.id;
    return Consumer<JobController>(
      builder: (context, controller, child) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Recruit',
              //style: TextStyle(color: Colors.deepOrange),
            ),
            bottom: TabBar(
              //isScrollable: true,
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'NotoSansThai'),
              tabs: [
                Tab(text: 'รายชื่อผู้หางาน'),
                Tab(text: 'รายการหาพนักงาน'),
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
          body: SafeArea(
            child: TabBarView(
              controller: _tabController,
              children: [
                //Tab1
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: SearchTextField(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          padding: EdgeInsets.all(15),
                          child: controller.uesrAllJob.isEmpty
                              ? Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: controller.uesrAllJob.length,
                                  itemBuilder: (_, index) {
                                    return controller.uesrAllJob == null
                                        ? Center(child: CircularProgressIndicator())
                                        : Stack(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => DetailsApplicant(
                                                                id: controller.uesrAllJob[index].id!,
                                                                titie: 'DetailJob',
                                                              )));
                                                },
                                                child: Container(
                                                  width: size.width,
                                                  margin: EdgeInsets.only(right: 25, left: 25, top: 15),
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage('assets/images/promotionBG.png'),
                                                      fit: BoxFit.fill,
                                                    ),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                          offset: Offset(0, 2),
                                                          color: Color.fromRGBO(0, 78, 179, 0.05),
                                                          blurRadius: 10)
                                                    ],
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child: Image.asset("assets/icons/user.png",
                                                              height: size.height / 17),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                          flex: 8,
                                                          child: Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 5),
                                                            child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    'ชื่อ: ${controller.uesrAllJob[index].name ?? ''}',
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: appFontSize?.body),
                                                                    overflow: TextOverflow.fade,
                                                                    maxLines: 1,
                                                                  ),
                                                                  SizedBox(height: 5),
                                                                  // if (controller
                                                                  //     .uesrAllJob[index].user_job_detail!.isNotEmpty) ...[
                                                                  controller
                                                                          .uesrAllJob[index].user_job_detail!.isNotEmpty
                                                                      ? Text(
                                                                          'สาขา: ${controller.uesrAllJob[index].user_job_detail?[0].major ?? ''}',
                                                                          style:
                                                                              TextStyle(fontSize: appFontSize?.body2),
                                                                          overflow: TextOverflow.ellipsis,
                                                                        )
                                                                      : Text('สาขา:'),
                                                                  SizedBox(height: 4),
                                                                  controller
                                                                          .uesrAllJob[index].user_job_detail!.isNotEmpty
                                                                      ? Text(
                                                                          'การศึกษา: ${controller.uesrAllJob[index].user_job_detail?[0].degree ?? ''}',
                                                                          style:
                                                                              TextStyle(fontSize: appFontSize?.body2),
                                                                          overflow: TextOverflow.ellipsis,
                                                                        )
                                                                      : Text('การศึกษา:'),
                                                                  SizedBox(height: 4),
                                                                  controller
                                                                          .uesrAllJob[index].user_job_detail!.isNotEmpty
                                                                      ? Text(
                                                                          'งานที่สมัคร: ${controller.uesrAllJob[index].user_job_detail?[0].position ?? ''}',
                                                                          style:
                                                                              TextStyle(fontSize: appFontSize?.body2),
                                                                          overflow: TextOverflow.ellipsis,
                                                                        )
                                                                      : Text('งานที่สมัคร:'),
                                                                  SizedBox(height: 4),
                                                                ]
                                                                // ],
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                  })),
                    ],
                  ),
                ),
                //Tab2
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        controller.positionCompany.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.positionCompany[0].recruitment_companies!.length,
                                itemBuilder: (_, index2) {
                                  return ListTile(
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(controller.positionCompany[0].recruitment_companies?[index2].position ??
                                            ''),
                                        Text(
                                            '${controller.positionCompany[0].recruitment_companies?[index2].qty ?? ''} ตำแหน่ง'),
                                      ],
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'วุฒิการศึกษา: ${controller.positionCompany[0].recruitment_companies?[index2].degree ?? ''} '),
                                        Text(
                                            'สาขา: ${controller.positionCompany[0].recruitment_companies?[index2].major ?? ''} '),
                                        Text(
                                            'เงินเดือน: ${controller.positionCompany[0].recruitment_companies?[index2].salary ?? ''} บาท'),
                                        Text(
                                            'ลักษณะงาน: ${controller.positionCompany[0].recruitment_companies?[index2].description ?? ''} '),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                'ประสบการณ์ ${controller.positionCompany[0].recruitment_companies?[index2].exp ?? ''} ปี'),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => DetailRecruit(
                                                                idPosition: controller.positionCompany[0]
                                                                    .recruitment_companies![index2].id!,
                                                              )));
                                                },
                                                icon: Icon(Icons.remove_red_eye)),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 2,
                                        ),
                                      ],
                                    ),
                                  );
                                })
                            : Center(child: CircularProgressIndicator()),
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: size.height * 0.10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddRecruitScreen(
                                                id: userId!,
                                              )));
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
                                      'เพิ่มรายการ',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => AddRecruitScreen(
          //                   id: userId!,
          //                 )));
          //   },
          //   backgroundColor: Colors.blue,
          //   child: const Icon(Icons.add),
          // ),
        ),
      ),
    );
  }
}
