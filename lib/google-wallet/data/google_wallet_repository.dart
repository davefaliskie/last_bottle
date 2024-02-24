import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:recycle/constants.dart';
import 'package:recycle/google-wallet/domain/pass_data.dart';

class GoogleWalletRepository {
  // for testing create the pass object

  Future<String> createPass({required PassType passType}) async {
    // todo generate uuid and save to local db
    final passData = PassData(
      userId: "1111111",
      passType: passType,
    );

    final response = await http.post(
      Uri.parse("$backendBaseUrl/create_pass/"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
      },
      body: jsonEncode(passData.toJson()),
    );

    debugPrint(jsonDecode(response.body)["url"]);
    return jsonDecode(response.body)["url"];
  }
}
