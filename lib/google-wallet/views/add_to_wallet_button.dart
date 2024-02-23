import 'package:flutter/material.dart';
import 'package:recycle/google-wallet/data/google_wallet_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class AddToWalletButton extends StatelessWidget {
  const AddToWalletButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        debugPrint("Add this to the wallet");
        String? walletUrl = await GoogleWalletRepository().createPass();
        launchUrl(Uri.parse(walletUrl));
      },
      child: const Text("add to wllet"),
    );
  }
}
