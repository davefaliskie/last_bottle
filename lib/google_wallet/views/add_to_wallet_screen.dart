import 'package:animate_gradient/animate_gradient.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:last_bottle/constants.dart';
import 'package:last_bottle/google_wallet/domain/pass_content.dart';
import 'package:last_bottle/google_wallet/domain/pass_type.dart';
import 'package:last_bottle/google_wallet/views/add_to_wallet_button.dart';
import 'package:last_bottle/google_wallet/views/fact_card.dart';
import 'package:last_bottle/localization/app_localizations_context.dart';
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
          Colors.white,
          Colors.blue.shade400,
        ],
        secondaryColors: [
          Colors.white,
          Colors.blue.shade100,
        ],
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  AutoSizeText(
                    context.loc.walletScreenTitle,
                    style: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                  ),
                  const Spacer(),
                  FloatingComponent(
                    child: FactCard(
                      passContent: passContent,
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    context.loc.walletBtnLabel,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12.0,
                    ),
                  ),
                  gapH8,
                  AddToWalletButton(passType: passType),
                  gapH8,
                  TextButton(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.goNamed(AppRoute.menu.name);
                      }
                    },
                    child: Text(
                      context.loc.close,
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
