import 'package:flutter/material.dart';
import 'package:recycle/google-wallet/data/google_wallet_repository.dart';
import 'package:recycle/google-wallet/domain/pass_data.dart';
import 'package:url_launcher/url_launcher.dart';

class AddToWalletButton extends StatelessWidget {
  const AddToWalletButton({super.key, required this.passType});

  final PassType passType;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        String? walletUrl = await GoogleWalletRepository().createPass(
          passType: passType,
        );
        await launchUrl(Uri.parse(walletUrl));
      },
      icon: Image.asset(
        "assets/images/google_wallet/en_add_button.png",
        height: 48,
      ),
    );
  }
}
