import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recycle/google_wallet/domain/pass_content.dart';
import 'package:recycle/google_wallet/domain/pass_data.dart';
import 'package:recycle/google_wallet/views/add_to_wallet_button.dart';
import 'package:recycle/local_data/hive_repository.dart';
import 'package:recycle/router.dart';
import 'package:recycle/utils/sizes.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "New Fact",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              "Did you know?",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Consumer(
              builder: (context, ref, child) {
                final userId = ref.watch(hiveRepositoryProvider).userId;
                return Text("userId: $userId");
              },
            ),
            gapH32,
            AddToWalletButton(passType: passType),
            TextButton(
              onPressed: () {
                context.goNamed(AppRoute.drinkWater.name);
              },
              child: const Text("Not Now"),
            ),
          ],
        ),
      ),
    );
  }
}
