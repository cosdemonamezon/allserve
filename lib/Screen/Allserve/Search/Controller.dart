import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Models/microsoft.dart';
import 'Service.dart';

class SearchController extends ChangeNotifier {
  SearchController({this.searchService = const SearchService()});

  SearchService searchService;
  String? token;
  SharedPreferences? pref;
  List<Microsoft> logoMicrosoft = [];
  Microsoft? detailMicrosoft;

  Future<void> loadLogoMicrosoft() async {
    logoMicrosoft.clear();
    final _loadItem = await SearchService.listMicrosoft();

    // for (var company in _loadItem) {
    //   final positions = await JobService.getPosition(companyId: company.id!);
    //   inspect(positions[0].recruitment_companies);
    //   if (positions[0].recruitment_companies!.isNotEmpty) {
    //     logoCompay.add(company);
    //   }
    // }

    logoMicrosoft = (_loadItem);

    notifyListeners();
  }

  // DetailQuotationv
  Future<void> microsoftDetail(
    int id,
  ) async {
    detailMicrosoft = null;
    pref = await SharedPreferences.getInstance();
    token = pref?.getString('token');
    detailMicrosoft = await SearchService.getMicrosoftDetail(itemId: id);

    notifyListeners();
  }
}
