import 'package:flutter/material.dart';
import 'package:last_bottle/google_wallet/domain/pass_type.dart';

@immutable
class PassContent {
  final PassType passType;
  final String color;
  final Color dartColor;
  final String imageAsset;
  final String imageUrl;
  final String imageDesc;
  final String imageDescJa;
  final String title;
  final String titleJa;
  final String header;
  final String headerJa;
  final String sourceUrl;

  const PassContent({
    required this.passType,
    required this.imageUrl,
    required this.imageDesc,
    required this.imageDescJa,
    required this.title,
    required this.titleJa,
    required this.header,
    required this.headerJa,
    required this.sourceUrl,
    required this.imageAsset,
    this.color = "#1A74D1",
    this.dartColor = const Color(0xFF1A74D1),
  });

  factory PassContent.fromPassType(PassType passType) {
    switch (passType) {
      case PassType.trash:
        return PassContent(
          passType: passType,
          imageAsset: "assets/images/google_wallet/trash.png",
          imageUrl: "https://last-bottle.s3.amazonaws.com/trash.png",
          imageDesc: "Landfill with a lot of plastic",
          imageDescJa: "プラスチックがたくさんある埋立地",
          title: "450-Year Decay",
          titleJa: "450年の分解期間",
          header:
              "It takes 450 years for average sized plastic water bottles to fully decompose.",
          headerJa: "平均サイズのプラスチック製水ボトルが完全に分解するまでには450年かかります。",
          sourceUrl:
              "https://www.liveabout.com/how-long-does-it-take-garbage-to-decompose-2878033",
        );

      case PassType.water:
        return PassContent(
          passType: passType,
          imageAsset: "assets/images/google_wallet/water.png",
          imageUrl: "https://last-bottle.s3.amazonaws.com/water.png",
          imageDesc: "Plastic water bottles floating in the ocean",
          imageDescJa: "海に浮かぶプラスチック製水ボトル",
          title: "57,000 Year Cleanup",
          titleJa: "57,000年のクリーンアップ",
          header:
              "The Great Pacific Garbage Patch has 1.8 Trillion Pieces of plastic. If we removed one piece per second it would take more than 57 thousand years to remove it all.",
          headerJa:
              "グレートパシフィックガーベージパッチには1.8兆個のプラスチック片があります。秒に1個ずつ取り除いたとしても、それをすべて取り除くのに5万7千年以上かかります。",
          sourceUrl:
              "https://www.npr.org/2020/03/31/822597631/plastic-wars-three-takeaways-from-the-fight-over-the-future-of-plastics",
        );

      case PassType.fire:
        return PassContent(
          passType: passType,
          imageAsset: "assets/images/google_wallet/fire.png",
          imageUrl: "https://last-bottle.s3.amazonaws.com/fire.png",
          imageDesc: "Fire",
          imageDescJa: "火事",
          title: "Toxic Flames",
          titleJa: "有毒な炎",
          header:
              "Plastic is almost entirely made from oil and gas. So burning it is essentially burning fossil fuels. For every tonne of dense plastic burned, two tonnes of CO2 is released.",
          headerJa:
              "プラスチックはほぼ完全に石油とガスから作られています。そのため、それを燃やすことは、事実上化石燃料を燃やすことになります。密度の高いプラスチック1トンを燃やすごとに、2トンのCO2が放出されます。",
          sourceUrl:
              "https://www.greenpeace.org.uk/news/incineration-burning-plastic-crisis/",
        );

      case PassType.turtle:
        return PassContent(
          passType: passType,
          imageAsset: "assets/images/google_wallet/turtle.png",
          imageUrl: "https://last-bottle.s3.amazonaws.com/turtle.png",
          imageDesc: "Sea Turtle appearing to frown",
          imageDescJa: "しかめっ面をしているように見えるウミガメ",
          title: "Turtle Hazard",
          titleJa: "ウミガメの危険",
          header:
              "52% of sea turtles across the globe have some plastic in their guts and just one small piece that gets trapped in the wrong place can lead to death.",
          headerJa:
              "世界中のウミガメの52%が何らかの形で腸内にプラスチックを含んでおり、小さな一片が間違った場所に詰まるだけで死に至ることがあります。",
          sourceUrl: "https://oceanblueproject.org/sea-turtle-facts/",
        );

      case PassType.recycle:
        return PassContent(
          passType: passType,
          imageAsset: "assets/images/google_wallet/recycle.png",
          imageUrl: "https://last-bottle.s3.amazonaws.com/recycle.png",
          imageDesc: "Plastic resin code chart",
          imageDescJa: "プラスチック樹脂コード表",
          title: "Misleading Symbols",
          titleJa: "誤解を招く記号",
          header:
              "Many view the plastic resin code as a sign of recyclability, yet most plastics aren't recycled. Only types #1 & #2 are commonly processed; others typically don't get recycled.",
          headerJa:
              "多くの人々がプラスチック樹脂コードをリサイクルのしるしとして認識していますが、実際にはほとんどのプラスチックがリサイクルされていません。タイプ#1と#2だけが一般的に処理され、その他のタイプはほとんどリサイクルされません。",
          sourceUrl:
              "https://plasticactioncentre.ca/directory/plastic-by-the-numbers/",
        );

      case PassType.recycleSuccess:
        return PassContent(
          passType: passType,
          imageAsset: "assets/images/google_wallet/reuse.png",
          imageUrl: "https://last-bottle.s3.amazonaws.com/reuse.png",
          imageDesc: "Dead end with recycling symbol",
          imageDescJa: "リサイクルマークの行き止まり",
          title: "Recycling Dead-End",
          titleJa: "リサイクルの袋小路",
          header:
              "The vast majority of all plastic produced can't be or won't be recycled. The plastics industry promoted recycling to keep plastic bans at bay.",
          headerJa:
              "生産されたプラスチックの大部分はリサイクルできないか、またはリサイクルされません。プラスチック産業は、プラスチック禁止措置を抑えるためにリサイクルを推進してきました。",
          sourceUrl:
              "https://www.npr.org/2020/03/31/822597631/plastic-wars-three-takeaways-from-the-fight-over-the-future-of-plastics",
        );
    }
  }
}
