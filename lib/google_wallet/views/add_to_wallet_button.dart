import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_bottle/google_wallet/data/google_wallet_repository.dart';
import 'package:last_bottle/google_wallet/domain/pass_data.dart';
import 'package:last_bottle/local_data/hive_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class AddToWalletButton extends ConsumerWidget {
  const AddToWalletButton({super.key, required this.passType});

  final PassType passType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(hiveRepositoryProvider).userId;

    return IconButton(
      onPressed: () async {
        String? walletUrl = await GoogleWalletRepository().createPassUrl(
          userId: userId,
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
