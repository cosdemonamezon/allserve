import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Models/Logistic/logistic.dart';
import '../../../../Models/User/user.dart';
import '../../../../Models/detailVendor.dart';
import '../../../../constants/constants.dart';

class LogisticSrevice {
  const LogisticSrevice();

  // DetailLogisticCompany
  static Future<List<User>> getLogisticCompany({required int companyId}) async {
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

  // DetailQuotationLogistic
  static Future<Logistic?> getQuotatianLogistic({required int itemId}) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/get_logistic_quotation_by_order/$itemId');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ${token}', 'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return Logistic.fromJson(data['data']);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  // เพิ่มรายการสินค้า Logistic
  Future<Logistic?> postListLogistic({
    required String user_id,
    required String name,
    required String width,
    required String height,
    required String weight,
    required String qty,
    required String description,
    required String transport_type,
    required String start_lat,
    required String start_lon,
    required String start_location,
    required String end_lat,
    required String end_lon,
    required String end_location,
    required String expire_hour,
    // required PlatformFile images,
    required List<PlatformFile> images,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final filesList = images.map((e) => MultipartFile.fromFileSync(e.path!)).toList();
    final token = pref.getString('token');
    final headers = {'Authorization': 'Bearer $token', 'Content-Type': 'multipart/form-data'};
    final formData = FormData.fromMap(
      {
        "user_id": user_id,
        "name": name,
        "width": width,
        "height": height,
        "weight": weight,
        "qty": qty,
        "description": description,
        "transport_type": transport_type,
        "start_lat": start_lat,
        "start_lon": start_lon,
        "start_location": start_location,
        "end_lat": end_lat,
        "end_lon": end_lon,
        "end_location": end_location,
        "expire_hour": expire_hour,
        'images[]': filesList,
        // 'images[]': MultipartFile.fromFileSync(images.path!),
      },
    );
    try {
      final response = await Dio().post('$baseUrl/api/logistic', data: formData, options: Options(headers: headers));

      return Logistic.fromJson(response.data['data']);
    } on DioError catch (e) {
      throw (e.response?.data['message']);
    }
  }

  //โหลดรายละเอียด VendorLogistic
  static Future<List<DetailVendor>> getVendorLogistic() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/get_logistic_services');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ${token}', 'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final list = data['data'] as List;

      return list.map((e) => DetailVendor.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}
