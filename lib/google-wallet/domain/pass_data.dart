enum PassType { water, trash, recycle }

class PassData {
  final String userId;
  final PassType passType;

  const PassData({
    required this.userId,
    required this.passType,
  });

  Map<String, String> toJson() {
    return {
      "user_id": "${userId}_${passType.name}",
      "pass_type": passType.name,
    };
  }
}
