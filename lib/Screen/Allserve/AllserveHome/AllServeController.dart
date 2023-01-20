import 'dart:developer';

import 'package:allserve/Models/User/user.dart';
import 'package:allserve/Models/meetings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Models/Company/compay.dart';
import '../../../Models/UserJob/userJob.dart';
import 'AllServeService.dart';

class JobController extends ChangeNotifier {
  JobController({this.jarketService = const JobService()});

  JobService jarketService;
  String? token;
  SharedPreferences? pref;
  List<UserJob> uesrAllJob = [];
  List<Compay> logoCompay = [];
  UserJob? userDetail;
  List<User> positionCompany = [];
  List<Meetings> meetings = [];

  Future<void> loadLogoCompay() async {
    logoCompay.clear();
    final _loadItem = await JobService.listCompany();

    // for (var company in _loadItem) {
    //   final positions = await JobService.getPosition(companyId: company.id!);
    //   inspect(positions[0].recruitment_companies);
    //   if (positions[0].recruitment_companies!.isNotEmpty) {
    //     logoCompay.add(company);
    //   }
    // }

    logoCompay = (_loadItem);

    notifyListeners();
  }

//โหลด User มาแสดงทั้งหมด
  Future<void> loadUserAllJob() async {
    uesrAllJob.clear();
    final _loadUserAllJob = await JobService.getUserAllJob();
    uesrAllJob = (_loadUserAllJob);

    notifyListeners();
  }

// DetailUserJob
  Future<void> detailUser(
    int id,
  ) async {
    userDetail = null;
    pref = await SharedPreferences.getInstance();
    token = pref?.getString('token');
    userDetail = await JobService.getUserIdJob(userId: id);

    notifyListeners();
  }

//โหลดPosition ของUser
  Future<void> loadPositionCompay({
    required int id,
  }) async {
    positionCompany.clear();
    final _loadPosition = await JobService.getPosition(companyId: id);
    positionCompany = (_loadPosition);
    positionCompany[0].recruitment_companies!.sort((a, b) => b.id!.compareTo(a.id!));
    notifyListeners();
  }

  // DetailMeetings
  Future<void> getMeetings(
    int id,
  ) async {
    final _loadMeetings = await JobService.getMeetings(companyId: id);
    meetings = (_loadMeetings);

    notifyListeners();
  }
}
