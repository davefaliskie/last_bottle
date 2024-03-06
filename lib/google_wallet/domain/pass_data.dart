import 'package:last_bottle/google_wallet/domain/pass_content.dart';
import 'package:last_bottle/google_wallet/domain/pass_type.dart';

class PassData {
  final String userId;
  final PassType passType;

  const PassData({
    required this.userId,
    required this.passType,
  });

  Map<String, String> toJson() {
    final passContent = PassContent.fromPassType(passType);
    return {
      "user_id": "${userId}_${passType.name}",
      "pass_type": passType.name,
      "color": passContent.color,
      "image_url": passContent.imageUrl,
      "image_desc": passContent.imageDesc,
      "image_desc_ja": passContent.imageDescJa,
      "title": passContent.title,
      "title_ja": passContent.titleJa,
      "header": passContent.header,
      "header_ja": passContent.headerJa,
      "source_url": passContent.sourceUrl,
    };
  }
}
