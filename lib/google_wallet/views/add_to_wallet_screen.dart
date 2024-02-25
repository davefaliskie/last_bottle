import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/google_wallet/domain/pass_content.dart';
import 'package:last_bottle/google_wallet/domain/pass_data.dart';
import 'package:last_bottle/google_wallet/views/add_to_wallet_button.dart';
import 'package:last_bottle/google_wallet/views/fact_card.dart';
import 'package:last_bottle/router.dart';
import 'package:last_bottle/utils/sizes.dart';
import 'package:last_bottle/widgets/floating_component.dart';

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
      body: AnimateGradient(
        duration: const Duration(seconds: 5),
        primaryColors: [
          passContent.bgColor.shade300,
          passContent.bgColor2.shade200,
          Colors.white,
        ],
        secondaryColors: [
          passContent.bgColor.shade700,
          passContent.bgColor2.shade700,
          Colors.white,
        ],
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    "New Fact Unlocked",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  FloatingComponent(
                    child: FactCard(
                      passContent: passContent,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  const Text(
                    "Add this fact to Google Wallet to share with your friends",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12.0,
                    ),
                  ),
                  gapH8,
                  AddToWalletButton(passType: passType),
                  gapH8,
                  TextButton(
                    onPressed: () {
                      context.goNamed(AppRoute.drinkWater.name);
                    },
                    child: const Text(
                      "Continue",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                  gapH32,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
