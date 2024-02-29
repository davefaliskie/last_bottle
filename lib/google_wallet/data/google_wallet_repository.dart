import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:last_bottle/constants.dart';
import 'package:last_bottle/google_wallet/domain/pass_data.dart';
import 'package:last_bottle/google_wallet/domain/pass_type.dart';

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

    return jsonDecode(response.body)["url"];
  }
}
