import 'package:allserve/Models/Scrap/scrap.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Models/User/user.dart';
import '../../../../Models/vendor.dart';
import '../../../../Models/vendorPage.dart';
import 'ScrapSrevice.dart';

class ScrapController extends ChangeNotifier {
  ScrapController({this.scrapSrevice = const ScrapSrevice()});

  ScrapSrevice scrapSrevice;
  String? token;
  SharedPreferences? pref;
  // List<Scrap> scrapAll = [];
  List<User> scrapCompanyDetail = [];
  bool hasmore = true;
  int page = 0;
  List<Vendor> listCompanyScrap = [];
  Vendor? vendorDetail;
  Scrap? quotationScrapDetail;
  // User? scrapCompanyDetail;

  // //โหลด User มาแสดงทั้งหมด
  // Future<void> loadScrap() async {
  //   final _loadScrap = await ScrapSrevice.getScrap();
  //   scrapAll = (_loadScrap);

  //   notifyListeners();
  // }

  // DetailScrapCompany
  Future<void> detailScrapCompany(
    int id,
  ) async {
    scrapCompanyDetail.clear();
    final _loadDatil = await ScrapSrevice.getScrapCompany(companyId: id);
    scrapCompanyDetail.addAll(_loadDatil);

    notifyListeners();
  }

// โหลดรายชื่อบริษัทScrap
  Future loadCompanyScrap({
    int page = 0,
    int draw = 1,
  }) async {
    listCompanyScrap.clear();
    final loadItem = await ScrapSrevice.getCompanyVendor(
      draw: draw,
      start: page,
      length: 100,
      type: 'scrap',
    );

    listCompanyScrap.addAll(loadItem);

    page++;
    draw++;
    if (loadItem.length < 5) {
      hasmore = false;
    }
    notifyListeners();
  }

  // เรียกบริษัท Vendor ตามID
  Future<void> detailVendor(
    int id,
  ) async {
    vendorDetail = null;
    pref = await SharedPreferences.getInstance();
    token = pref?.getString('token');
    vendorDetail = await ScrapSrevice.getVendorId(vendorId: id);

    notifyListeners();
  }

  // DetailQuotationv
  Future<void> detailScrapQuotation(
    int id,
  ) async {
    quotationScrapDetail = null;
    pref = await SharedPreferences.getInstance();
    token = pref?.getString('token');
    quotationScrapDetail = await ScrapSrevice.getQuotatianScrap(itemId: id);

    notifyListeners();
  }
}
