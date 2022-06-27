import 'dart:convert';

import 'package:http/http.dart' as http;

class RegisterApi {
  const RegisterApi();

  static register({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
  }) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse('http://localhost:3000/api/auth/sign-up'));
      request.body = json.encode({
        "email": email,
        "password": password,
        "firstName": firstname,
        "lastName": lastname
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        final resdata = await response.stream.bytesToString();
        Map<String, dynamic> response_json = json.decode(resdata);
        response_json['status_api'] = true;
        return response_json;
        //print(await response.stream.bytesToString());
      } else {
        final resdata = await response.stream.bytesToString();
        Map<String, dynamic> response_json = json.decode(resdata);
        response_json['status_api'] = false;
        return response_json;
        //print(response.reasonPhrase);
      }
    } catch (e) {}
    
  }
}
