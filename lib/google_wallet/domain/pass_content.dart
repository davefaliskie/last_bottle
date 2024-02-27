import 'package:flutter/material.dart';
import 'package:last_bottle/google_wallet/domain/pass_type.dart';

@immutable
class PassContent {
  final String color;
  final Color dartColor;
  final String imageUrl;
  final String imageDesc;
  final String title;
  final String header;
  final String sourceUrl;

  const PassContent({
    required this.imageUrl,
    required this.imageDesc,
    required this.title,
    required this.header,
    required this.sourceUrl,
    this.color = "#1A74D1",
    this.dartColor = const Color(0xFF1A74D1),
  });

  factory PassContent.fromPassType(PassType passType) {
    switch (passType) {
      case PassType.trash:
        return const PassContent(
          imageUrl: "https://images.unsplash.com/photo-1558640476-437a2b9438a2",
          imageDesc: "Floating Water Bottle",
          title: "Recycled",
          header: "Only 9% of all plastic water bottles get recycled",
          sourceUrl: "https://lastbottle.com/recycle",
        );

      case PassType.water:
        return const PassContent(
          imageUrl: "https://images.unsplash.com/photo-1558640476-437a2b9438a2",
          imageDesc: "Floating Water Bottle",
          title: "The 57,000 Year Cleanup",
          header:
              "The Great Pacific Garbage Patch contains 1.8 trillion pieces of plastic, removing one piece per second would take over 57,000 years.",
          sourceUrl: "https://lastbottle.com/water",
        );

      case PassType.fire:
        return const PassContent(
          imageUrl:
              "https://images.unsplash.com/photo-1674321576323-82be6b715ebd",
          imageDesc: "Fire",
          title: "Fire",
          header: "22% of all plastic water bottles end up in landfills",
          sourceUrl: "https://lastbottle.com/landfill",
        );

      case PassType.turtle:
        return const PassContent(
          imageUrl:
              "https://images.unsplash.com/photo-1674321576323-82be6b715ebd",
          imageDesc: "Landfill",
          title: "Bottles In Landfill",
          header: "22% of all plastic water bottles end up in landfills",
          sourceUrl: "https://lastbottle.com/landfill",
        );

      case PassType.recycle:
        return const PassContent(
          imageUrl:
              "https://images.unsplash.com/photo-1674321576323-82be6b715ebd",
          imageDesc: "Landfill",
          title: "Bottles In Landfill",
          header: "22% of all plastic water bottles end up in landfills",
          sourceUrl: "https://lastbottle.com/landfill",
        );

      case PassType.recycleSuccess:
        return const PassContent(
          imageUrl:
              "https://images.unsplash.com/photo-1674321576323-82be6b715ebd",
          imageDesc: "Landfill",
          title: "Bottles In Landfill",
          header: "22% of all plastic water bottles end up in landfills",
          sourceUrl: "https://lastbottle.com/landfill",
        );
    }
  }
}
