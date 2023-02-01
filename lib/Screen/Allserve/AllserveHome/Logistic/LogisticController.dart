import 'package:allserve/Models/Logistic/logistic.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Models/User/user.dart';
import '../../../../Models/detailVendor.dart';
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
  Logistic? quotationDetail;
  List<DetailVendor> detailLogistic = [];

  // DetailScrapCompany
  Future<void> detailLogisticCompany(
    int id,
  ) async {
    logisticCompanyDetail.clear();
    final _loadDatil = await LogisticSrevice.getLogisticCompany(companyId: id);
    logisticCompanyDetail = (_loadDatil);
    logisticCompanyDetail[0].logistics!.sort((a, b) => b.id!.compareTo(a.id!));

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

  // DetailQuotationLogistic
  Future<void> detailQuotation(
    int id,
  ) async {
    quotationDetail = null;
    pref = await SharedPreferences.getInstance();
    token = pref?.getString('token');
    quotationDetail = await LogisticSrevice.getQuotatianLogistic(itemId: id);

    notifyListeners();
  }

  //โหลดรายละเอียด VendorLogistic
  Future<void> loadDetailVendorLogistic() async {
    detailLogistic.clear();
    final _loadPositionS = await LogisticSrevice.getVendorLogistic();
    detailLogistic.addAll(_loadPositionS);
    // positionCompany[0].recruitment_companies!.sort((a, b) => b.id!.compareTo(a.id!));
    notifyListeners();
  }
}
