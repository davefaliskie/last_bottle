import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_bottle/google_wallet/data/google_wallet_repository.dart';
import 'package:last_bottle/google_wallet/domain/pass_type.dart';
import 'package:last_bottle/local_data/data/hive_repository.dart';
import 'package:last_bottle/router.dart';
import 'package:url_launcher/url_launcher.dart';

class AddToWalletButton extends ConsumerWidget {
  const AddToWalletButton({super.key, required this.passType});

  final PassType passType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(hiveRepositoryProvider).userId;
    String imagePath = "assets/images/google_wallet/en_add_button.png";

    if (Localizations.localeOf(context).languageCode == "ja") {
      imagePath = "assets/images/google_wallet/ja_add_button.png";
    }

    return IconButton(
      onPressed: () async {
        String? walletUrl = await GoogleWalletRepository().createPassUrl(
          userId: userId,
          passType: passType,
        );
        await launchUrl(Uri.parse(walletUrl));
        // redirect to menu when returning to the app
        ref.read(goRouterProvider).goNamed(AppRoute.menu.name);
      },
      icon: Image.asset(
        imagePath,
        height: 48,
      ),
    );
  }
}
