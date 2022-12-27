import 'package:flutter/material.dart';

import '../../../Models/microsoft.dart';
import 'Service.dart';

class SearchController extends ChangeNotifier {
  SearchController({this.searchService = const SearchService()});

  SearchService searchService;
  List<Microsoft> logoMicrosoft = [];

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
}
