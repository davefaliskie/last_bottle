import 'package:last_bottle/google_wallet/domain/pass_content.dart';

enum PassType {
  water,
  trash,
  recycle,
}

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
      "title": passContent.title,
      "header": passContent.header,
    };
  }
}
