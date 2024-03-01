import 'package:flutter/material.dart';
import 'package:last_bottle/google_wallet/domain/pass_content.dart';
import 'package:last_bottle/utils/sizes.dart';
import 'package:url_launcher/url_launcher.dart';

class FactCard extends StatelessWidget {
  const FactCard({
    super.key,
    required this.passContent,
  });

  final PassContent passContent;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          color: passContent.dartColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: Text(
                  passContent.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 4.0),
                child: Text(
                  "Did You Know?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  passContent.header,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  await launchUrl(Uri.parse(passContent.sourceUrl));
                },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: const Text(
                  "Learn More",
                  style: TextStyle(color: Colors.amber),
                ),
              ),
              gapH12,
              Image.network(
                passContent.imageUrl,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const SizedBox(
                    height: 100,
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Colors.white,
                    )),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
