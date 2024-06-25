class Intent {
  final String tag;
  final List<String> patterns;
  final List<String> responses;

  Intent({required this.tag, required this.patterns, required this.responses});

  factory Intent.fromJson(Map<String, dynamic> json) {
    return Intent(
      tag: json['tag'],
      patterns: List<String>.from(json['patterns']),
      responses: List<String>.from(json['responses']),
    );
  }
}
