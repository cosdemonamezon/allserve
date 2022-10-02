import 'dart:convert';
import 'package:allserve/constants/constants.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RegisterApi {
  const RegisterApi();

  static register({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    required String phone,
  }) async {
    try {
      final url = Uri.https(publicUrl, 'api/public/api/user_job');
      final response = await http.post(url, body: {
        'permission_id': '1',
        'username': email,
        'password': password,
        'name': firstname + ' ' + lastname,
        'email': email,
        'phone': phone,
        'type': "customer",
        'line_token': "",
      });
      if (response.statusCode == 200) {
        final data = convert.jsonDecode(response.body);

        return data;
        //print(await response.stream.bytesToString());
      } else {
        final error = convert.jsonDecode(response.body);
        return error;
        //print(response.reasonPhrase);
      }
    } catch (e) {}
  }
}
