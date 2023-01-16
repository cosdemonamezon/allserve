import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Models/User/user.dart';
import '../../../../constants/constants.dart';

class LogisticSrevice {
  const LogisticSrevice();

  // DetailScrapCompany
  static Future<List<User>> getScrapCompany({required int companyId}) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/logistic_by_companie/$companyId');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ${token}', 'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final list = data['data'] as List;

      return list.map((e) => User.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}
