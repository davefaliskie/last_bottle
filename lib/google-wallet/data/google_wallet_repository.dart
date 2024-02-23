import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:recycle/constants.dart';

class GoogleWalletRepository {
  // for testing create the pass object

  Future<String> createPass() async {
    final Map<String, String> body = {
      "user_id": "user111",
      "pass_type": "pass1",
    };

    final response = await http.post(
      Uri.parse("$backendBaseUrl/create_pass/"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
      },
      body: jsonEncode(body),
    );

    debugPrint(jsonDecode(response.body)["url"]);
    return jsonDecode(response.body)["url"];
  }
}
