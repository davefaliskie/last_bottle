import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recycle/google_wallet/domain/pass_data.dart';
import 'package:recycle/google_wallet/views/add_to_wallet_button.dart';
import 'package:recycle/local_data/hive_repository.dart';

class AddToWalletScreen extends StatelessWidget {
  const AddToWalletScreen({
    super.key,
    required this.passType,
  });

  final PassType passType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            AddToWalletButton(passType: passType),
          ],
        ),
      ),
    );
  }
}
