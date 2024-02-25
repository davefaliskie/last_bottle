import 'package:flutter/material.dart';
import 'package:last_bottle/google_wallet/domain/pass_data.dart';

@immutable
class PassContent {
  final String color;
  final Color dartColor;
  final String imageUrl;
  final String imageDesc;
  final String title;
  final String header;
  final String sourceUrl;
  final MaterialColor bgColor;
  final MaterialAccentColor bgColor2;

  const PassContent({
    required this.color,
    required this.dartColor,
    required this.imageUrl,
    required this.imageDesc,
    required this.title,
    required this.header,
    required this.sourceUrl,
    this.bgColor = Colors.blue,
    this.bgColor2 = Colors.blueAccent,
  });

  factory PassContent.fromPassType(PassType passType) {
    switch (passType) {
      case PassType.water:
        return const PassContent(
          color: "#32a852",
          dartColor: Color(0xFF32a852),
          bgColor: Colors.amber,
          bgColor2: Colors.amberAccent,
          imageUrl: "https://images.unsplash.com/photo-1558640476-437a2b9438a2",
          imageDesc: "Floating Water Bottle",
          title: "Bottles In Water",
          header: "53% of all plastic water bottles end up in the ocean.",
          sourceUrl: "https://lastbottle.com/water",
        );

      case PassType.trash:
        return const PassContent(
          color: "#4287f5",
          dartColor: Color(0xFF4287f5),
          imageUrl:
              "https://images.unsplash.com/photo-1674321576323-82be6b715ebd",
          imageDesc: "Landfill",
          title: "Bottles In Landfill",
          header: "22% of all plastic water bottles end up in landfills",
          sourceUrl: "https://lastbottle.com/landfill",
        );

      case PassType.recycle:
        return const PassContent(
          color: "#7069f0",
          dartColor: Color(0xFF7069f0),
          imageUrl: "https://images.unsplash.com/photo-1558640476-437a2b9438a2",
          imageDesc: "Floating Water Bottle",
          title: "Recycled",
          header: "Only 9% of all plastic water bottles get recycled",
          sourceUrl: "https://lastbottle.com/recycle",
        );
    }
  }
}
