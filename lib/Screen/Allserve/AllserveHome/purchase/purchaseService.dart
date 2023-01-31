import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Models/Purchase/purchase.dart';
import '../../../../Models/User/user.dart';
import '../../../../Models/detailVendor.dart';
import '../../../../constants/constants.dart';

class PurchaseSrevice {
  const PurchaseSrevice();

  // DetailPurchaseCompany
  static Future<List<User>> getPurchaseCompany({required int companyId}) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/purchase_by_companie/$companyId');

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

  // DetailQuotationPurchase
  static Future<Purchase?> getQuotatianPurchase({required int itemId}) async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/get_purchase_quotation_by_order/$itemId');

    final response =
        await http.get(url, headers: {'Authorization': 'Bearer ${token}', 'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return Purchase.fromJson(data['data']);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  // เพิ่มรายการสินค้า Purchase
  Future<Purchase?> postListPurchase({
    required String user_id,
    required String name,
    required String qty,
    required String description,
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
        "qty": qty,
        "description": description,
        "expire_hour": expire_hour,
        'images[]': filesList,
        // 'images': MultipartFile.fromFileSync(images.path!),
      },
    );
    try {
      final response = await Dio().post('$baseUrl/api/purchase', data: formData, options: Options(headers: headers));

      return Purchase.fromJson(response.data['data']);
    } on DioError catch (e) {
      throw (e.response?.data['message']);
    }
  }

  //โหลดรายละเอียด VendorPurchase
  static Future<List<DetailVendor>> getVendorPurchase() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final url = Uri.parse('$baseUrl/api/get_purchase_services');

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
