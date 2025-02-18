class DialogNode {
  final String id;
  final String text;
  final String videoAsset;
  final int videoTimecode;
  final int timeLimit;
  final List<AnswerOption> options;

  DialogNode({
    required this.id,
    required this.text,
    required this.videoAsset,
    required this.videoTimecode,
    required this.timeLimit,
    required this.options,
  });

  factory DialogNode.fromJson(Map<String, dynamic> json) {
    return DialogNode(
      id: json['id'],
      text: json['text'],
      videoAsset: json['videoAsset'],
      videoTimecode: json['videoTimecode'],
      timeLimit: json['timeLimit'],
      options: (json['options'] as List)
          .map((option) => AnswerOption.fromJson(option))
          .toList(),
    );
  }
}

class AnswerOption {
  final String text;
  final int points;
  final String nextNodeId;

  AnswerOption({
    required this.text,
    required this.points,
    required this.nextNodeId,
  });

  factory AnswerOption.fromJson(Map<String, dynamic> json) {
    return AnswerOption(
      text: json['text'],
      points: json['points'],
      nextNodeId: json['nextNodeId'],
    );
  }
}
