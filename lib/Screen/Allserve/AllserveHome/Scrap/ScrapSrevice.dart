import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Models/Scrap/scrap.dart';
import '../../../../Models/User/user.dart';
import '../../../../Models/vendor.dart';
import '../../../../Models/vendorPage.dart';
import '../../../../constants/constants.dart';

class ScrapSrevice {
  const ScrapSrevice();

  //โหลด Scrap มาแสดงทั้งหมด
  static Future<List<Scrap>> getScrap() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/get_scrap');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ${token}', 'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final list = data['data'] as List;

      return list.map((e) => Scrap.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  // DetailScrapCompany
  static Future<List<User>> getScrapCompany({required int companyId}) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/scrap_by_companie/$companyId');

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

  //เรียกบริษัท Vendor เป็น Type
  static Future<List<Vendor>> getCompanyVendor({
    int? draw = 1,
    int? length = 10,
    String? status,
    String? type,
    String? columns,
    String? order,
    int? start = 0,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/vendor_page');
    final response = await http.post(url,
        body: json.encode({
          "draw": draw,
          "status": "",
          "type": type,
          "columns": [
            {"data": "No"},
            {"data": "name"},
            {"data": "create_by"},
            {"data": "update_by"},
            {"data": "created_at"},
            {"data": "updated_at"},
            {"data": "action"}
          ],
          "order": [
            {"column": 0, "dir": "asc"}
          ],
          "start": start,
          "length": length,
          "search": {"value": "", "regex": false}
        }),
        headers: {'Authorization': 'Bearer ${token}', 'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final responseString = jsonDecode(response.body);
      final list = responseString['data']['data'] as List;
      return list.map((e) => Vendor.fromJson(e)).toList();
    } else {
      final responseString = jsonDecode(response.body);
      throw responseString['message'];
    }
  }

  // เพิ่มรายการสินค้า Scrap
  Future<Scrap?> postListScrap({
    required String user_id,
    required String name,
    required String qty,
    required String description,
    required PlatformFile images,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // final files = file.map((e) => MultipartFile.fromFileSync(e.path!)).toList();
    final token = pref.getString('token');
    final headers = {'Authorization': 'Bearer $token', 'Content-Type': 'multipart/form-data'};
    final formData = FormData.fromMap(
      {
        "user_id": user_id,
        "name": name,
        "qty": qty,
        "description": description,
        'images': MultipartFile.fromFileSync(images.path!),
      },
    );
    try {
      final response = await Dio().post('$baseUrl/api/scrap', data: formData, options: Options(headers: headers));

      return Scrap.fromJson(response.data['data']);
    } on DioError catch (e) {
      throw (e.response?.data['message']);
    }
  }

  // เรียกบริษัท Vendor ตามID
  static Future<Vendor?> getVendorId({required int vendorId}) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/vendor/$vendorId');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ${token}', 'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return Vendor.fromJson(data['data']);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  // DetailQuotationScrap
  static Future<Scrap?> getQuotatianScrap({required int itemId}) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/get_scrap_quotation_by_order/$itemId');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ${token}', 'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return Scrap.fromJson(data['data']);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}
