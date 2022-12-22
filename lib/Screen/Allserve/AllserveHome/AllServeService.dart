import 'dart:convert';

import 'package:allserve/Models/User/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../../Models/User/recruitmentcompanies.dart';
import '../../../Models/UserJob/userJob.dart';
import '../../../constants/constants.dart';

class JobService {
  const JobService();

//โหลด User มาแสดงทั้งหมด
  static Future<List<UserJob>> getUserAllJob() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/get_user_job');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ${token}', 'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final list = data['data'] as List;

      return list.map((e) => UserJob.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

// DetailUserJob
  static Future<UserJob?> getUserIdJob({required int userId}) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/user_job/$userId');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ${token}', 'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return UserJob.fromJson(data['data']);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

//โหลดPosition ของUser
  static Future<List<User>> getPosition({required int companyId}) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/recruitment_by_companie/$companyId');

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

//เพิ่มตำแหน่งงานที่ company
  Future<Recruitmentcompanies?> postRecruitment({
    String? user_id,
    String? position,
    String? salary,
    String? exp,
    String? major,
    String? degree,
    String? qty,
    String? description,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/recruitment');
    final response = await http.post(url,
        body: jsonEncode({
          "user_id": user_id,
          "position": position == "" ? '-' : position,
          "salary": salary == "" ? '-' : salary,
          "exp": exp == "" ? '-' : exp,
          "major": major == "" ? '-' : major,
          "degree": degree == "" ? '-' : degree,
          "qty": qty == "" ? '-' : qty,
          "description": description == "" ? '-' : description,
        }),
        headers: {
          'Authorization': 'Bearer ${token}',
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      final responseString = jsonDecode(response.body);
      return Recruitmentcompanies.fromJson(responseString["data"]);
    } else {
      final responseString = jsonDecode(response.body);
      throw responseString['message'];
    }
  }
}
