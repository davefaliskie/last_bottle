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
  final PassType passType;

  const PassContent({
    required this.imageUrl,
    required this.imageDesc,
    required this.title,
    required this.header,
    required this.sourceUrl,
    required this.passType,
    this.color = "#1A74D1",
    this.dartColor = const Color(0xFF1A74D1),
  });

  factory PassContent.fromPassType(PassType passType) {
    switch (passType) {
      case PassType.trash:
        return PassContent(
          imageUrl: "https://last-bottle.s3.amazonaws.com/trash.png",
          imageDesc: "Landfill with a lot of plastic",
          title: "450-Year Decay",
          header:
              "It takes 450 years for average sized plastic water bottles to fully decompose.",
          sourceUrl:
              "https://www.liveabout.com/how-long-does-it-take-garbage-to-decompose-2878033",
          passType: passType,
        );

      case PassType.water:
        return PassContent(
          imageUrl: "https://last-bottle.s3.amazonaws.com/water.png",
          imageDesc: "Plastic water bottles floating in the ocean",
          title: "57,000 Year Cleanup",
          header:
              "Great Pacific Garbage Patch has 1.8 Trillion Pieces of plastic. If we removed one piece per second it would take more than 57 thousand years to remove it all.",
          sourceUrl:
              "https://www.npr.org/2020/03/31/822597631/plastic-wars-three-takeaways-from-the-fight-over-the-future-of-plastics",
          passType: passType,
        );

      case PassType.fire:
        return PassContent(
          imageUrl: "https://last-bottle.s3.amazonaws.com/fire.png",
          imageDesc: "Fire",
          title: "Toxic Flames",
          header:
              "Plastic is almost entirely made from oil and gas. So burning it is essentially burning fossil fuels. For every tonne of dense plastic burned, two tonnes of CO2 is released.",
          sourceUrl:
              "https://www.greenpeace.org.uk/news/incineration-burning-plastic-crisis/",
          passType: passType,
        );

      case PassType.turtle:
        return PassContent(
          imageUrl: "https://last-bottle.s3.amazonaws.com/turtle.png",
          imageDesc: "Sea Turtle appearing to frown",
          title: "Turtle Hazard",
          header:
              "52% of sea turtles across the globe have some plastic in their guts and just one small piece that gets trapped in the wrong place can lead to death.",
          sourceUrl: "https://oceanblueproject.org/sea-turtle-facts/",
          passType: passType,
        );

      case PassType.recycle:
        return PassContent(
          imageUrl: "https://last-bottle.s3.amazonaws.com/recycle.png",
          imageDesc: "Plast resin code chart",
          title: "Misleading Symbols",
          header:
              "Many view the plastic resin code as a sign of recyclability, yet most plastics aren't recycled. Only types #1 & #2 are commonly processed; others typically don't get recycled.",
          sourceUrl:
              "https://plasticactioncentre.ca/directory/plastic-by-the-numbers/",
          passType: passType,
        );

      case PassType.recycleSuccess:
        return PassContent(
          imageUrl: "https://last-bottle.s3.amazonaws.com/reuse.png",
          imageDesc: "Dead end with recycling symbol",
          title: "Plastic Illusion",
          header:
              "The vast majority of all plastic produced can't be or won't be recycled. The plastics industry promoted recycling to keep plastic bans at bay.",
          sourceUrl:
              "https://www.npr.org/2020/03/31/822597631/plastic-wars-three-takeaways-from-the-fight-over-the-future-of-plastics",
          passType: passType,
        );
    }
  }
}
