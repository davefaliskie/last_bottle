import 'package:flutter/material.dart';
import 'package:recycle/google-wallet/data/google_wallet_repository.dart';
import 'package:recycle/google-wallet/domain/pass_data.dart';
import 'package:url_launcher/url_launcher.dart';

class AddToWalletButton extends StatelessWidget {
  const AddToWalletButton({super.key, required this.passType});

  final PassType passType;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        debugPrint("Add this to the wallet");
        String? walletUrl = await GoogleWalletRepository().createPass(
          passType: passType,
        );
        launchUrl(Uri.parse(walletUrl));
      },
      child: Text("add ${passType.name} to wallet"),
    );
  }
}
