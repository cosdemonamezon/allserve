import 'package:allserve/Screen/Allserve/AllserveHome/purchase/purchaseService.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Models/Purchase/purchase.dart';
import '../../../../Models/User/user.dart';
import '../../../../Models/detailVendor.dart';
import '../../../../Models/vendor.dart';
import '../Scrap/ScrapSrevice.dart';

class PurchaseController extends ChangeNotifier {
  PurchaseController({this.purchaseSrevice = const PurchaseSrevice()});

  PurchaseSrevice purchaseSrevice;
  String? token;
  SharedPreferences? pref;
  bool hasmore = true;
  bool isloading = false;
  bool allloded = false;
  int page = 0;
  List<Vendor> listCompanyPurchase = [];
  List<User> purchaseCompanyDetail = [];
  Purchase? quotationPurchaseDetail;
  List<DetailVendor> detailPurchase = [];

  // โหลดรายชื่อบริษัทPurchase
  Future loadCompanyPurchase({
    int page = 0,
    int draw = 1,
  }) async {
    listCompanyPurchase.clear();
    final loadItem = await ScrapSrevice.getCompanyVendor(
      draw: draw,
      start: page,
      length: 100,
      type: 'other',
    );

    listCompanyPurchase.addAll(loadItem);

    page++;
    draw++;
    isloading = true;
    if (loadItem.length < 10) {
      hasmore = false;
    }
    notifyListeners();
  }

  // DetailPurchaseCompany
  Future<void> detailPurchaseCompany(
    int id,
  ) async {
    purchaseCompanyDetail.clear();
    final _loadDatil = await PurchaseSrevice.getPurchaseCompany(companyId: id);
    purchaseCompanyDetail = (_loadDatil);
    purchaseCompanyDetail[0].puchases!.sort((a, b) => b.id!.compareTo(a.id!));

    notifyListeners();
  }

  // DetailQuotationPurchase
  Future<void> detailQuotationPurchase(
    int id,
  ) async {
    quotationPurchaseDetail = null;
    pref = await SharedPreferences.getInstance();
    token = pref?.getString('token');
    quotationPurchaseDetail = await PurchaseSrevice.getQuotatianPurchase(itemId: id);

    notifyListeners();
  }

  //โหลดรายละเอียด VendorPurchase
  Future<void> loadDetailVendorPurchase() async {
    detailPurchase.clear();
    final _loadPositionS = await PurchaseSrevice.getVendorPurchase();
    detailPurchase.addAll(_loadPositionS);
    // positionCompany[0].recruitment_companies!.sort((a, b) => b.id!.compareTo(a.id!));
    notifyListeners();
  }
}
