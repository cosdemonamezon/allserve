import 'package:allserve/Models/User/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Models/UserJob/userJob.dart';
import 'AllServeService.dart';

class JobController extends ChangeNotifier {
  JobController({this.jarketService = const JobService()});

  JobService jarketService;
  String? token;
  SharedPreferences? pref;
  List<UserJob> uesrAllJob = [];
  UserJob? userDetail;
  List<User> positionCompany = [];

//โหลด User มาแสดงทั้งหมด
  Future<void> loadUserAllJob() async {
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
    required int Id,
  }) async {
    final _loadPosition = await JobService.getPosition(companyId: Id);
    positionCompany = (_loadPosition);

    notifyListeners();
  }
}
