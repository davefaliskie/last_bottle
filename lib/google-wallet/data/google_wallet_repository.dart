import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:recycle/constants.dart';
import 'package:recycle/google-wallet/domain/pass_data.dart';

class GoogleWalletRepository {
  Future<String> createPassUrl({
    required String userId,
    required PassType passType,
  }) async {
    final passData = PassData(
      userId: userId,
      passType: passType,
    );
    debugPrint("url $backendBaseUrl");
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
