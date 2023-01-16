import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Models/User/user.dart';
import '../../../../Models/vendor.dart';
import '../Scrap/ScrapSrevice.dart';
import 'LogisiticSrevicer.dart';

class LogisticController extends ChangeNotifier {
  LogisticController({this.logisticSrevice = const LogisticSrevice()});

  LogisticSrevice logisticSrevice;
  String? token;
  SharedPreferences? pref;
  List<User> logisticCompanyDetail = [];
  bool hasmore = true;
  int page = 0;
  List<Vendor> listCompanyLogistic = [];

  // DetailScrapCompany
  Future<void> detailLogisticCompany(
    int id,
  ) async {
    logisticCompanyDetail.clear();
    final _loadDatil = await LogisticSrevice.getScrapCompany(companyId: id);
    logisticCompanyDetail = (_loadDatil);

    notifyListeners();
  }

  // โหลดรายชื่อบริษัทLogistic
  Future loadCompanyLogistic({
    int page = 0,
  }) async {
    listCompanyLogistic.clear();
    final loadItem = await ScrapSrevice.getCompanyVendor(
      start: page,
      length: 100,
      type: 'logistic',
    );

    listCompanyLogistic = (loadItem);

    page = page + 1;
    if (loadItem.length < 5) {
      hasmore = false;
    }
    notifyListeners();
  }
}
