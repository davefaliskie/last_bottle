import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/google_wallet/domain/pass_data.dart';

class GoogleWalletRepository {
  Future<String> createPassUrl({
    required String userId,
    required PassType passType,
  }) async {
    final passDataJson = PassData(
      userId: userId,
      passType: passType,
    ).toJson();

    final response = await http.post(
      Uri.parse("$backendBaseUrl/create_pass/"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
      },
      body: jsonEncode(passDataJson),
    );

    debugPrint(jsonDecode(response.body)["url"]);
    return jsonDecode(response.body)["url"];
  }
}
