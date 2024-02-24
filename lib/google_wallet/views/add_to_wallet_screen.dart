import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/google_wallet/domain/pass_content.dart';
import 'package:last_bottle/google_wallet/domain/pass_data.dart';
import 'package:last_bottle/google_wallet/views/add_to_wallet_button.dart';
import 'package:last_bottle/router.dart';
import 'package:last_bottle/utils/sizes.dart';

class AddToWalletScreen extends StatelessWidget {
  const AddToWalletScreen({
    super.key,
    required this.passType,
  });

  final PassType passType;

  @override
  Widget build(BuildContext context) {
    final passContent = PassContent.fromPassType(passType);
    return Scaffold(
      backgroundColor: passContent.dartColor,
      body: Padding(
        padding: const EdgeInsets.all(defaultMargin),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                passContent.title,
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              Text(
                passContent.header,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              gapH24,
              Image.network(passContent.imageUrl),
              const Spacer(),
              Text(
                "Add to google wallet to share this fact with your friends",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              gapH8,
              AddToWalletButton(passType: passType),
              TextButton(
                onPressed: () {
                  context.goNamed(AppRoute.drinkWater.name);
                },
                child: const Text(
                  "Not Now",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
