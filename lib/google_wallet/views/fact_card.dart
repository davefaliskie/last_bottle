import 'package:flutter/material.dart';
import 'package:last_bottle/google_wallet/domain/pass_content.dart';
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
                    const EdgeInsets.only(left: 12.0, top: 12.0, right: 10.0),
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
                padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 4.0),
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
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 12.0, bottom: 4.0),
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
                child: const Padding(
                  padding: EdgeInsets.only(left: 2.0),
                  child: Text(
                    "Learn More",
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
              ),
              Image.asset(passContent.imageAsset),
            ],
          ),
        ),
      ),
    );
  }
}
