class Task {
  final String text;
  bool isCompleted;

  Task({
    required this.text,
    required this.isCompleted,
  });

  // Convert Task to Map for storage
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'isCompleted': isCompleted,
    };
  }

  // Convert Map to Task when loading from storage
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      text: map['text'],
      isCompleted: map['isCompleted'],
    );
  }
}
